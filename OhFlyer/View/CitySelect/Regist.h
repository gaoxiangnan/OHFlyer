//
//  Regist.h
//  FlyShare
//
//  Created by zzxcc on 16/1/4.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Regist : NSObject
@property (nonatomic, strong, nonnull) NSString *mobile;
@property (nonatomic, strong, nonnull) NSString *password;
@property (nonatomic, strong, nonnull) NSString *code;
@property (nonatomic, strong) NSString *surePassword;

- (NSDictionary *)toParams;

- (NSString *)validateFormat;

@end
