//
//  NavigationController.m
//  TestProject
//
//  Created by Ilya Shpilko on 8/2/24.
//

#import "NavigationController.h"
#import "TestTask_FoodSoul-Swift.h"

@implementation NavigationController

- (void)loadView {
    [super loadView];
    [self setDelegate: self];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self update:viewController];
    [navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

-(void)update: (UIViewController*) viewController {
    viewController.title = [[ObjcString alloc] initWith:ObjcStringResoursesMenu].text;
    viewController.navigationItem.hidesBackButton = true;
    viewController.navigationItem.leftBarButtonItem = [self createLeftItem];
    viewController.navigationItem.rightBarButtonItem = [self createRightItems];
}

-(UIBarButtonItem*)createLeftItem {
    UIImage *sortImage = [[ObjcIcons alloc] initWithType:ObjsIconsSort].icon;
    UIButton *leftButton = [self createButton:sortImage];
    [leftButton addTarget:self action:@selector(tappedLeft) forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}

-(UIBarButtonItem*)createRightItems {
    UIImage *searchImage = [[ObjcIcons alloc] initWithType: ObjsIconsSearch].icon;
    UIImage *infoImage = [[ObjcIcons alloc] initWithType: ObjsIconsInfo].icon;
    NSArray *images = [[NSArray alloc] initWithObjects:searchImage, infoImage, nil];
    
    UIStackView *stackView = [[[StackViewBuilder alloc] initWith:UILayoutConstraintAxisHorizontal] setSpacingTo:8].build;
    
    for (int i = 0; i < images.count; i++) {
        UIButton *item = [self createButton:images[i]];
        item.tag = i;
        [item addTarget:self action:@selector(tappedRight:) forControlEvents:UIControlEventTouchUpInside];
        [stackView addArrangedSubview:item];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:stackView];
}

-(UIButton*)createButton:(UIImage*)image {
    UIButton *item = [[UIButton alloc] initWithFrame:CGRectZero];
    [item setImage:[[image resizeTo:CGSizeMake(25, 25)] setTintColorTo:UIColor.redColor] forState:(UIControlStateNormal)];
    item.translatesAutoresizingMaskIntoConstraints = false;
    [item.widthAnchor constraintEqualToConstant:30].active = YES;
    [item.heightAnchor constraintEqualToConstant:30].active = YES;
    return item;
}

-(void)tappedRight:(UIBarButtonItem *)item {
    if (item.tag == 0) {
        [_itemDelegate openSearch];
    } else if (item.tag == 1) {
        [_itemDelegate openInfo];
    }
}

-(void)tappedLeft {
    [_menuDelegate openSideMenu];
}

@end

