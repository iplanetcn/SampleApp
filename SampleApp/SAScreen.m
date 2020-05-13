//
//  SAScreen.m
//  SampleApp
//
//  Created by John Lee on 2020/5/6.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAScreen.h"

@implementation SAScreen

// iphone xs max
+ (CGSize)sizeFor65Inch {
    return CGSizeMake(414, 895);
}

// iphone xr
+ (CGSize)sizeFor61Inch {
    return CGSizeMake(414, 895);
}

// iphonex
+ (CGSize)sizeFor58Inch {
    return CGSizeMake(375, 812);
}

//plus
//4 /5

@end
