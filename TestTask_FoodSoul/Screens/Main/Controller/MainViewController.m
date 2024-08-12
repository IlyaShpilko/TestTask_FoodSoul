//
//  ViewController.m
//  TestProject
//
//  Created by Ilya Shpilko on 8/2/24.
//

#import "TestTask_FoodSoul-Swift.h"
#import "MainViewController.h"
#import "FBSDKCoreKit/FBSDKCoreKit.h"

@interface MainViewController (uiviewcontro)

@end

@implementation MainViewController {
    MainModel *model;
    UIView *contentView;
    ProvideBuyView *provideBuyView;
    PromotionCollectionView *promotionCollectionView;
    FilterCollectionView *filterCollectionView;
    UILabel *assortmentTitle;
    AssortmentCollectionView *assortmentCollectionView;
}

- (void)loadView {
    [super loadView];
    [self setModel];
    [self setBaseSettings];
    [self addScrollView];
    [self addProvideView: model.inset];
    [self addPromotion: model.inset];
    [self addFilterCollection: model.inset];
    [self addAssortmentCollection: model.inset];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [model setStartSettings];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    provideBuyView.needChange = YES;
}

-(void)setBaseSettings {
    self.view.backgroundColor = [[ObjcColor alloc] initWithType:ColorTypeDarkBlueProg].color;
    if ([self.navigationController isKindOfClass: [NavigationController class]]) {
        [(NavigationController*)self.navigationController setItemDelegate:self];
    }
}

-(void)setModel {
    model = [MainModel new];
    [model setDelegate: self];
}

-(void)addScrollView {
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    [scrollView setShowsVerticalScrollIndicator: FALSE];
    [self.view addSubview: scrollView];
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [scrollView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [scrollView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    [scrollView.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [scrollView.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
    
    contentView = [UIView new];
    contentView.backgroundColor = [UIColor clearColor];
    [scrollView addSubview: contentView];
    
    contentView.translatesAutoresizingMaskIntoConstraints = false;
    [contentView.topAnchor constraintEqualToAnchor: scrollView.topAnchor].active = YES;
    [contentView.bottomAnchor constraintEqualToAnchor: scrollView.bottomAnchor].active = YES;
    [contentView.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [contentView.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
}

-(void)addProvideView: (CGFloat)inset {
    provideBuyView = [ProvideBuyView new];
    [provideBuyView setDelegate:self];
    [contentView addSubview:provideBuyView];
    provideBuyView.translatesAutoresizingMaskIntoConstraints = false;
    [provideBuyView.topAnchor constraintEqualToAnchor: contentView.topAnchor constant: inset].active = YES;
    [provideBuyView.leadingAnchor constraintEqualToAnchor: contentView.leadingAnchor constant: inset].active = YES;
    [provideBuyView.trailingAnchor constraintEqualToAnchor: contentView.trailingAnchor constant: -inset].active = YES;
    [provideBuyView updateWithModel: model.provide];
}

-(void) addPromotion: (CGFloat)inset {
    promotionCollectionView = [[PromotionCollectionView alloc] initWithInset: inset];
    [promotionCollectionView setPromoDelegate:self];
    [contentView addSubview: promotionCollectionView];
    promotionCollectionView.translatesAutoresizingMaskIntoConstraints = false;
    [promotionCollectionView.topAnchor constraintEqualToAnchor: provideBuyView.bottomAnchor constant: inset].active = YES;
    [promotionCollectionView.leadingAnchor constraintEqualToAnchor: contentView.leadingAnchor].active = YES;
    [promotionCollectionView.trailingAnchor constraintEqualToAnchor: contentView.trailingAnchor].active = YES;
    [promotionCollectionView.heightAnchor constraintEqualToConstant:180].active = YES;
    [promotionCollectionView setItems: [PromotionModel new].items];
}

-(void)addFilterCollection: (CGFloat) inset {
    filterCollectionView = [[FilterCollectionView alloc] initWithInset: inset];
    [contentView addSubview:filterCollectionView];
    filterCollectionView.translatesAutoresizingMaskIntoConstraints = false;
    [filterCollectionView.topAnchor constraintEqualToAnchor: promotionCollectionView.bottomAnchor constant: 20.0].active = YES;
    [filterCollectionView.leadingAnchor constraintEqualToAnchor: contentView.leadingAnchor].active = YES;
    [filterCollectionView.trailingAnchor constraintEqualToAnchor: contentView.trailingAnchor].active = YES;
    [filterCollectionView setFilterDelegate:self];
    filterCollectionView.items = model.filters;
}

-(void)addAssortmentCollection: (CGFloat) inset {
    assortmentTitle = [[LabelBuilder alloc] initWith: TitleLabel].build;
    [contentView addSubview: assortmentTitle];
    assortmentTitle.translatesAutoresizingMaskIntoConstraints = false;
    
    assortmentCollectionView = [[AssortmentCollectionView alloc] initWithInset:inset];
    [contentView addSubview: assortmentCollectionView];
    assortmentCollectionView.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:
         @[
        [assortmentTitle.topAnchor constraintEqualToAnchor:filterCollectionView.bottomAnchor constant: inset * 2],
        [assortmentTitle.leadingAnchor constraintEqualToAnchor:filterCollectionView.leadingAnchor constant: inset],
        [assortmentTitle.trailingAnchor constraintEqualToAnchor:filterCollectionView.trailingAnchor constant: -inset],
        
        [assortmentCollectionView.topAnchor constraintEqualToAnchor: assortmentTitle.bottomAnchor constant:12.0],
        [assortmentCollectionView.leadingAnchor constraintEqualToAnchor: contentView.leadingAnchor],
        [assortmentCollectionView.trailingAnchor constraintEqualToAnchor: contentView.trailingAnchor],
        [assortmentCollectionView.bottomAnchor constraintEqualToAnchor: contentView.bottomAnchor constant:-12.0]
    ]];
}

- (void)setFilter:(FilterModel *)filter {
    [model updateAssortment:filter];
}

- (void)setAssortmentTitle:(NSString *)title {
    [assortmentTitle setText:title];
}

- (void)updateAssortment:(NSArray *)assortments {
    [assortmentCollectionView setItems:assortments];
}

- (void)openPromo {
    [self showAlert];
}

- (void)openAddress {
    [self showAlert];
}

- (void)openInfo {
    [self showAlert];
}

- (void)openSearch {
    [FBSDKAppEvents.shared logEvent:FBSDKAppEventNameSearched];
    SearchView *searchView = [[SearchView alloc] initWithPoint: CGPointMake(0, self.navigationController.navigationBar.frame.size.height + model.inset*3) width:self.view.bounds.size.width];
    [searchView setDelegate:self];
    [self.view addSubview:searchView];
}

- (void)filteringTo:(NSString *)text {
    [model filtering:text];
}

@end
