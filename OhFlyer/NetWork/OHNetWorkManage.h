//
//  OHNetWorkManage.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/4.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OHNetwork.h"

@interface OHNetWorkManage : NSObject

+ (instancetype)sharedManager;

//公共网络调用
- (void)requestWithParams:(id)params dataWithPath:(id)pathType networkMethod:(NetworkMethod)method andBlock:(void (^)(id data, NSError *error))block;

@end
