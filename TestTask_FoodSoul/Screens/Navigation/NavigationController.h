//
//  NavigationController.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/2/24.
//

#import <UIKit/UIKit.h>
#import "NavigationItemDelegate.h"
#import "NavigationMenuDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NavigationController : UINavigationController <UINavigationControllerDelegate>

@property (nonatomic, weak)id<NavigationItemDelegate> itemDelegate;
@property (nonatomic, weak)id<NavigationMenuDelegate> menuDelegate;

@end

NS_ASSUME_NONNULL_END
