//
//  NSDate+Common.h
//  FlyShare
//
//  Created by zzxcc on 16/1/6.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NSDateFormatterType){
    NSDateFormatterTypeDay,
    NSDateFormatterTypeMonth,
    NSDateFormatterTypeHour,
};

@interface NSDate (Common)

+ (NSString *)DateTimeConvertYearMonth:(NSDate *)date andType:(NSDateFormatterType)type;

- (NSString *)string_yyyy_MM_dd;

-(NSDate *)offsetYear:(int)numYears;
- (NSDate *)offsetDay:(NSInteger)numDays;

+ (NSString *)getWeek:(NSString *)dateString;

@end
