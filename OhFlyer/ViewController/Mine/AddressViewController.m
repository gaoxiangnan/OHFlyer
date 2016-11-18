//
//  AddressViewController.m
//  FlyShare
//
//  Created by 向楠 on 16/5/31.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressView.h"
#import "Address.h"
//#import "AFApiManage.h"
@interface AddressViewController()<AddressDelegate>
@property (nonatomic, strong) AddressView *addressView;
//@property (nonatomic, strong) User *user;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    if (!self.myAddress) {
        self.myAddress = [[Address alloc] init];
        self.title = @"设置常用地址";
    }else{
        self.title = @"编辑常用地址";
        [self rightWithText:@"删除" textColor:nil action:@selector(DeleteAction)];
    }
//    self.user = [Login curLoginUser];
    [self InitWithSubViews];
    
    // Do any additional setup after loading the view.
}
- (void)InitWithSubViews
{
    [self.view addSubview:self.addressView];
}
- (AddressView *)addressView
{
    if (!_addressView) {
        _addressView = [[AddressView alloc]initWithFrame:self.view.frame andDictionary:self.areaDic];
        _addressView.delegate = self;
        _addressView.address = self.myAddress;
        _addressView.backgroundColor = [UIColor whiteColor];
    }
    return _addressView;
}
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sureBt:(NSString *)ids withParams:(Address *)address
{
    [self.view endEditing:YES];
    NSString *tipStr = [address validateInfo];
    if (tipStr) {
        kTipAlert(@"%@", tipStr);
        return;
    }
    
//    NSDictionary *params = @{@"name" : address.name,
//                             @"mobile" :address.mobile,
//                             @"areaName" :address.area_name,
//                             @"address" : address.address,
//                             @"areaId" : address.area_id,
//                             @"userId" : [Login curLoginUser].id};
    
    [self.view endEditing:YES];
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc]
                              initWithActivityIndicatorStyle:
                              UIActivityIndicatorViewStyleGray];
        CGSize captchaViewSize = self.view.bounds.size;
        _activityIndicator.hidesWhenStopped = YES;
        [_activityIndicator setCenter:CGPointMake(captchaViewSize.width/2, captchaViewSize.height/2)];
        [self.view addSubview:_activityIndicator];
    }
    [_activityIndicator startAnimating];
//    if (ids.length > 0) {
//        [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/editAddress" andBlock:^(id data, NSError *error) {
//            [_activityIndicator stopAnimating];
//            if (data) {
//                [self.navigationController popViewControllerAnimated:YES];
//                kTipAlert(@"编辑成功");
//            }else{
//                [NSObject showError:error];
//            }
//        }];
//    }else{
//        [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/newAddress" andBlock:^(id data, NSError *error) {
//            [_activityIndicator stopAnimating];
//            if (data) {
//                [self.navigationController popViewControllerAnimated:YES];
//                kTipAlert(@"添加成功");
//            }else{
//                [NSObject showError:error];
//            }
//        }];
//    }
    
    
    
}
- (void)DeleteAction
{
//    NSDictionary *params = @{@"id" : [self.myAddress valueForKey:@"id"],
//                             @"userId" : self.user.id};
//    //删除这个联系人
//    [self.view endEditing:YES];
//    if (!_activityIndicator) {
//        _activityIndicator = [[UIActivityIndicatorView alloc]
//                              initWithActivityIndicatorStyle:
//                              UIActivityIndicatorViewStyleGray];
//        CGSize captchaViewSize = self.view.bounds.size;
//        _activityIndicator.hidesWhenStopped = YES;
//        [_activityIndicator setCenter:CGPointMake(captchaViewSize.width/2, captchaViewSize.height/2)];
//        [self.view addSubview:_activityIndicator];
//    }
//    [_activityIndicator startAnimating];
//    
//    [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/deleteAddress" andBlock:^(id data, NSError *error) {
//        [_activityIndicator stopAnimating];
//        if (data) {
//            [self.navigationController popViewControllerAnimated:YES];
//            kTipAlert(@"删除成功");
//        }else{
//            [NSObject showError:error];
//        }
//    }];
}
@end
