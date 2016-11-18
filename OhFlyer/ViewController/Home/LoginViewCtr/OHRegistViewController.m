//
//  OHRegistViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "OHRegistViewController.h"

@interface OHRegistViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *phoneNum;
@property (nonatomic, strong) UITextField *codeNum;
@property (nonatomic, strong) UITextField *passwordNum;
@property (nonatomic, strong) UITextField *surePasswordNum;

@end

@implementation OHRegistViewController

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
    
    
    
    UIView *codeView = [UIView new];
    codeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:codeView];
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneView);
        make.top.equalTo(phoneView.mas_bottom).offset(20);
        make.width.equalTo(@(kDeviceWidth - 140));
        make.height.equalTo(@(40));
    }];
    UIImageView *codeImg = [UIImageView new];
    codeImg.image = [UIImage imageNamed:@"login_code"];
    [codeView addSubview:codeImg];
    [codeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeView).offset(10);
        make.centerY.equalTo(codeView);
    }];
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    codeBtn.layer.cornerRadius = 4;
    codeBtn.layer.borderWidth = 1;
    codeBtn.layer.borderColor = RGBCOLOR(10, 18, 50).CGColor;
    [codeBtn setTitleColor:RGBACOLOR(10, 18, 50, 1) forState:UIControlStateNormal];
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightLight];
    [codeBtn addTarget:self action:@selector(onGetCodeBtn) forControlEvents:UIControlEventTouchUpInside];
    [codeView addSubview:codeBtn];
    [codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(codeView.mas_right).offset(-3.5);
        make.centerY.equalTo(codeView).offset(-5);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(70)));
        make.height.equalTo(@(30));
    }];
    [codeView addSubview:self.codeNum];
    [_codeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImg.mas_right).offset(18);
        make.centerY.equalTo(codeImg);
        make.right.equalTo(codeBtn.mas_left);
    }];
    UIImageView *codeLine = [UIImageView new];
    codeLine.image = [UIImage imageNamed:@"login_line"];
    [codeView addSubview:codeLine];
    [codeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeView).offset(3.5);
        make.bottom.equalTo(codeView.mas_bottom);
    }];
    
    
    
    UIView *passwordView = [UIView new];
    passwordView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:passwordView];
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeView);
        make.top.equalTo(codeView.mas_bottom).offset(20);
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
    
    
    
    UIView *surePasswordView = [UIView new];
    surePasswordView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:surePasswordView];
    [surePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordView);
        make.top.equalTo(passwordView.mas_bottom).offset(20);
        make.width.equalTo(@(kDeviceWidth - 140));
        make.height.equalTo(@(40));
    }];
    UIImageView *surePasswordImg = [UIImageView new];
    surePasswordImg.image = [UIImage imageNamed:@"login_password"];
    [surePasswordView addSubview:surePasswordImg];
    [surePasswordImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(surePasswordView).offset(10);
        make.centerY.equalTo(surePasswordView);
    }];
    [surePasswordView addSubview:self.surePasswordNum];
    [_surePasswordNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(surePasswordImg.mas_right).offset(18);
        make.centerY.equalTo(surePasswordImg);
        make.width.equalTo(@(kDeviceWidth - 170));
    }];
    UIImageView *surePasswordLine = [UIImageView new];
    surePasswordLine.image = [UIImage imageNamed:@"login_line"];
    [surePasswordView addSubview:surePasswordLine];
    [surePasswordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(surePasswordView).offset(3.5);
        make.bottom.equalTo(surePasswordView.mas_bottom);
    }];
    
    
    UIButton *registBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBnt setTitle:@"注  册" forState:UIControlStateNormal];
    registBnt.backgroundColor = RGBACOLOR(10, 18, 50, 1);
    registBnt.layer.cornerRadius = 5;
    registBnt.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [registBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registBnt addTarget:self action:@selector(onRegistBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBnt];
    [registBnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(surePasswordLine);
        make.top.equalTo(surePasswordView.mas_bottom).offset(50);
        make.width.equalTo(surePasswordLine);
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
- (UITextField *)codeNum
{
    if (!_codeNum) {
        _codeNum = [UITextField new];
        _codeNum.placeholder = @"输入验证码";
        _codeNum.delegate = self;
        _codeNum.borderStyle = UITextBorderStyleNone;
        _codeNum.clearsOnBeginEditing = YES;
        _codeNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _codeNum;
}
- (UITextField *)passwordNum
{
    if (!_passwordNum) {
        _passwordNum = [UITextField new];
        _passwordNum.placeholder = @"设置密码";
        _passwordNum.delegate = self;
        _passwordNum.borderStyle = UITextBorderStyleNone;
        _phoneNum.clearsOnBeginEditing = YES;
        _passwordNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _passwordNum;
}
- (UITextField *)surePasswordNum
{
    if (!_surePasswordNum) {
        _surePasswordNum = [UITextField new];
        _surePasswordNum.placeholder = @"确认密码";
        _surePasswordNum.delegate = self;
        _surePasswordNum.borderStyle = UITextBorderStyleNone;
        _surePasswordNum.clearsOnBeginEditing = YES;
        _surePasswordNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _surePasswordNum;
}
- (void)onBackBtn
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)onGetCodeBtn
{
    
}
- (void)onRegistBtn
{
    
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
