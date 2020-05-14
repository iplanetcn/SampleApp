//
//  SASplashView.m
//  SampleApp
//
//  Created by John Lee on 2020/5/14.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SASplashView.h"
#import "SAScreen.h"

@interface SASplashView ()

@property (nonatomic, strong, readwrite) UIButton *button;

@end

@implementation SASplashView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:UIRect(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"skip" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark -

- (void)_removeSplashView {
    [self removeFromSuperview];
}

@end
