//
//  SAVideoCoverView.h
//  SampleApp
//
//  Created by John Lee on 2020/5/3.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAVideoCoverView : UICollectionViewCell

- (void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
