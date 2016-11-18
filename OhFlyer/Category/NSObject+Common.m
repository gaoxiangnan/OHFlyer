//
//  NSObject+Common.m
//  FlyShare
//
//  Created by zzxcc on 15/11/4.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#define kPath_ResponseCache @"ResponseCache"
//测试地址
#define kBaseUrl_Test @"http://test-service.ohflyer.com/"

#define payUrl @"http://123.57.63.135:8001/Api/"
#define payUrl_Formal @"http://admin.ohflyer.com/Api/"//付款的正式地址

//正式地址
#define kBaseUrl_Formal @"http://service.ohflyer.com/"

#import "NSObject+Common.h"
#import "MBProgressHUD.h"
#import "User.h"
#import "Login.h"
#import "NSString+Common.h"

@implementation NSObject (Common)

#pragma mark -error
+ (NSString *)tipFromError:(NSError *)error{
    if (error && error.userInfo) {
        NSMutableString *tipStr = [[NSMutableString alloc] init];
        if ([[error.userInfo objectForKey:@"errorCode"] intValue] >= -3 && [[error.userInfo objectForKey:@"errorCode"] intValue] <= 9) {
            tipStr = [error.userInfo objectForKey:@"errorMsg"];
            return tipStr;
        }
        
        if ([error.userInfo objectForKey:@"errorMsg"]) {
            NSArray *msgArray = [[error.userInfo objectForKey:@"errorMsg"] allValues];
            NSUInteger num = [msgArray count];
            for (int i = 0; i < num; i++) {
                NSString *msgStr = [msgArray objectAtIndex:i];
                if (i+1 < num) {
                    [tipStr appendString:[NSString stringWithFormat:@"%@\n", msgStr]];
                }else{
                    [tipStr appendString:msgStr];
                }
            }
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                [tipStr appendFormat:@"ErrorCode%ld", (long)error.code];
            }
        }
        return tipStr;
    }
    return nil;
}

+ (BOOL)showError:(NSError *)error{
    
    NSString *tipStr = [NSObject tipFromError:error];
    [NSObject showHudTipStr:tipStr];
    return YES;
}

+ (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
        hud.detailsLabelText = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.0];
    }
}

#pragma mark NetError
-(id)handleResponse:(id)responseJSON{
    return [self handleResponse:responseJSON autoShowError:YES];
}
-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError{
    NSError *error = nil;
    //code为非0值时，表示有错
    NSNumber *resultCode = [responseJSON valueForKeyPath:@"errorCode"];
    
    if (resultCode.intValue != 0) {
        error = [NSError errorWithDomain:kBaseUrl_Test code:resultCode.intValue userInfo:responseJSON];
        
        if (resultCode.intValue == 1000 || resultCode.intValue == 3207) {//用户未登录
//            if ([Login isLogin]) {//已登录的状态要抹掉
//                [Login doLogout];
//                [((AppDelegate *)[UIApplication sharedApplication].delegate) setupLoginViewController];
            
            //登录
                kTipAlert(@"%@", [NSObject tipFromError:error]);
        //}
        }else{
            if (autoShowError) {
                [NSObject tipFromError:error];
            }
        }
    }
    return error;
}

//网络请求
+ (BOOL)saveResponseData:(NSDictionary *)data toPath:(NSString *)requestPath{
    User *loginUser = [Login curLoginUser];
    if (!loginUser) {
        return NO;
    }else{
        requestPath = [NSString stringWithFormat:@"%@_%@", loginUser.id, requestPath];
    }
    if ([self createDirInCache:kPath_ResponseCache]) {
        NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [self pathInCacheDirectory:kPath_ResponseCache], [requestPath md5Str]];
        return [data writeToFile:abslutePath atomically:YES];
    }else{
        return NO;
    }
}

//cache
+ (id) loadResponseWithPath:(NSString *)requestPath{//返回一个NSDictionary类型的json数据
    User *loginUser = [Login curLoginUser];
    if (!loginUser) {
        return nil;
    }else{
        requestPath = [NSString stringWithFormat:@"%@_%@", loginUser.id, requestPath];
    }
    NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [self pathInCacheDirectory:kPath_ResponseCache], [requestPath md5Str]];
    return [NSMutableDictionary dictionaryWithContentsOfFile:abslutePath];
}

#pragma mark File M
//获取fileName的完整地址
+ (NSString* )pathInCacheDirectory:(NSString *)fileName
{
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cachePaths objectAtIndex:0];
    return [cachePath stringByAppendingPathComponent:fileName];
}
//创建缓存文件夹
+ (BOOL) createDirInCache:(NSString *)dirName
{
    NSString *dirPath = [self pathInCacheDirectory:dirName];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:dirPath isDirectory:&isDir];
    BOOL isCreated = NO;
    if ( !(isDir == YES && existed == YES) )
    {
        isCreated = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    if (existed) {
        isCreated = YES;
    }
    return isCreated;
}

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}


@end
