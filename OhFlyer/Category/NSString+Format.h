//
//  NSString+Format.h
//  FlyShare
//
//  Created by zzxcc on 16/1/5.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Format)

+ (BOOL)validatePhone:(NSString *)phone;

+ (BOOL)validateEmail:(NSString *)email;

+ (BOOL)checkUserIdCard: (NSString *) idCard;

+ (BOOL)checkPassword:(NSString *) password;

+ (BOOL)validateIDCardNumber:(NSString *)value;

@end
