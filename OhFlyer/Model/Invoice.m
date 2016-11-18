//
//  Invoice.m
//  FlyShare
//
//  Created by 向楠 on 16/6/1.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "Invoice.h"

#import "NSString+Format.h"

@implementation Invoice
- (NSDictionary *)toAddContactsParams
{
    return @{@"id"    : _id    ? _id    : @"",
             @"title" : _title ? _title : @"",
             @"status" : _status ? _status : @"",
             };
}

- (NSDictionary *)toUpdateContactParams
{
    return @{@"id"    : _id    ? _id    : @"",
             @"title" : _title ? _title : @"",
             @"status" : _status ? _status : @"",
             };
}


- (NSString *)validateInfo
{
    NSString *tipStr = nil;
    
    
    if (!_title || _title.length <= 0) {
        tipStr = @"请输入发票抬头";
    }
    return tipStr;
}

@end
