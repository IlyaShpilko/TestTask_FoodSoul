//
//  FilterCollectionViewCollectionViewCell.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilterCollectionViewCollectionViewCell : UICollectionViewCell

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) bool selectedCell;

-(void)setTitle:(NSString *)title;
- (void)setSelectedCell:(bool)selectedCell;
-(void)setNormalColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
