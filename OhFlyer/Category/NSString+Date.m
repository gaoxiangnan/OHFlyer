//
//  NSString+Date.m
//  Dream
//
//  Created by 江明 赵 on 7/6/14.
//  Copyright (c) 2014 江明 赵. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

- (NSDate *)dateFromyyyyMMdd {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }

    NSDate *fromString = [dateFormatter dateFromString:self];
    return fromString;
}

- (NSDate *)dateFromHHmm {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
    }

    return [dateFormatter dateFromString:self];
}

- (NSDate *)fullDate {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }

    return [dateFormatter dateFromString:self];
}

@end
