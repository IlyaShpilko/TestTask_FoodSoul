//
//  FilterCollectionView.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

#import <UIKit/UIKit.h>
#import "FilterCollectionViewCollectionViewCell.h"
#import "FilterModel.h"
#import "FilterDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSArray *items;
@property(nonatomic, weak) id<FilterDelegate> filterDelegate;

- (instancetype)initWithInset:(CGFloat)inset;

@end

NS_ASSUME_NONNULL_END
