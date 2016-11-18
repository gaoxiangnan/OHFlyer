//
//  AFApiManage.m
//  FlyShare
//
//  Created by zzxcc on 15/11/5.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#define body(x) @{@"body" : x}


#import "AFApiManage.h"
#import "NSString+Common.h"

@implementation AFApiManage
+ (instancetype)sharedManager {
    static AFApiManage *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}
//#---------------------api-----------------

#pragma mark  -login
- (void)loginWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_Login withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];

        User *user = [[User alloc] init];

        for (NSString *keys in [resultData allKeys]) {
            [user setValue:[resultData objectForKey:keys] forKey:keys];
        }
        
        if (user) {
            [Login doLogin:resultData];
        }
        
        if (resultData) {
            block(user, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -register
- (void)registWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_Register withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];
        if (resultData) {
            //注册成功操作
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];
}

//获取验证码
- (void)request_CaptchaNeededWithPath:(NSString *)mobile andBlock:(void (^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_RegisterWithCode withParams:body(@{@"mobile" : mobile}) withMethodType:Post andBlock:^(id data, NSError *error) {
       // id resultData = [data valueForKeyPath:@"body"];
        if (data) {
            //获取验证码
        }else{
            block(nil, error);
        }
    }];
}

//修改个人信息
- (void)request_UpdateUserInfoWithParams:(User *)users andBlock:(void(^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_UpdateUserInfo withParams:body([users toUpdateInfoParams]) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];

        if (data) {
            User *user = [[User alloc] init];
            
            for (NSString *keys in [resultData allKeys]) {
                [user setValue:[resultData objectForKey:keys] forKey:keys];
            }
            if (user) {
                [Login doLogin:resultData];
            }
            block(user, nil);
        }else{
            block(nil, error);
        }
    }];
}


#pragma mark -resetPwd
- (void)request_GetCodeResetPwdWithMobile:(NSString *)mobile andBlock:(void (^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_ForgetPwdWithCode      withParams:body(@{@"mobile" : mobile}) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

//重置密码
- (void)request_ResetPwdWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_ForgetPwd withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -editPwd
- (void)request_EditPwdWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_EditPwd withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
    
}

#pragma mark -contacts
- (void)request_GetContactsWithUserId:(NSString *)userid andBlock:(void (^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetContacts withParams:body(@{@"userId" : userid}) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];

        if (resultData) {
            block(resultData, nil);
        }else{

            block(nil, error);
        }
    }];
}

- (void)request_UpdateContactsWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_UpdateContacts withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_AddContactsWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_AddContacts withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_DeleteContactsWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_DeleteContacts withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -bonus
- (void)request_GetBonusListWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetBonusList withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];
//        NSString *str = [resultData valueForKey:@"maxId"];
//
//        //增加缓存,积分获取列表
//        NSMutableString *localPath = [kAPI_GetBonusList mutableCopy];
//
//        //第一次获取，无maxid，则缓存起来，以后每次比较max id如若一样则不改变，如若不一样，则append并更新缓存。每次取应该从缓存中取
//        [Bonus saveBonus:[resultData valueForKey:@"totalBonus"]];
//        if ([Bonus maxIdIsSaved]) {
//            if (![str isEqualToString:[Bonus getMaxId]] && str != nil) {
//                [Bonus appendResponseData:resultData toPath:localPath];
//                [Bonus saveMaxId:str];
//            }
////            [NSObject saveResponseData:resultData toPath:localPath];
//
//            resultData = [NSObject loadResponseWithPath:localPath];
//
//
//        }else{
//            [Bonus saveMaxId:str];
//            [NSObject saveResponseData:resultData toPath:localPath];
//        }
//        if (resultData) {
//            block(resultData, nil);
//
//        }else{
//            resultData = [NSObject loadResponseWithPath:localPath];
//            block(resultData, error);
//        }
        if (resultData) {
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];

}

#pragma mark -order
- (void)request_GetOrderListWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetOrderList withParams:body(@{@"userId" : [Login getUserId]}) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];
        if (resultData) {
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_UpdateOrderStatusWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_UpdateOrderStatus withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -selected
- (void)request_GetSelectedListWithUserId:(NSString *)userid andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetSelected withParams:body(userid) withMethodType:Post andBlock:^(id data, NSError *error) {
        id requestData = [data valueForKeyPath:@"body"];

        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -travel
- (void)request_GetTravelListWithUserId:(NSString *)userid andBlock:(void (^)(id data, NSError *error))block{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = @"正在获取数据";
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetTravels withParams:body(userid) withMethodType:Post andBlock:^(id data, NSError *error) {
        id requestData = [data valueForKeyPath:@"body"];
        [hud hide:YES];
        
        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_SubmitTravelOrderWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetTravelOrder withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        id requestData = [data valueForKeyPath:@"body"];
        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -buyAirplane
- (void)request_GetBuyPlaneListWithUseId:(NSString *)userid andBlock:(void (^)(id data, NSError *error))block{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = @"正在获取数据";

    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetBuyPlane withParams:body(userid) withMethodType:Post andBlock:^(id data, NSError *error) {
        [hud hide:YES];
        id requestData = [data valueForKeyPath:@"body"];
        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
    
}

- (void)request_SubmitBuyPlaneOrderWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetBuyPlaneOrder withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -charter
//- (void)request_SearchCharterInfoWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block
//{
//    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_SearchCharterInfo withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            block(data, nil);
//        }else{
//            block(error, nil);
//        }
//    }];
//}

- (void)request_GetPlaneModelWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetPlaneModels withParams:body(userId) withMethodType:Post andBlock:^(id data, NSError *error) {
        id requestData = [data valueForKeyPath:@"body"];
        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_SubmitChartOrderWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_SubmitChartOrder withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

//获取城市列表
- (void)request_GetCityListWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block
{
    //缓存
//    NSMutableString *localPath = [kAPI_GetAirportList mutableCopy];
//    id cacheData = [NSObject loadResponseWithPath:localPath];
//    if (cacheData) {
//        block(cacheData, nil);
//    }else{
        [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetAirportList withParams:body(userId) withMethodType:Post andBlock:^(id data, NSError *error) {
            id requestData = [[data valueForKeyPath:@"body"] objectForKey:@"Airport"];
            //缓存
             NSMutableString *localPath = [kAPI_GetAirportList mutableCopy];
            [NSObject saveResponseData:requestData toPath:localPath];

            if (requestData) {
                block(requestData, nil);
            }else{
                requestData = [NSObject loadResponseWithPath:localPath];
                block(requestData, error);
            }
        }];
}


#pragma mark -fly together
//获取优选特惠的产品
- (void)request_GetFTProductWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetFTSaleProductList withParams:body(userId) withMethodType:Post andBlock:^(id data, NSError *error) {
        id requestData = [data valueForKeyPath:@"body"] ;
        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
}

//拼机产品检索
- (void)request_SearchFTProductWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_SearchFTProduct withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        id requestData = [[data valueForKeyPath:@"body"] objectForKey:@"data"];
        
        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
}

//拼机订单提交
- (void)request_SubmitFTOrderWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block
{
     [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_SubmitFTOrder withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
         id requestData = [data valueForKeyPath:@"body"];
         
         if (requestData) {
             block(requestData, nil);
         }else{
             block(nil, error);
         }
     }];
}

//座位锁定
- (void)request_LockSeatsWithParams : (id)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_LockSeats withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -versionCheck
//获取版本信息
- (void)request_CheckVersionWithVersion:(NSString *)versionIdd andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_checkVersion withParams:body(@{@"version" : versionIdd}) withMethodType:Post andBlock:^(id data, NSError *error) {
        id requestData = [data valueForKeyPath:@"body"];

        if (requestData) {
            block(requestData, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -message

//获取消息列表
- (void)request_GetMessageListWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetMessageList withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];
        NSString *str = [resultData valueForKey:@"maxId"];
        NSMutableString *localPath = [kAPI_GetMessageList mutableCopy];
       // NSDictionary *paramss = body(params);
//        if (params) {
//            //- (NSString *)description //以ASCII编码的属性列表格式输出词典的词条
//            [localPath appendString:paramss.description];
//        }
        if ([MessageList maxIdIsSaved]) {
            if (![str isEqualToString:[MessageList getMaxId]]) {
                [MessageList appendResponseData:resultData toPath:localPath];
                [MessageList saveMaxId:str];
            }
            resultData = [NSObject loadResponseWithPath:localPath];
        }else{
            [MessageList saveMaxId:str];
            [NSObject saveResponseData:resultData toPath:localPath];
        }
        if (resultData) {
            
            block(resultData, nil);
        }else{
            resultData = [NSObject loadResponseWithPath:localPath];
            block(resultData, error);
        }
    }];
}

//获取国家列表
- (void)request_GetCountryListWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_GetCountryList withParams:body(@{@"userId" : userId}) withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];

        if (resultData) {
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];
}

#pragma mark -pay
//旅游支付接口
- (void)request_PayTravelWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage testPayJsonClient] requestJsonDataWithPath:kAPI_TravelAliPay withParams:params withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];
        
        if (resultData) {
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_PayFTWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
{
    [[AFNetManage testPayJsonClient] requestJsonDataWithPath:kAPI_FTAlipay withParams:params withMethodType:Post andBlock:^(id data, NSError *error) {
        id resultData = [data valueForKeyPath:@"body"];
        
        if (resultData) {
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_UpdateFTOrderWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:kAPI_CompleteGp withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}
- (void)requestWithParams:(id)params DataWithPath:(id)pathType andBlock:(void (^)(id data, NSError *error))block
{
    [[AFNetManage sharedJsonClient] requestJsonDataWithPath:pathType withParams:body(params) withMethodType:Post andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        }else{
            block(nil, error);
        }
    }];
}

@end
