//
//  Login.m
//  FlyShare
//
//  Created by zzxcc on 15/12/18.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "Login.h"
#import "NSString+Common.h"
#import "NSString+Format.h"
//#import "MessageList.h"

#define kLoginPreUserEmail @"pre_user_phone"
#define kLoginStatus @"login_status"
#define kLoginUserDict @"user_dict"
#define kLoginDataListPath @"login_data_list_path.plist"

static User *curLoginUser;

@implementation Login

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mobile = @"";
        _password = @"";
        _remember_me = [NSNumber numberWithBool:YES];
    }
    return self;
}

+ (NSString *)getUserId
{
    if ([self isLogin]) {
        return [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginUserDict] valueForKey:@"id"];
    }
    return @"-1";
}

+ (BOOL)isLogin
{
    NSNumber *loginStatus = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginStatus];
    if (loginStatus.boolValue) {
        return YES;
    }
    return NO;
}

//记录登陆信息
+ (void)doLogin:(NSDictionary *)loginData
{
    if (loginData) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:[NSNumber numberWithBool:YES] forKey:kLoginStatus];
        [defaults setObject:loginData forKey:kLoginUserDict];
        User *user = [[User alloc] init];
        
        for (NSString *keys in [loginData allKeys]) {
            [user setValue:[loginData objectForKey:keys] forKey:keys];
        }
        
        curLoginUser = user;
        
        [defaults synchronize];
        
    }
}

+ (void)doLoginout
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:kLoginStatus];
    [defaults removeObjectForKey:@"Message_MaxId"];
    [defaults removeObjectForKey:@"bonus_maxId"];
    [defaults removeObjectForKey:@"user_dict"];

    [defaults synchronize];
}

//存储登陆获取数据
+ (User *)curLoginUser
{
    if (!curLoginUser) {
        NSDictionary *loginData = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUserDict];
        User *user = [[User alloc] init];
        
        for (NSString *keys in [loginData allKeys]) {
            [user setValue:[loginData objectForKey:keys] forKey:keys];
        }
        curLoginUser = loginData ? user : nil;
    }
    return curLoginUser;
}

//登陆带或不带验证码的参数
- (NSDictionary *)toParams{
        return @{@"mobile" : self.mobile,
                 @"password" : [self.password md5Str]
                 };
}

- (NSString *)validateFormatWithLoginInfo
{
    NSString *tipStr = nil;
    if (!_mobile || _mobile.length <= 0) {
        tipStr = @"请填写手机号";
    }else if (!_password || _password.length <= 0) {
        tipStr = @"请填写密码";
    }
    return tipStr;
}

+ (void)setPreUserEmail:(NSString *)emailStr
{
    if (emailStr.length <= 0) {
        return;
    }
    NSUserDefaults *emailStrDefaults = [NSUserDefaults standardUserDefaults];
    [emailStrDefaults setObject:emailStrDefaults forKey:kLoginPreUserEmail];
    [emailStrDefaults synchronize];
}

+ (NSString *)preUserEmail
{
    NSUserDefaults *emailDefaults = [NSUserDefaults standardUserDefaults];
    return [emailDefaults objectForKey:kLoginPreUserEmail];
}


@end
