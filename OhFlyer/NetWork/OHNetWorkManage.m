//
//  OHNetWorkManage.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/4.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "OHNetWorkManage.h"

@implementation OHNetWorkManage

+ (instancetype)sharedManager
{
    static OHNetWorkManage *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred,^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}
- (void)requestWithParams:(id)params dataWithPath:(id)pathType networkMethod:(NetworkMethod)method andBlock:(void (^)(id data, NSError *error))block
{
    [[OHNetwork sharedJsonClient] requestJsonDataWithPath:pathType withParams:params withMethodType:method withSuccessBlock:^(NSDictionary *object) {
        NSLog(@"progress is %@",object);
        if (object) {
            block(object, nil);
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"progress is %@",error);

        block(nil,error);
    } progress:^(float progress) {
        NSLog(@"progress is %f",progress);
    }];
}


@end
