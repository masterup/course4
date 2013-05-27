//
//  AppDelegate.m
//  Lecture3
//
//  Created by Igor Tomych on 5/20/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import "AppDelegate.h"
#import "UI/FirstViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Root Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //First View Controller
    self.firstController = [[FirstViewController alloc] init];

    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:self.firstController];
    
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    self.firstController.view.backgroundColor = [UIColor redColor];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
