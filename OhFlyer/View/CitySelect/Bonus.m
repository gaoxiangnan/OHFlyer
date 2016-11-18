//
//  Bonus.m
//  FlyShare
//
//  Created by zzxcc on 16/1/12.
//  Copyright © 2016年 Vutumn. All rights reserved.
//
#define kBonusMaxId @"bonus_maxId"
#define kBonus @"bonus_bonus"
#define kPath_ResponseCache @"ResponseCache"

#import "Bonus.h"
#import "User.h"
#import "Login.h"
#import "NSObject+Common.h"
#import "NSString+Common.h"

@implementation Bonus

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
    [maxIdDefataults setObject:maxid forKey:kBonusMaxId];
    [maxIdDefataults synchronize];
}

+ (void)saveBonus:(NSString *)bonus
{
    NSUserDefaults *maxIdDefataults = [NSUserDefaults standardUserDefaults];
    [maxIdDefataults setObject:bonus forKey:kBonus];
    [maxIdDefataults synchronize];
}

+ (NSString *)getMaxId
{
    NSUserDefaults *maxIdDefataults = [NSUserDefaults standardUserDefaults];
    
    
    return [maxIdDefataults objectForKey:kBonusMaxId];
}

+ (BOOL)maxIdIsSaved
{
    NSString *maxId = [[NSUserDefaults standardUserDefaults] objectForKey:kBonusMaxId];
    if (maxId) {
        return YES;
    }
    return NO;
}


//追加数据
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
    NSDictionary *dicc = [dic objectForKey:@"list"];
    [dic setValue:[data valueForKey:@"maxId"] forKey:@"maxId"];
    [dic setValue:[data valueForKey:@"totalBonus"] forKey:@"totalBonus"];
    NSMutableArray *dataArr = [dic objectForKey:@"list"];
    if ([data objectForKey:@"list"]) {
        for (NSDictionary *dic in dicc) {
            [dataArr addObject:dic];
        }
    }
    return [dic writeToFile:abslutePath atomically:YES];
}


@end
