#import "NSDate+Ago.h"

@implementation NSDate (TimeAgo)

- (NSString *)timeAgo {
    NSDate *now = [NSDate date];
    double deltaSeconds = fabs([self timeIntervalSinceDate:now]);
    double deltaMinutes = deltaSeconds / 60.0f;

    int minutes;

    if (deltaSeconds < 5) {
        return @"刚刚";
    } else if (deltaSeconds < 60) {
        return [NSString stringWithFormat:@"%d秒前", (int) deltaSeconds];
    } else if (deltaSeconds < 120) {
        return @"1分钟前";
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%d分钟前", (int) deltaMinutes];
    } else if (deltaMinutes < 120) {
        return @"1小时前";
    } else if (deltaMinutes < (24 * 60)) {
        minutes = (int) floor(deltaMinutes / 60);
        return [NSString stringWithFormat:@"%d小时前", minutes];
    } else if (deltaMinutes < (24 * 60 * 2)) {
        return @"昨天";
    } else if (deltaMinutes < (24 * 60 * 7)) {
        minutes = (int) floor(deltaMinutes / (60 * 24));
        return [NSString stringWithFormat:@"%d天前", minutes];
    } else if (deltaMinutes < (24 * 60 * 14)) {
        return @"1周前";
    } else {
        static NSDateFormatter *dateFormatter;
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd";
        }

        return [dateFormatter stringFromDate:self];
    }
}

@end
