//
//  Address.m
//  FlyShare
//
//  Created by 向楠 on 16/6/1.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "Address.h"
#import "NSString+Format.h"

@implementation Address
- (NSDictionary *)toAddContactsParams
{
    return @{@"id" : _id ? _id : @"",
             @"name" : _name ? _name : @"",
             @"mobile" : _mobile ? _mobile : @"",
             @"area_name" : _area_name ? _area_name : @"",
             @"area_id"   : _area_id   ?_area_id : @"",
             @"address" : _address ? _address : @"",
            };
}

- (NSDictionary *)toUpdateContactParams
{
    return @{@"id" : _id ? _id : @"",
             @"name" : _name ? _name : @"",
             @"mobile" : _mobile ? _mobile : @"",
             @"area_name" : _area_name ? _area_name : @"",
             @"area_id"   : _area_id   ?_area_id : @"",
             @"address" : _address ? _address : @"",
             };
}


- (NSString *)validateInfo
{
    NSString *tipStr = nil;
    
    
        if (!_name || _name.length <= 0) {
            tipStr = @"请输入姓名";
        }else if(!_area_name || _area_name.length <= 0){
            tipStr = @"请选择所在城市";
        }else if (!_mobile && _mobile.length <= 0){
            tipStr = @"请输入手机号";
        }else if (!_address && _address.length <= 0) {
            tipStr = @"请输入详细地址";
        }else if (![NSString validatePhone:_mobile]){
            tipStr = @"手机号格式不正确";
        }
    
    
    return tipStr;
}
@end
