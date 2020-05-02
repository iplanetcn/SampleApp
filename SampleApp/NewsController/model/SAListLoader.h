//
//  ListLoader.h
//  SampleApp
//
//  Created by John Lee on 2020/5/1.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SAListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^ListLoaderFinishBlock)(BOOL success, NSArray<SAListItem *> *dataArray);

@interface SAListLoader : NSObject

- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
