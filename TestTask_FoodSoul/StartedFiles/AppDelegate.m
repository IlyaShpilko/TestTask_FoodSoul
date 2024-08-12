//
//  AppDelegate.m
//  TestProject
//
//  Created by Ilya Shpilko on 8/2/24.
//

#import "AppDelegate.h"
#import "NavigationController.h"
#import "MainViewController.h"
#import "FBSDKCoreKit/FBSDKCoreKit.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = [[ContainerController alloc] initWithRootViewController:[MainViewController new]];
    self.window.backgroundColor = UIColor.blackColor;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents.shared activateApp];
}

@end
