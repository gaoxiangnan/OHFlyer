//
//  User.h
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong, nonnull) NSString *id;
@property (nonatomic, strong, nonnull) NSString *name;
@property (nonatomic, assign, nonnull) NSNumber *sex;
@property (nonatomic, strong, nonnull) NSString *birthday;
@property (nonatomic, strong, nonnull) NSString *mobile;
@property (nonatomic, strong, nonnull) NSString *email;
@property (nonatomic, strong, nonnull) NSString *icon;
//会员积分
@property (nonatomic, strong, nonnull) NSNumber *bonus;
//最后登陆时间
@property (nonatomic, strong, nonnull) NSDate *log_time;

//修改密码
@property (nonatomic, strong, nonnull) NSString *password;
@property (nonatomic, strong, nonnull) NSString *passwordNeww;
@property (nonatomic, strong, nonnull) NSString *passwordConfirm;

- (NSDictionary *)toUpdateInfoParams;

//重置密码
- (NSDictionary *)toResetPasswordParams;

//修改密码栏错误提示
- (NSString *)changePasswordTips;

@end
