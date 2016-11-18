//
//  Address.h
//  FlyShare
//
//  Created by 向楠 on 16/6/1.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject
@property (nonatomic, strong, nonnull) NSString *id;
@property (nonatomic, strong, nonnull) NSString *name;
@property (nonatomic, strong, nonnull) NSString *mobile;
@property (nonatomic, strong, nonnull) NSString *area_name;
@property (nonatomic, strong, nonnull) NSString *area_id;
@property (nonatomic, strong, nonnull) NSString *address;

- (NSDictionary *)toAddContactsParams;

- (NSDictionary *)toUpdateContactParams;

- (NSString *)validateInfo;


@end
