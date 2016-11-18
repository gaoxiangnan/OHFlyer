//
//  Bonus.h
//  FlyShare
//
//  Created by zzxcc on 16/1/12.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bonus : NSObject
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *bonus;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *op_time;
@property (nonatomic, strong) NSString *maxId;
@property (nonatomic, strong) NSString *totalBonus;


+ (void)saveMaxId:(NSString *)maxid;
+ (BOOL)maxIdIsSaved;
+ (NSString *)getMaxId;
+ (void)saveBonus:(NSString *)bonus;

+ (BOOL)appendResponseData:(NSDictionary *)data toPath:(NSString *)requestPath;


@end
