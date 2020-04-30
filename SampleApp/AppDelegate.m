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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    VideoViewController *videoViewController = [[VideoViewController alloc] init];
    RecommendViewController *recommendViewController = [[RecommendViewController alloc] init];
    ContactViewController *contactViewController = [[ContactViewController alloc] init];

    UIViewController *mineViewController = [[UIViewController alloc] init];
    mineViewController.view.backgroundColor = [UIColor orangeColor];
    mineViewController.tabBarItem.title = @"我的";
    mineViewController.tabBarItem.image = [UIImage systemImageNamed:@"person"];

    [tabBarController setViewControllers:@[newsViewController, videoViewController, recommendViewController, contactViewController, mineViewController]];

    tabBarController.delegate = self;

    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    navigationController.navigationBar.topItem.title = tabBarController.selectedViewController.tabBarItem.title;
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select ViewController");
    tabBarController.navigationController.navigationBar.topItem.title = tabBarController.selectedViewController.tabBarItem.title;
}

@end
