//
//  ListLoader.m
//  SampleApp
//
//  Created by John Lee on 2020/5/1.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAListLoader.h"
#import "SAListItem.h"

@implementation SAListLoader

/// 请求网络数据
/// @param finishBlock 完成后的block调用函数
- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock {
//    读取本地数据
    NSArray<SAListItem *> *listData = [self _readDataFromLocal];
    if (listData) {
        finishBlock(YES, listData);
    }

//    请求网络数据
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=8ddf85602ca8e137d53e25f3db9dbcd0";
    NSURL *listUrl = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof (self) weakSelf = self;
    NSURLSessionTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray = [([((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = [[NSMutableArray alloc]init];
        for (NSDictionary *info in dataArray) {
            SAListItem *item = [[SAListItem alloc]init];
            [item setupWithDictionary:info];
            [listItemArray addObject:item];
        }

//        缓存数据
        [strongSelf _archiveListDataWithArray:listItemArray.copy];

        dispatch_sync(dispatch_get_main_queue(), ^{
                          if (finishBlock) {
                              finishBlock(error == nil, listItemArray.copy);
                          }
                      });
    }];

    [dataTask resume];
}

/// 缓存数据
/// @param array 新闻列表数据
- (void)_archiveListDataWithArray:(NSArray<SAListItem *> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];

    NSFileManager *fileManager = [NSFileManager defaultManager];
//    创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"SAData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];

//    创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];

    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];

//    查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];

//    删除
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }

    NSLog(@"");

//    追加
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"phenix" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];

//    [self _readListDataFromArchiver];

//    [[NSUserDefaults standardUserDefaults]setObject:@"abc" forKey:@"test"];

//    NSString *test = [[NSUserDefaults standardUserDefaults] objectForKey:@"test"];
}

///  读取本地数据
- (NSArray<SAListItem *> *)_readDataFromLocal {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"SAData/list"];
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    id unarhiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [SAListItem class], nil] fromData:readListData error:nil];

    if ([unarhiveObj isKindOfClass:[NSArray class]] && [unarhiveObj count] > 0) {
        return unarhiveObj;
    }

    return nil;
}

@end
