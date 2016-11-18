//
//  NSObject+Common.h
//  FlyShare
//
//  Created by zzxcc on 15/11/4.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)
+ (BOOL)showError:(NSError *)error;

+ (void)showHudTipStr:(NSString *)tipStr;

-(id)handleResponse:(id)responseJSON;
-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError;

+ (id) loadResponseWithPath:(NSString *)requestPath;

+ (BOOL)saveResponseData:(NSDictionary *)data toPath:(NSString *)requestPath;

+ (NSString* )pathInCacheDirectory:(NSString *)fileName;

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
@end
