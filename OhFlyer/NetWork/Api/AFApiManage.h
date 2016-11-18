//
//  AFApiManage.h
//  FlyShare
//
//  Created by zzxcc on 15/11/5.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetManage.h"
#import "User.h"
#import "Regist.h"
#import "Login.h"
#import "NSObject+Common.h"
#import "Bonus.h"
#import "MessageList.h"
#import "MBProgressHUD.h"

@interface AFApiManage : NSObject
+ (instancetype)sharedManager;

//登陆
- (void)loginWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block;

//注册
- (void)registWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block
;

//获取验证码
- (void)request_CaptchaNeededWithPath:(NSString *)mobile andBlock:(void (^)(id data, NSError *error))block;

//修改个人信息
- (void)request_UpdateUserInfoWithParams:(User *)users andBlock:(void(^)(id data, NSError *error))block;

//重置密码获取验证码
- (void)request_GetCodeResetPwdWithMobile:(NSString *)mobile andBlock:(void (^)(id data, NSError *error))block;

//重置密码
- (void)request_ResetPwdWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

//修改密码
- (void)request_EditPwdWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

//常用联系人
- (void)request_GetContactsWithUserId:(NSString *)userid andBlock:(void (^)(id data, NSError *error))block;

//添加联系人
- (void)request_AddContactsWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block;

//删除联系人
- (void)request_DeleteContactsWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block;

//编辑联系人
- (void)request_UpdateContactsWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block;

//获取积分列表
- (void)request_GetBonusListWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block;

//获取订单界面
- (void)request_GetOrderListWithUserId:(NSString *)userId andBlock:(void(^)(id data, NSError *error))block;

//更新订单状态
- (void)request_UpdateOrderStatusWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block;

//获取精选首页
- (void)request_GetSelectedListWithUserId:(NSString *)userid andBlock:(void(^)(id data, NSError *error))block;

//获取旅行首页
- (void)request_GetTravelListWithUserId:(NSString *)userid andBlock:(void (^)(id data, NSError *error))block;

//提交旅行订单
- (void)request_SubmitTravelOrderWithParams:(id)params andBlock:(void(^)(id data, NSError *error))block;

//获取购机首页
- (void)request_GetBuyPlaneListWithUseId:(NSString *)userid andBlock:(void (^)(id data, NSError *error))block;

//提交购机订单
- (void)request_SubmitBuyPlaneOrderWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block;

//查询包机信息
//- (void)request_SearchCharterInfoWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block;

//获取飞机列表
- (void)request_GetPlaneModelWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;

//提交包机订单
- (void)request_SubmitChartOrderWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block;

//获取城市和航站楼
- (void)request_GetCityListWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;

//获取优选特惠的产品
- (void)request_GetFTProductWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;

//提交拼机产品检索
- (void)request_SearchFTProductWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block;

//拼机订单提交
- (void)request_SubmitFTOrderWithParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block;

//座位锁定
- (void)request_LockSeatsWithParams : (id)params andBlock:(void (^)(id data, NSError *error))block;

//获取版本信息
- (void)request_CheckVersionWithVersion:(NSString *)versionIdd andBlock:(void (^)(id data, NSError *error))block;

//获取消息列表
- (void)request_GetMessageListWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

//获取国家列表
- (void)request_GetCountryListWithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;

//旅游支付接口
- (void)request_PayTravelWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

//拼机支付接口
- (void)request_PayFTWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

//拼机支付完成更新
- (void)request_UpdateFTOrderWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

//公共request调用
- (void)requestWithParams:(id)params DataWithPath:(id)pathType andBlock:(void (^)(id data, NSError *error))block;

@end
