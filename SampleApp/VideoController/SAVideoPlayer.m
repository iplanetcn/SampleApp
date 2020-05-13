//
//  SAVideoPlayer.m
//  SampleApp
//
//  Created by John Lee on 2020/5/6.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface SAVideoPlayer ()

@property (nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property (nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property (nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@end

@implementation SAVideoPlayer

+ (SAVideoPlayer *)player {
    static SAVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[SAVideoPlayer alloc] init];
    });
    
    return player;
}

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView {
    
    [self _stopPlay];
    
    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];

//    CMTime duration = _videoItem.duration;
//    CGFloat videoDuration = CMTimeGetSeconds(duration);

    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"play progress: %@", @(CMTimeGetSeconds(time)));
    }];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_playerLayer];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

#pragma mark - private method

- (void)_stopPlay {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    [_playerLayer removeFromSuperlayer];

    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    _videoItem = nil;

    _avPlayer = nil;
}

- (void)_handlePlayEnd {
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerStatusReadyToPlay) {
            [_avPlayer play];
        } else {
            NSLog(@"");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"cache:%@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
