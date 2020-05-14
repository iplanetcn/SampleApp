//
//  AppDelegate.m
//  SampleApp
//
//  Created by John Lee on 2020/4/21.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "SAContactViewController.h"
#import "SAVideoViewController.h"
#import "SANewsViewController.h"
#import "SARecommendViewController.h"
#import "SASplashView.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    SANewsViewController *newsViewController = [[SANewsViewController alloc] init];
    SAVideoViewController *videoViewController = [[SAVideoViewController alloc] init];
    SARecommendViewController *recommendViewController = [[SARecommendViewController alloc] init];
    SAContactViewController *contactViewController = [[SAContactViewController alloc] init];

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

    [self.window addSubview:({
        SASplashView *splashView = [[SASplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];

    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select ViewController");
    tabBarController.navigationController.navigationBar.topItem.title = tabBarController.selectedViewController.tabBarItem.title;
}

@end
