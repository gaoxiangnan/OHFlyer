//
//  OHLoginViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "OHLoginViewController.h"
#import "OHRegistViewController.h"
#import "OHResetViewController.h"

@interface OHLoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *phoneNum;
@property (nonatomic, strong) UITextField *passwordNum;

@end

@implementation OHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImg = [UIImageView new];
    bgImg.image = [UIImage imageNamed:@"login_bgimg"];
    [self.view addSubview:bgImg];
    [bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(320));
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"custom_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(30);
        make.width.height.equalTo(@(28));
    }];
    
    UIView *phoneView = [UIView new];
    phoneView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(70);
        make.top.equalTo(self.view).offset(280);
        make.width.equalTo(@(kDeviceWidth - 140));
        make.height.equalTo(@(40));
    }];
    UIImageView *phoneImg = [UIImageView new];
    phoneImg.image = [UIImage imageNamed:@"login_phone"];
    [phoneView addSubview:phoneImg];
    [phoneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneView).offset(10);
        make.centerY.equalTo(phoneView);
    }];
    [phoneView addSubview:self.phoneNum];
    [_phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneImg.mas_right).offset(18);
        make.centerY.equalTo(phoneImg);
        make.width.equalTo(@(kDeviceWidth - 170));
    }];
    UIImageView *phoneLine = [UIImageView new];
    phoneLine.image = [UIImage imageNamed:@"login_line"];
    [phoneView addSubview:phoneLine];
    [phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneView).offset(3.5);
        make.bottom.equalTo(phoneView.mas_bottom);
    }];
    
    
    UIView *passwordView = [UIView new];
    passwordView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:passwordView];
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneView);
        make.top.equalTo(phoneView.mas_bottom).offset(20);
        make.width.equalTo(@(kDeviceWidth - 140));
        make.height.equalTo(@(40));
    }];
    UIImageView *passwordImg = [UIImageView new];
    passwordImg.image = [UIImage imageNamed:@"login_password"];
    [passwordView addSubview:passwordImg];
    [passwordImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordView).offset(10);
        make.centerY.equalTo(passwordView);
    }];
    [passwordView addSubview:self.passwordNum];
    [_passwordNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordImg.mas_right).offset(18);
        make.centerY.equalTo(passwordImg);
        make.width.equalTo(@(kDeviceWidth - 170));
    }];
    UIImageView *passwordLine = [UIImageView new];
    passwordLine.image = [UIImage imageNamed:@"login_line"];
    [passwordView addSubview:passwordLine];
    [passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordView).offset(3.5);
        make.bottom.equalTo(passwordView.mas_bottom);
    }];
    
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    registBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    [registBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(onRegistBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordLine);
        make.top.equalTo(passwordView.mas_bottom).offset(26);
        make.width.equalTo(@(50));
        make.height.equalTo(@(20));
    }];
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(onForgetBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(passwordLine.mas_right);
        make.top.equalTo(registBtn);
        make.width.equalTo(@(50));
        make.height.equalTo(@(20));
    }];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = RGBACOLOR(10, 18, 50, 1);
    loginBtn.layer.cornerRadius = 5;
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(onLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordLine);
        make.top.equalTo(registBtn.mas_bottom).offset(50);
        make.width.equalTo(passwordLine);
        make.height.equalTo(@(40));
    }];
    
    
    // Do any additional setup after loading the view.
}
- (UITextField *)phoneNum
{
    if (!_phoneNum) {
        _phoneNum = [UITextField new];
        _phoneNum.placeholder = @"输入您的手机号";
        _phoneNum.delegate = self;
        _phoneNum.borderStyle = UITextBorderStyleNone;
        _phoneNum.clearsOnBeginEditing = YES;
        _phoneNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _phoneNum;
}
- (UITextField *)passwordNum
{
    if (!_passwordNum) {
        _passwordNum = [UITextField new];
        _passwordNum.placeholder = @"输入密码";
        _passwordNum.delegate = self;
        _passwordNum.borderStyle = UITextBorderStyleNone;
        _phoneNum.clearsOnBeginEditing = YES;
        _passwordNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _passwordNum;
}
- (void)onBackBtn
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)onRegistBtn
{
    OHRegistViewController *registVC = [[OHRegistViewController alloc]init];
    [self presentViewController:registVC animated:YES completion:^{
        
    }];
//    [self.navigationController pushViewController:registVC animated:YES];
}
- (void)onForgetBtn
{
    OHResetViewController *resettVC = [[OHResetViewController alloc]init];
    CATransition *animation = [CATransition animation];
    
    animation.duration = 1.0;
    
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
//    animation.type = @"pageCurl";
    
    animation.type = kCATransitionPush;
    
    animation.subtype = kCATransitionFromRight;
    
    [self.view.window.layer addAnimation:animation forKey:nil];
    
    [self presentViewController:resettVC animated:NO completion:^{
        
    }];
//    [self presentModalViewController:resettVC animated:NO completion:nil];
}
- (void)onLoginBtn
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
