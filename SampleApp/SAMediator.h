//
//  SAMediator.h
//  SampleApp
//
//  Created by John Lee on 2020/5/16.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SADetailViewControllerProtocol <NSObject>

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

@interface SAMediator : NSObject

// 组件化路由方式一:Target-Action(通过反射去实现)中心化管理,优化:可以通过扩展去增加
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

// 组件化路由方式二:Url-Scheme
typedef void(^SAMediatorProcessBlock)(NSDictionary *params);
+ (void) registerScheme:(NSString *)scheme processBlock:(SAMediatorProcessBlock)processBlock;
+ (void) openUrl:(NSString *)url params:(NSDictionary *)params;

// 组件化路由方式三:Protocol-Class
+ (void)registerProtocol:(Protocol *)proto class:(Class) cls;
+ (Class)classForProtocol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
