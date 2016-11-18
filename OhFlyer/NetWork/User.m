//
//  User.m
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "User.h"
#import "NSString+Common.h"
#import "NSString+Format.h"

@implementation User

- (NSDictionary *)toUpdateInfoParams
{
    return @{@"id" : _id,
             @"birthday" : _birthday ? _birthday : @"",
             @"bonus" : _bonus ? _bonus : @"",
             @"sex" : _sex ? _sex : [NSNumber numberWithInteger:2],
             @"mobile" : _mobile ? _mobile : @"",
             @"name" : _name ? _name : @"",
             @"icon" : _icon ? _icon : @"",
             @"email" : _email ? _email : @""};
}

- (NSDictionary *)toResetPasswordParams
{
    return @{@"id" : _id,
             @"password" : [_password md5Str],
             @"newPassword" : [_passwordNeww md5Str]};
}

- (NSString *)changePasswordTips{
    NSString *tipStr = nil;
    if (!self.password || self.password.length <= 0){
        tipStr = @"请输入当前密码";
    }else if (!self.passwordNeww || self.passwordNeww.length <= 0){
        tipStr = @"请输入新密码";
    }else if (!self.passwordConfirm || self.passwordConfirm.length <= 0) {
        tipStr = @"请确认新密码";
    }else if (![self.passwordConfirm isEqualToString:self.passwordNeww]){
        tipStr = @"两次输入的密码不一致";
    }else if (self.passwordNeww.length < 6){
        tipStr = @"新密码不能少于6位";
    }else if (![NSString checkPassword:self.passwordNeww]){
        tipStr = @"密码格式只能是数字加字母";
    }
    return tipStr;
}


@end
