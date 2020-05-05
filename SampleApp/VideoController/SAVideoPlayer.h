//
//  SAVideoPlayer.h
//  SampleApp
//
//  Created by John Lee on 2020/5/6.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAVideoPlayer : NSObject

+ (SAVideoPlayer *) player;

- (void) playVideoWithUrl: (NSString *) videoUrl attachView:(UIView *)attachView;

@end

NS_ASSUME_NONNULL_END
