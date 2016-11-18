//
//  Contacts.m
//  FlyShare
//
//  Created by zzxcc on 16/1/7.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "Contacts.h"
#import "NSString+Format.h"

#define kCardType @"login_status"

@implementation Contacts

- (NSDictionary *)toAddContactsParams
{
    return @{@"userId" : _id,
             @"name" : _name ? _name : @"",
             @"firstName" : _first_name ? _first_name : @"",
             @"lastName" : _last_name ? _last_name : @"",
             @"cardNo" : _card_no ? _card_no : @"",
             @"cardType" : _card_type ? _card_type : @"",
             @"sex" : _sex ? _sex : [NSNumber numberWithInteger:1],
             @"cardPeriod" : _card_period ? _card_period : @"",
             @"birthday" : _birthday ? _birthday : @"",
             @"country" : _country ? _country : @"",
             @"mobile" : _mobile ? _mobile : @""};
}

- (NSDictionary *)toUpdateContactParams
{
    return @{@"id" : _id,
             @"userId" : _userId,
             @"name" : _name ? _name : @"",
             @"firstName" : _first_name ? _first_name : @"",
             @"lastName" : _last_name ? _last_name : @"",
             @"cardNo" : _card_no ? _card_no : @"",
             @"cardType" : _card_type ? _card_type : @"",
             @"sex" : _sex ? _sex : [NSNumber numberWithInteger:1],
             @"cardPeriod" : _card_period ? _card_period : @"",
             @"birthday" : _birthday ? _birthday : @"",
             @"country" : _country ? _country : @"",
             @"mobile" : _mobile ? _mobile : @""};
}


+ (NSString *)convertToStringWithCardType:(NSNumber *)cardType
{
    switch ([cardType integerValue]) {
        case 0:
            return @"其它";
            break;
        case 1:
            return @"身份证";
            break;
        case 2:
            return @"护照";
            break;
        case 3:
            return @"台胞证";
            break;
        case 4:
            return @"回乡证";
            break;
        case 5:
            return @"军人证";
            break;
        case 6:
            return @"港澳通行证";
            break;
        case 7:
            return @"户口本";
            break;
        case 8:
            return @"出生证";
            break;
        default:
            return @"";
            break;
    }

}

+ (NSString *)convertToStringWithSexType:(NSNumber *)sex
{
    switch ([sex integerValue]) {
        case 1:
            return @"男";
            break;
        case 2:
            return @"女";
            break;
        default:
            return @"";
            break;
    }
}

- (NSString *)validateInfo
{
    NSString *tipStr = nil;
    
    if ([_card_type integerValue] == 1) {
        if (!_name || _name.length <= 0) {
            tipStr = @"请输入姓名";
        }else if(!_card_no || _card_no.length <= 0){
            tipStr = @"请输入证件号";
        }else if (!_mobile && _mobile.length <= 0){
            tipStr = @"请输入手机号";
        }else if (![NSString validateIDCardNumber:_card_no]) {
            tipStr = @"身份证号码格式不正确";
        }else if (![NSString validatePhone:_mobile]){
            tipStr = @"手机号格式不正确";
        }
    }else if ([_card_type integerValue] == 8) {
        if (!_name || _name.length <= 0) {
            tipStr = @"请输入姓名";
        }else if(!_card_no || _card_no.length <= 0){
            tipStr = @"请输入证件号";
        }else if (!_birthday || _birthday.length <= 0) {
            tipStr = @"请输入出生日期";
        }
    }else{
        if (!_name || _name.length <= 0) {
            tipStr = @"请输入姓名";
        }else if(!_card_no || _card_no.length <= 0){
            tipStr = @"请输入证件号";
        }else if (!_country || _country.length <= 0) {
            tipStr = @"请填写国籍";
        }
    }
 
    return tipStr;
}

@end
