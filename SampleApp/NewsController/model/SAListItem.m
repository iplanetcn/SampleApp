//
//  SAListItem.m
//  SampleApp
//
//  Created by John Lee on 2020/5/2.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAListItem.h"

@implementation SAListItem

#pragma mark - public method

-(void) setupWithDictionary:(NSDictionary*) dictionary{
    self.uniqueKey = [dictionary valueForKey:@"uniquekey"];
    self.title = [dictionary valueForKey:@"title"];
    self.date = [dictionary valueForKey:@"date"];
    self.category = [dictionary valueForKey:@"category"];
    self.authorName = [dictionary valueForKey:@"author_name"];
    self.url = [dictionary valueForKey:@"url"];
    self.thumbnailPicS = [dictionary valueForKey:@"thumbnail_pic_s"];
    self.thumbnailPicS02 = [dictionary valueForKey:@"thumbnail_pic_s02"];
    self.thumbnailPicS03 = [dictionary valueForKey:@"thumbnail_pic_s03"];
}

#pragma mark - NSSecureCoding

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.url forKey:@"url"];
    [coder encodeObject:self.thumbnailPicS forKey:@"thumbnailPicS"];
    [coder encodeObject:self.thumbnailPicS02 forKey:@"thumbnailPicS02"];
    [coder encodeObject:self.thumbnailPicS03 forKey:@"thumbnailPicS03"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if (self) {
        self.uniqueKey = [coder decodeObjectForKey:@"uniqueKey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.category = [coder decodeObjectForKey:@"category"];
        self.authorName = [coder decodeObjectForKey:@"authorName"];
        self.url = [coder decodeObjectForKey:@"url"];
        self.thumbnailPicS = [coder decodeObjectForKey:@"thumbnailPicS"];
        self.thumbnailPicS02 = [coder decodeObjectForKey:@"thumbnailPicS02"];
        self.thumbnailPicS03 = [coder decodeObjectForKey:@"thumbnailPicS03"];
    }
    
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
