//
//  SAListItem.m
//  SampleApp
//
//  Created by John Lee on 2020/5/2.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAListItem.h"

@implementation SAListItem

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

@end
