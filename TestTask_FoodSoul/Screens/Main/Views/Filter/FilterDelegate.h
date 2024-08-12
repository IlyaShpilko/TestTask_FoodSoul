//
//  FilterDelegate.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FilterDelegate <NSObject>

-(void)setFilter:(FilterModel*)filter;

@end

NS_ASSUME_NONNULL_END
