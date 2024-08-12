//
//  NavigationItemDelegate.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NavigationItemDelegate <NSObject>

-(void)openSearch;
-(void)openInfo;

@end

NS_ASSUME_NONNULL_END
