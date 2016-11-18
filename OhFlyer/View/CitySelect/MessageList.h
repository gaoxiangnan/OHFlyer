//
//  MessageList.h
//  FlyShare
//
//  Created by zzxcc on 16/1/4.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageList : NSObject
@property (nonatomic, strong, nonnull) NSString *message;
@property (nonatomic, strong, nonnull) NSString *id;
//1.系统通知 2.手动通知
@property (nonatomic, strong, nonnull) NSNumber *msg_type;
@property (nonatomic, strong, nonnull) NSString *send_time;

//1.未读，2.已读
@property (nonatomic, strong, nonnull) NSNumber *flag;

+ (void)saveMaxId:(NSString *)maxid;

+ (NSString *)getMaxId;

+ (BOOL)maxIdIsSaved;

+ (BOOL)appendResponseData:(NSDictionary *)data toPath:(NSString *)requestPath;

+ (BOOL)updateFlagWithId:(NSString *)messageId toPath:(NSString *)requestPath;

+ (BOOL)updataeAllFlagToReadWithPath:(NSString *)requestPath;

+ (void)deleteSeletedMessageWithId:(NSString *)messageId andPath:(NSString *)requestPath;

@end
