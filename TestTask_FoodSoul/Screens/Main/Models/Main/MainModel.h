//
//  MainModel.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

#import <Foundation/Foundation.h>
#import "TestTask_FoodSoul-Swift.h"
#import "FilterModel.h"
#import "MainModelDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainModel : NSObject

@property (nonatomic, weak) id<MainModelDelegate> delegate;
@property (nonatomic, readonly) CGFloat inset;
@property (nonatomic, strong, readonly) ProvideModel *provide;
@property (nonatomic, strong) NSArray<FilterModel*> *filters;

-(void)setStartSettings;
-(void)updateAssortment:(FilterModel*)filter;
-(void)filtering:(NSString*)text;

@end

NS_ASSUME_NONNULL_END
