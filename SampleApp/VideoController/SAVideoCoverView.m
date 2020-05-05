//
//  SAVideoCoverView.m
//  SampleApp
//
//  Created by John Lee on 2020/5/3.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAVideoCoverView.h"
#import "SAVideoPlayer.h"

@interface SAVideoCoverView ()

@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playerButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;

@end

@implementation SAVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];

        [_coverView addSubview:({
            _playerButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _playerButton.image = [UIImage systemImageNamed:@"play.circle"];
            _playerButton;
        })];

        UITapGestureRecognizer *tapGestrue = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGestrue];

    }

    return self;
}

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
}



-(void)_tapToPlay{
    [[SAVideoPlayer player]playVideoWithUrl:_videoUrl attachView:_coverView];
}

@end
