//
//  Contacts.h
//  FlyShare
//
//  Created by zzxcc on 16/1/7.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contacts : NSObject

@property (nonatomic, strong, nonnull) NSString *id;
@property (nonatomic, strong, nonnull) NSString *name;
@property (nonatomic, strong, nonnull) NSString *last_name;
@property (nonatomic, strong, nonnull) NSString *first_name;
@property (nonatomic, strong, nonnull) NSNumber *card_type;
@property (nonatomic, strong, nonnull) NSString *card_no;
@property (nonatomic, strong, nonnull) NSString *country;
@property (nonatomic, strong, nonnull) NSString *birthday;
@property (nonatomic, strong, nonnull) NSString *mobile;
@property (nonatomic, strong, nonnull) NSString *card_period;
@property (nonatomic, strong, nonnull) NSString *userId;
@property (nonatomic, strong, nonnull) NSNumber *sex;

- (NSDictionary *)toAddContactsParams;

- (NSDictionary *)toUpdateContactParams;

+ (NSString *)convertToStringWithCardType:(NSNumber *)cardType;
+ (NSString *)convertToStringWithSexType:(NSNumber *)sex;

- (NSString *)validateInfo;
@end
