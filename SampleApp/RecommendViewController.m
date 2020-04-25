//
//  RecommendViewController.m
//  SampleApp
//
//  Created by John Lee on 2020/4/23.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

@end

@implementation RecommendViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage systemImageNamed:@"heart"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    scrollView.delegate = self;
    // 不显示水平滚动条
//    scrollView.showsHorizontalScrollIndicator = NO;
    NSArray *colorArray = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], [UIColor lightGrayColor], [UIColor grayColor]];
    for (int i=0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    // Do any additional setup after loading the view.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll - %@",@(scrollView.contentOffset));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"BeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"EndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"BeginDecelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"EndDecelerating");
}

@end
