//
//  FilterModel.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) bool selected;
@property (nonatomic) UIColor *textColor; 

- (instancetype)init: (NSString*)_name andSelected:(bool)_selected andTextColor: (UIColor*)_textColor;

@end

NS_ASSUME_NONNULL_END
