//
//  Regist.m
//  FlyShare
//
//  Created by zzxcc on 16/1/4.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "Regist.h"
#import "NSString+Common.h"
#import "NSString+Format.h"

@implementation Regist

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mobile = @"";
        self.password = @"";
        self.surePassword = @"";
    }
    return self;
}

- (NSDictionary *)toParams{
    return @{@"mobile" : self.mobile,
             @"password" : [self.password md5Str],
             @"code" : self.code ? self.code : @""};
    
}

- (NSString *)validateFormat
{
    NSString *tipStr = nil;
    if (self.password.length < 6) {
        tipStr = @"请输入大于6位的密码";
    }else if (![NSString checkPassword:self.password]) {
        tipStr = @"密码格式只能是数字加字母";
    }else if (![self.surePassword isEqualToString:self.password]) {
        tipStr = @"两次密码不一致，请确认后输入";
    }
    return tipStr;
}

@end
