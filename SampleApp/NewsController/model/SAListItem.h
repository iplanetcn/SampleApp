//
//  ListItem.h
//  SampleApp
//
//  Created by John Lee on 2020/5/2.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 列表结构化数据
@interface SAListItem : NSObject

@property(nonatomic, copy, readwrite) NSString *uniqueKey;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *date;
@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *authorName;
@property(nonatomic, copy, readwrite) NSString *url;
@property(nonatomic, copy, readwrite) NSString *thumbnailPicS;
@property(nonatomic, copy, readwrite) NSString *thumbnailPicS02;
@property(nonatomic, copy, readwrite) NSString *thumbnailPicS03;

-(void) setupWithDictionary:(NSDictionary*) dictionary;

@end




NS_ASSUME_NONNULL_END
