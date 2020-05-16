//
//  SAMediator.m
//  SampleApp
//
//  Created by John Lee on 2020/5/16.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAMediator.h"

@implementation SAMediator

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl {
    Class detialCls = NSClassFromString(@"NewsDetailViewController");
    UIViewController *controller = [[detialCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return controller;
}

#pragma mark -

+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });

    return cache;
}

+ (void)registerScheme:(NSString *)scheme processBlock:(SAMediatorProcessBlock)processBlock {
    if (scheme && processBlock) {
        [[[self class]mediatorCache]setObject:processBlock forKey:scheme];
    }
}

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params {
    SAMediatorProcessBlock block = [[[self class]mediatorCache]objectForKey:url];
    if (block) {
        block(params);
    }
}

+ (void)registerProtocol:(Protocol *)proto class:(Class)cls {
    if (proto && cls) {
        [[[self class] mediatorCache]setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}

+ (Class)classForProtocol:(Protocol *)proto {
    return [[[self class] mediatorCache]objectForKey:NSStringFromProtocol(proto)];
}

@end
