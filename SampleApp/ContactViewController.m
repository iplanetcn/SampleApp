//
//  ViewController.m
//  SampleApp
//
//  Created by John Lee on 2020/4/21.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "ContactViewController.h"

#pragma mark ViewController

@interface ContactViewController ()

@end


#pragma mark TestView
@interface CustomView : UIView

@end

@implementation CustomView

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
}

@end

@implementation ContactViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"通讯录";
        self.tabBarItem.image = [UIImage systemImageNamed:@"person.2"];
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[CustomView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:view];
    
//    UIView *view2 = [[UIView alloc] init];
//    view2.backgroundColor = [UIColor greenColor];
//    view2.frame = CGRectMake(150, 150, 100, 100);
//    [self.view addSubview:view2];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [view addGestureRecognizer:tapGesture];
}

-(void)pushController{
    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor redColor];
    viewController.navigationItem.title = @"内容";

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 180, 40)];
    [button setTitle:@"show alert dialog" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(showAlertDialog) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:button];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)showAlertDialog {
    NSLog(@"show alert dialog");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"显示了一个提示框" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    [alertController addAction:defaultAction];
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
}


@end
