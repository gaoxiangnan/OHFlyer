//
// Created by 赵江明 on 15/10/23.
// Copyright (c) 2015 SunYuanYang. All rights reserved.
//

#import "NSMutableDictionary+Empty.h"


@implementation NSMutableDictionary (Empty)

- (void)addText:(NSString *)value forKey:(NSString *)key {
    [self setValue:value ? value : @"" forKey:key];
}

- (void)addNumber:(NSNumber *)value forKey:(NSString *)key {
    [self setValue:value ? value : @(0) forKey:key];
}

@end