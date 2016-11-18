//
// Created by 江明 赵 on 12/31/14.
// Copyright (c) 2014 江明 赵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Date)

- (NSString *)timeAgo;

- (NSDate *)date;

- (NSString *)secMin;

- (NSString *)min;

- (NSString *)timeText;

- (NSString *)timeLocalNow;

- (NSString *)ymdText;

- (NSString *)mdText;

- (NSString *)dayText;

@end