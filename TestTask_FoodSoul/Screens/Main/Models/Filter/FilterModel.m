//
//  FilterModel.m
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

#import "FilterModel.h"

@implementation FilterModel

@synthesize name;
@synthesize selected;
@synthesize textColor;

- (instancetype)init: (NSString*)_name andSelected:(bool)_selected andTextColor: (UIColor*)_textColor
{
    self = [super init];
    if (self) {
        name = _name;
        selected = _selected;
        textColor = _textColor;
    }
    return self;
}
@end
