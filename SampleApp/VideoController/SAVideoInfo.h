//
//  SAVideoInfo.h
//  SampleApp
//
//  Created by John Lee on 2020/5/16.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAVideoInfo : NSObject

@property(nonatomic, copy, readwrite) NSString *nick;
@property(nonatomic, copy, readwrite) NSString *comment;
@property(nonatomic, copy, readwrite) NSString *like;
@property(nonatomic, copy, readwrite) NSString *share;

@end

NS_ASSUME_NONNULL_END
