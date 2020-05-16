//
//  SAVideoCoverView.m
//  SampleApp
//
//  Created by John Lee on 2020/5/3.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAVideoCoverView.h"
#import "SAVideoPlayer.h"
#import "SAVideoToolbar.h"
#import "SAVideoInfo.h"
//#import <UIKit/UIKit.h>
//#import <AVKit/AVKit.h>

@interface SAVideoCoverView ()

@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playerButton;
@property (nonatomic, strong, readwrite) SAVideoToolbar *toolbar;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
/*
@property (nonatomic, strong, readwrite) AVPlayerViewController *playerViewController;
*/

@end

@implementation SAVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - SAVideoToolbarHeight)];
            _coverView;
        })];

        [_coverView addSubview:({
            _playerButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50 )/2, (frame.size.height - 50 - SAVideoToolbarHeight)/2, 50, 50)];
            _playerButton.image = [UIImage systemImageNamed:@"play.circle"];
            _playerButton;
        })];
        
        [self addSubview:({
            _toolbar = [[SAVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, SAVideoToolbarHeight)];
            _toolbar;
        })];
        
        /*
        _playerViewController = [AVPlayerViewController new];
        _playerViewController.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _playerViewController.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [_playerViewController.view sizeToFit];
        _playerViewController.showsPlaybackControls = true;
        [_playerViewController.contentOverlayView addSubview:_coverView];
        [self addSubview:_playerViewController.view];
        */

        UITapGestureRecognizer *tapGestrue = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGestrue];
    }

    return self;
}

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    
    SAVideoInfo *info = [[SAVideoInfo alloc]init];
    info.nick = @"John";
    info.comment = @"100";
    info.like = @"100";
    info.share = @"100";
    
    [_toolbar layoutWithModel:info];
}



-(void)_tapToPlay{
    [[SAVideoPlayer player]playVideoWithUrl:_videoUrl attachView:_coverView];
}

/*
-(void)_tapToPlayNative{
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    _playerViewController.player = player;
    [player play];
}
*/

@end
