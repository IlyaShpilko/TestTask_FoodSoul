//
//  FilterCollectionViewCollectionViewCell.m
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

#import "FilterCollectionViewCollectionViewCell.h"
#import "TestTask_FoodSoul-Swift.h"

@implementation FilterCollectionViewCollectionViewCell {
    UILabel *titleLabel;
    UIColor *normalColor;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titleLabel = [[[LabelBuilder alloc] initWith: TitleLabel] setTextAligementTo: NSTextAlignmentCenter].build;
        [self.contentView addSubview:titleLabel];
        [titleLabel.topAnchor constraintEqualToAnchor: self.contentView.topAnchor constant:8].active = YES;
        [titleLabel.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor constant:-8].active = YES;
        [titleLabel.leadingAnchor constraintEqualToAnchor: self.contentView.leadingAnchor constant:12].active = YES;
        [titleLabel.trailingAnchor constraintEqualToAnchor: self.contentView.trailingAnchor constant:-12].active = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.layer.cornerRadius = self.contentView.frame.size.height / 2;
}

-(void)setTitle:(NSString *)title {
    titleLabel.text = title;
    _title = title;
}

- (void)setSelectedCell:(bool)selectedCell {
    if (selectedCell) {
        self.contentView.backgroundColor = UIColor.redColor;
        [titleLabel setTextColor: [UIColor whiteColor]];
    } else {
        self.contentView.backgroundColor = [[ObjcColor alloc] initWithType:ColorTypeDarkBlue2Prog].color;
        [titleLabel setTextColor: normalColor];
    }
    _selectedCell = selectedCell;
}

-(void)setNormalColor:(UIColor*)color {
    normalColor = color;
    [titleLabel setTextColor:color];
}

@end
