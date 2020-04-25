//
//  AppDelegate.m
//  SampleApp
//
//  Created by John Lee on 2020/4/21.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactViewController.h"
#import "VideoViewController.h"
#import "NewsViewController.h"
#import "RecommendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate
@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    NewsViewController *controller1 = [[NewsViewController alloc] init];
    VideoViewController *controller2 = [[VideoViewController alloc] init];
    RecommendViewController *controller3 = [[RecommendViewController alloc] init];
    ContactViewController *controller4 = [[ContactViewController alloc] init];
    
    UIViewController *controller5 = [[UIViewController alloc] init];
    controller5.view.backgroundColor = [UIColor orangeColor];
    controller5.tabBarItem.title = @"我的";
    controller5.tabBarItem.image = [UIImage systemImageNamed:@"person"];
    
    [tabBarController setViewControllers:@[controller1, controller2, controller3, controller4, controller5]];
    
    tabBarController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    navigationController.navigationBar.topItem.title = tabBarController.selectedViewController.tabBarItem.title;
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select ViewController");
    tabBarController.navigationController.navigationBar.topItem.title = tabBarController.selectedViewController.tabBarItem.title;
}

@end
