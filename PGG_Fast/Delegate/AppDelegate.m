//
//  AppDelegate.m
//  PGG_Fast
//
//  Created by 陈鹏 on 2017/12/11.
//  Copyright © 2017年 penggege.CP. All rights reserved.
// https://github.com/penghero/PGG_Fast.git 代码地址

#import "AppDelegate.h"
#import "PGGMainViewController.h"
#import "PGGCHViewController.h"
#import <MMDrawerVisualState.h>

@interface AppDelegate ()

@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    createWindow(self);
    return YES;
}
static void createWindow(AppDelegate *object) {
    object.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    object.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:[[PGGMainViewController alloc] init]];
    centerNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    centerNav.navigationBar.tintColor = [UIColor lightGrayColor];
    centerNav.navigationBar.barTintColor = [UIColor whiteColor];
    PGGCHViewController *left = [[PGGCHViewController alloc] init];
    
    object.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNav leftDrawerViewController:left];
    [object.drawerController setShowsShadow:NO];//设置是否有阴影
    [object.drawerController setShouldStretchDrawer:NO];//设置是否回弹效果
    [object.drawerController setMaximumLeftDrawerWidth:kScreen_Width-100];//最大距离
    [object.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [object.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [object.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        
    }];
    object.window.rootViewController = object.drawerController;
    [object.window makeKeyWindow];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
