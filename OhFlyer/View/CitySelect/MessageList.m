//
//  MessageList.m
//  FlyShare
//
//  Created by zzxcc on 16/1/4.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#define kMessageMaxId @"Message_MaxId"
#define kPath_ResponseCache @"ResponseCache"

#import "MessageList.h"
#import "User.h"
#import "Login.h"
#import "NSObject+Common.h"
#import "NSString+Common.h"

@implementation MessageList

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)saveMaxId:(NSString *)maxid
{
    NSUserDefaults *maxIdDefataults = [NSUserDefaults standardUserDefaults];
    [maxIdDefataults setObject:maxid forKey:kMessageMaxId];
    [maxIdDefataults synchronize];
}

+ (NSString *)getMaxId
{
    NSUserDefaults *maxIdDefataults = [NSUserDefaults standardUserDefaults];
    
    
    return [maxIdDefataults objectForKey:kMessageMaxId];
}

+ (BOOL)maxIdIsSaved
{
    NSString *maxId = [[NSUserDefaults standardUserDefaults] objectForKey:kMessageMaxId];
    if (maxId) {
        return YES;
    }
    return NO;
}

+ (BOOL)appendResponseData:(NSDictionary *)data toPath:(NSString *)requestPath{
    
    User *loginUser = [Login curLoginUser];
    if (!loginUser) {
        return NO;
    }else{
        requestPath = [NSString stringWithFormat:@"%@_%@", loginUser.id, requestPath];
    }
    NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [NSObject pathInCacheDirectory:kPath_ResponseCache], [requestPath md5Str]];
    
    //取出来一一更新赋值
    NSDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:abslutePath];
    NSDictionary *dicc = [data objectForKey:@"data"];
    [dic setValue:[data valueForKey:@"maxId"] forKey:@"maxId"];
    NSMutableArray *dataArr = [dic objectForKey:@"data"];
    if ([data objectForKey:@"data"]) {
        for (NSDictionary *dic in dicc) {
            [dataArr insertObject:dic atIndex:0];
        }
    }
    return [dic writeToFile:abslutePath atomically:YES];
}

+ (BOOL)updateFlagWithId:(NSString *)messageId toPath:(NSString *)requestPath
{
    User *loginUser = [Login curLoginUser];
    if (!loginUser) {
        return NO;
    }else{
        requestPath = [NSString stringWithFormat:@"%@_%@", loginUser.id, requestPath];
    }
    NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [NSObject pathInCacheDirectory:kPath_ResponseCache], [requestPath md5Str]];
    //更新状态
    NSDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:abslutePath];
    NSMutableArray *dataArr = [dic objectForKey:@"data"];
    NSArray *array = [NSArray arrayWithArray:dataArr];
    for (NSMutableDictionary *dicc in array) {
        if ([[dicc valueForKey:@"id"] isEqualToString:messageId]) {
            [dicc setObject:@"2" forKey:@"flag"];
        }
    }
    return [dic writeToFile:abslutePath atomically:YES];

}

+ (BOOL)updataeAllFlagToReadWithPath:(NSString *)requestPath
{
    User *loginUser = [Login curLoginUser];
    if (!loginUser) {
        return NO;
    }else{
        requestPath = [NSString stringWithFormat:@"%@_%@", loginUser.id, requestPath];
    }

    NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [NSObject pathInCacheDirectory:kPath_ResponseCache], [requestPath md5Str]];
    NSDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:abslutePath];

    for (NSMutableDictionary *dicc in [dic objectForKey:@"data"]) {
        
        [dicc setObject:[NSNumber numberWithInteger:2] forKey:@"flag"];
        
    }
    return [dic writeToFile:abslutePath atomically:YES];

}

+ (void)deleteSeletedMessageWithId:(NSString *)messageId andPath:(NSString *)requestPath
{
    User *loginUser = [Login curLoginUser];
 
    requestPath = [NSString stringWithFormat:@"%@_%@", loginUser.id, requestPath];

    
    NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [NSObject pathInCacheDirectory:kPath_ResponseCache], [requestPath md5Str]];
    NSDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:abslutePath];
    NSMutableArray *dataArr = [dic objectForKey:@"data"];

    NSArray *array = [NSArray arrayWithArray:dataArr];
    for (NSMutableDictionary *dicc in array) {
        if ([[dicc valueForKey:@"id"] isEqualToString:messageId]) {
            [dataArr removeObject:dicc];
        }
    }
    
    [dic writeToFile:abslutePath atomically:YES];
}


@end
