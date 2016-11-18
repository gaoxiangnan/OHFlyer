//
//  OHResetViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "OHResetViewController.h"

@interface OHResetViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *canPassword;
@property (nonatomic, strong) UITextField *surePassword;

@end

@implementation OHResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *navBarView = [UIView new];
    navBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBarView];
    [navBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(64));
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"custom_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    [navBarView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(navBarView).offset(20);
        make.top.equalTo(navBarView).offset(30);
        make.width.height.equalTo(@(28));
    }];
    UILabel *titleLb = [UILabel new];
    titleLb.text = @"重置密码";
    titleLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    titleLb.textColor = [UIColor blackColor];
    [navBarView addSubview:titleLb];
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(navBarView);
        make.top.equalTo(navBarView).offset(32);
    }];
    
    
    
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(navBarView);
        make.top.equalTo(navBarView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(170));
    }];
    
    
    
    
    
    
    [bgView addSubview:self.canPassword];
    [_canPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(45);
        make.top.equalTo(bgView).offset(30);
    }];
    UIView *lineCan = [UIView new];
    lineCan.backgroundColor = RGBACOLOR(10, 18, 50, 0.5);
    [bgView addSubview:lineCan];
    [lineCan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(45);
        make.right.equalTo(bgView.mas_right).offset(-45);
        make.top.equalTo(_canPassword.mas_bottom).offset(10);
        make.height.equalTo(@(1));
    }];
    
    
    
    
    
    
    [bgView addSubview:self.surePassword];
    [_surePassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(45);
        make.top.equalTo(lineCan.mas_bottom).offset(40);
    }];
    UIView *lineSure = [UIView new];
    lineSure.backgroundColor = RGBACOLOR(10, 18, 50, 0.7);
    [bgView addSubview:lineSure];
    [lineSure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(45);
        make.width.equalTo(lineCan);
        make.top.equalTo(_surePassword.mas_bottom).offset(10);
        make.height.equalTo(@(1));
    }];
    
    
    
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"注  册" forState:UIControlStateNormal];
    sureBtn.backgroundColor = RGBACOLOR(10, 18, 50, 1);
    sureBtn.layer.cornerRadius = 5;
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(onRegistBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineCan);
        make.top.equalTo(bgView.mas_bottom).offset(50);
        make.width.equalTo(lineCan);
        make.height.equalTo(@(40));
    }];
    // Do any additional setup after loading the view.
}
- (UITextField *)canPassword
{
    if (!_canPassword) {
        _canPassword = [UITextField new];
        _canPassword.placeholder = @"请输入您的新密码";
        _canPassword.delegate = self;
        _canPassword.borderStyle = UITextBorderStyleNone;
        _canPassword.clearsOnBeginEditing = YES;
        _canPassword.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _canPassword;
}
- (UITextField *)surePassword
{
    if (!_surePassword) {
        _surePassword = [UITextField new];
        _surePassword.placeholder = @"确认新密码";
        _surePassword.delegate = self;
        _surePassword.borderStyle = UITextBorderStyleNone;
        _surePassword.clearsOnBeginEditing = YES;
        _surePassword.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _surePassword;
}
- (void)onRegistBtn
{
    
}
- (void)onBackBtn
{
    CATransition *animation = [CATransition animation];
    
    animation.duration = 1.0;
    
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
    //    animation.type = @"pageCurl";
    
    animation.type = kCATransitionPush;
    
    animation.subtype = kCATransitionFromLeft;
    
    [self.view.window.layer addAnimation:animation forKey:nil];
    
    [self dismissViewControllerAnimated:NO completion:^{
        
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
