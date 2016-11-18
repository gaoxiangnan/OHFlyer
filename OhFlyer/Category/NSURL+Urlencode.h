//
// Created by lovejia on 14-7-1.
// Copyright (c) 2014 waqu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Urlencode)

+ (NSURL *)URLPercentEncodedString:(NSString *)url;
+ (NSURL *)URLEncodedString:(NSString *)url;

@end