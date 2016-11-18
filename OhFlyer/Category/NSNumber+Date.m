//
// Created by 江明 赵 on 12/31/14.
// Copyright (c) 2014 江明 赵. All rights reserved.
//

#import "NSNumber+Date.h"
#import "NSDate+Ago.h"

@implementation NSNumber (Date)

- (NSString *)timeAgo {
    double secs = [self doubleValue] / 1000;
    NSDate *since1970 = [NSDate dateWithTimeIntervalSince1970:secs];
    return [since1970 timeAgo];
}

- (NSDate *)date {
    double secs = [self doubleValue] / 1000;
    return [NSDate dateWithTimeIntervalSince1970:secs];
}

- (NSString *)min {
    NSInteger seconds = [self integerValue];
    NSInteger deltaMinutes;
    if (seconds == 0) {
        deltaMinutes = 0;
    } else if (seconds < 60) {
        deltaMinutes = 1;
    } else {
        deltaMinutes = seconds / 60;
    }

    return [NSString stringWithFormat:@"%ld", deltaMinutes];
}

- (NSString *)dayText {
    NSInteger value = [self integerValue];
    NSInteger year = value / 10000;
    NSInteger month = (value - year * 10000) / 100;
    NSInteger day = (value - year * 10000) - month * 100;
    return [NSString stringWithFormat:@"%04ld%02ld%02ld", year, month, day];
}

- (NSString *)timeText {
    NSInteger seconds = [self integerValue];
    NSInteger deltaHours = seconds / (60 * 60);
    NSInteger deltaMinutes = (seconds - (deltaHours * 60 * 60)) / 60;
    NSInteger deltaSecond = (seconds - (deltaHours * 60 * 60) - (deltaMinutes * 60));

    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", deltaHours, deltaMinutes, deltaSecond];
}

- (NSString *)secMin {
    NSInteger seconds = [self integerValue];
    NSInteger deltaMinutes = seconds / 60;
    NSInteger deltaSecond = (seconds - (deltaMinutes * 60));

    return [NSString stringWithFormat:@"%02ld:%02ld", deltaMinutes, deltaSecond];
}

- (NSString *)mdText {
    NSInteger value = [self integerValue];
    NSInteger year = value / 10000;
    NSInteger month = (value - year * 10000) / 100;
    NSInteger day = (value - year * 10000) - month * 100;
    return [NSString stringWithFormat:@"%02ld-%02ld", month, day];
}

- (NSString *)ymdText {
    NSInteger value = [self integerValue];
    NSInteger year = value / 10000;
    NSInteger month = (value - year * 10000) / 100;
    NSInteger day = (value - year * 10000) - month * 100;
    return [NSString stringWithFormat:@"%04ld-%02ld-%02ld", year, month, day];
}

- (NSString *)timeNow {
    NSInteger seconds = [self integerValue];
    NSInteger deltaHours = seconds / (60 * 60);
    NSInteger deltaMinutes = (seconds - (deltaHours * 60 * 60)) / 60;
    NSInteger deltaSecond = (seconds - (deltaHours * 60 * 60) - (deltaMinutes * 60));

    if (deltaHours == 0 && deltaMinutes == 0) {
        return [NSString stringWithFormat:@"%02ld", deltaSecond];
    } else if (deltaHours == 0) {
        return [NSString stringWithFormat:@"%02ld:%02ld", deltaMinutes, deltaSecond];
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", deltaHours, deltaMinutes, deltaSecond];
    }

    return [NSString string];
}

- (NSString *)timeLocalNow {
    NSInteger seconds = [self integerValue];
    NSInteger deltaHours = seconds / (60 * 60);
    NSInteger deltaMinutes = (seconds - (deltaHours * 60 * 60)) / 60;
    NSInteger deltaSecond = (seconds - (deltaHours * 60 * 60) - (deltaMinutes * 60));

    if (deltaHours == 0 && deltaMinutes == 0) {
        return [NSString stringWithFormat:@"%02ld秒", deltaSecond];
    } else if (deltaHours == 0) {
        return [NSString stringWithFormat:@"%02ld分%02ld秒", deltaMinutes, deltaSecond];
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%02ld时%02ld分%02ld秒", deltaHours, deltaMinutes, deltaSecond];
    }

    return [NSString string];
}

@end