//
//  AFNetManage.h
//  FlyShare
//
//  Created by zzxcc on 15/11/2.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum{
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

typedef NS_ENUM(NSInteger, IllegalContentType) {
    IllegalContentTypeTweet = 0,
    IllegalContentTypeTopic,
    IllengalContentTypeProject,
    IllegalContentTypeWebsite
};

@interface AFNetManage : AFHTTPSessionManager


+ (id)sharedJsonClient;
//+ (id)changeJsonClient;
+ (id)testPayJsonClient;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block;

@end
