//
//  FilterCollectionView.m
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

#import "FilterCollectionView.h"

@implementation FilterCollectionView {
    UICollectionViewFlowLayout *layout;
    CGFloat inset;
}

#pragma Init
- (instancetype)initWithInset:(CGFloat) _inset
{
    layout = [UICollectionViewFlowLayout new];
    inset = _inset;
    self = [super initWithFrame: CGRectZero collectionViewLayout: layout];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        [self registerClass:[FilterCollectionViewCollectionViewCell class] forCellWithReuseIdentifier: @"FilterCollectionViewCollectionViewCell"];
        [self setShowsHorizontalScrollIndicator: NO];
        [self setDataSource: self];
        [self setDelegate: self];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [layout setSectionInset:UIEdgeInsetsMake(inset, inset, inset, inset)];
    [layout setMinimumLineSpacing:inset];
    [layout setMinimumInteritemSpacing:inset];
    [layout setScrollDirection: UICollectionViewScrollDirectionHorizontal];
    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    [self.heightAnchor constraintEqualToConstant: layout.itemSize.height].active = YES;
}

#pragma DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FilterCollectionViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilterCollectionViewCollectionViewCell" forIndexPath:indexPath];
    if ([_items[indexPath.item] isKindOfClass:[FilterModel class]]) {
        FilterModel *filter = _items[indexPath.item];
        [cell setNormalColor:filter.textColor];
        [cell setTitle:filter.name];
        [cell setSelectedCell:filter.selected];
    }
    return cell;
}

#pragma Delegates
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_items[indexPath.item] isKindOfClass:[FilterModel class]]) {
        FilterCollectionViewCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        for (int i = 0; i < _items.count; i++) {
            FilterModel *filter = _items[i];
            if (filter.name == cell.title) {
                filter.selected = YES;
                [_filterDelegate setFilter:filter];
            } else {
                filter.selected = NO;
            }
        }
        [self reloadData];
    }
}

@end
