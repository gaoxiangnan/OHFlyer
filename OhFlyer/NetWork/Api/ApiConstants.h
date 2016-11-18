//
//  ApiConstants.h
//  FlyShare
//
//  Created by zzxcc on 15/11/1.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#ifndef ApiConstants_h
#define ApiConstants_h


//测试地址
#define kBaseUrl_Test @"http://test-service.ohflyer.com/"

#define payUrl @"http://123.57.63.135:8001/Api/"
#define payUrl_Formal @"http://admin.ohflyer.com/Api/"//付款的正式地址

//正式地址
#define kBaseUrl_Formal @"http://service.ohflyer.com/"

#pragma mark -UserCenter Api
//获取版本信息
#define kAPI_checkVersion @"/?r=common/checkVersion"

//登陆path
#define kAPI_Login @"?r=user/login"

//注册
#define kAPI_Register @"?r=user/register"

//注册验证码
#define kAPI_RegisterWithCode @"?r=user/registerCode"

//重置密码发验证码
#define kAPI_ForgetPwdWithCode @"?r=user/forgotCode"

//重置密码
#define kAPI_ForgetPwd @"?r=user/forgotPasswd"

//修改密码
#define kAPI_EditPwd @"?r=user/editPasswd"

//获取联系人
#define kAPI_GetContacts @"?r=user/getContacts"

//添加联系人
#define kAPI_AddContacts @"?r=user/addContact"

//编辑联系人
#define kAPI_UpdateContacts @"?r=user/updateContact"

//删除联系人
#define kAPI_DeleteContacts @"?r=user/deleteContact"

//更新个人信息
#define kAPI_UpdateUserInfo @"?r=user/updateUser"

//查看积分列表
#define kAPI_GetBonusList @"?r=user/getBonus"

//版本检查
#define kAPI_VersionCheck @"?r=common/checkVersio"

//查看精选首页
#define kAPI_GetSelected @"?r=Selected/loadSelected"

//查看旅行首页
#define kAPI_GetTravels @"?r=Travel/loadTravels"

//查看旅行订单
#define kAPI_GetTravelOrder @"?r=Travel/travelOrder"

//查看购机首页
#define kAPI_GetBuyPlane @"?r=BuyPlane/loadBuyPlanes"

//查看购机订单
#define kAPI_GetBuyPlaneOrder @"?r=BuyPlane/buyPlaneOrder"

////搜索包机信息
//#define kAPI_SearchCharterInfo @"?r=CPlane/addTrip"

//查看飞机列表
#define kAPI_GetPlaneModels @"?r=CPlane/getPlaneModels"

//提交包机订单
#define kAPI_SubmitChartOrder @"?r=CPlane/cPOrder"

//查看航站楼
#define kAPI_GetAirportList @"?r=common/getAirportList"

//优选特惠
#define kAPI_GetFTSaleProductList  @"?r=GPlane/topGP"

//产品检索
#define kAPI_SearchFTProduct @"?r=GPlane/searchGP"

//拼机订单
#define kAPI_SubmitFTOrder @"?r=GPlane/gPOrder"

//支付完成拼机订单改变
#define kAPI_CompleteGp @"?r=GPlane/completeGP"

//获取订单列表
#define kAPI_GetOrderList @"?r=user/getOrderList"

//更新订单状态
#define kAPI_UpdateOrderStatus @"?r=user/updateOrderStatus"

//锁定位置
#define kAPI_LockSeats @"?r=GPlane/lockSeatGP"

//消息
#define kAPI_GetMessageList @"?r=user/getMessageList"

//选择国籍
#define kAPI_GetCountryList @"?r=common/getCountryList"

//支付
#define kAPI_TravelAliPay @"Pay/alipay_travel_tradeno"

#define kAPI_FTAlipay @"Pay/alipay_gp_tradeno"


#endif /* ApiConstants_h */
