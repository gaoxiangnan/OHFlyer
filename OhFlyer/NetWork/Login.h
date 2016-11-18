//
//  Login.h
//  FlyShare
//
//  Created by zzxcc on 15/12/18.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Login : NSObject

@property (nonatomic, strong, readwrite) NSString *mobile, *password;
@property (nonatomic, strong, readwrite) NSNumber *remember_me;

//登陆状态的记录
+ (BOOL)isLogin;
+ (void)doLogin:(NSDictionary *)loginData;
+ (void)doLoginout;
+ (User *)curLoginUser;

//获得userid
+ (NSString *)getUserId;

//登陆账号记住
+ (void)setPreUserEmail:(NSString *)emailStr;

+ (NSString *)preUserEmail;

//登陆参数
- (NSDictionary *)toParams;

//验证信息
- (NSString *)validateFormatWithLoginInfo;

@end
