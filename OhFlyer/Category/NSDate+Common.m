//
//  NSDate+Common.m
//  FlyShare
//
//  Created by zzxcc on 16/1/6.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "NSDate+Common.h"
#import "NSDate+Helper.h"

@implementation NSDate (Common)

+ (NSString *)DateTimeConvertYearMonth:(NSDate *)date andType:(NSDateFormatterType)type
{
    NSString *styles = [[NSString alloc]init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //类型待添加
    switch (type) {
        case NSDateFormatterTypeMonth:
            styles = @"yyyy-MM";
            break;
        case NSDateFormatterTypeDay:
            styles = @"yyyy-MM-dd";
            break;
        case NSDateFormatterTypeHour:
            [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
            styles  = @"HH";
            break;
        default:
            break;
    }
    
    [dateFormatter setDateFormat:styles];
    NSString *oneDayStr = [dateFormatter stringFromDate:date];
    return oneDayStr;
}

- (NSString *)string_yyyy_MM_dd{
    return [self stringWithFormat:@"yyyy-MM-dd"];
}

-(NSDate *)offsetYear:(int)numYears{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

- (NSDate *)offsetDay:(NSInteger)numDays{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

+ (NSString *)getWeek:(NSString *)dateString
{
    NSDate *date = [NSDate dateFromString:dateString withFormat:@"yyyy-MM-dd"];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:date];
    NSInteger _weekday = [weekdayComponents weekday];
    NSLog(@"_weekday::%ld",_weekday - 1);
    switch (_weekday - 1) {
        case 0:
            return @"周日";
            break;
        case 1:
            return @"周一";
            break;
        case 2:
            return @"周二";
            break;
        case 3:
            return @"周三";
            break;
        case 4:
            return @"周四";
            break;
        case 5:
            return @"周五";
            break;
        case 6:
            return @"周六";
            break;
        default:
            break;
    }
    return 0;
    
}

-(int)compareDate:(NSString*)date01 withDate:(NSString*)date02{
    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}

@end
