//
//  Invoice.h
//  FlyShare
//
//  Created by 向楠 on 16/6/1.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Invoice : NSObject
@property (nonatomic, strong, nonnull) NSString *id;
@property (nonatomic, strong, nonnull) NSString *status;
@property (nonatomic, strong, nonnull) NSString *title;

- (NSDictionary *)toAddContactsParams;

- (NSDictionary *)toUpdateContactParams;

- (NSString *)validateInfo;
@end
