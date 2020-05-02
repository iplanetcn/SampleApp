//
//  DeleteCellView.h
//  SampleApp
//
//  Created by John Lee on 2020/4/30.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SADeleteCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END
