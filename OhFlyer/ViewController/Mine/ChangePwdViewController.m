
//
//  ChangePwdViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "ChangePwdViewController.h"
#import "ChangePwdView.h"
#import "UserDetailCell.h"
#import "AFApiManage.h"
#import "User.h"
#import "NSObject+Common.h"
#import "MineViewController.h"

@interface ChangePwdViewController ()<UserDetailCellDelegate>
@property (nonatomic, strong) ChangePwdView *changePwd;
@property (nonatomic, strong) User *loginUser;

@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"密码修改";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
//    [self rightWithText:@"完成" action:@selector(saveAction)];
    
    self.loginUser = [[User alloc] init];
    self.loginUser.id = [Login curLoginUser].id;
    [self InitWithSubViews];
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.changePwd];
}

- (UIView *)changePwd
{
    if (!_changePwd) {
        _changePwd = [[ChangePwdView alloc] initWithFrame:self.view.frame];
    }
    return _changePwd;
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveAction
{
    NSString *tipStr = [self.loginUser changePasswordTips];
    if (tipStr) {
        kTipAlert(@"%@", tipStr);
        return;
    }
    
    
    [[AFApiManage sharedManager] request_EditPwdWithParams:[self.loginUser toResetPasswordParams] andBlock:^(id data, NSError *error) {
        if (data) {
            kTipAlert(@"修改成功");
            MineViewController *vc = [MineViewController new];
            [self popToViewController:vc];
        }else{
            [NSObject showError:error];
        }
    }];
}

#pragma mark -delegate
- (void)textValueChangedd:(UITextField *)text andTextIdentify:(NSString *)str
{
    if ([str isEqualToString:@"输入旧密码"]) {
        if (text.text.length > 16) {
            text.text = [text.text substringToIndex:16];
        }
        self.loginUser.password = text.text;
    }else if ([str isEqualToString:@"输入新密码(6-16位)"]){
        if (text.text.length > 16) {
            text.text = [text.text substringToIndex:16];
        }
        self.loginUser.passwordNeww = text.text;
    }else if ([str isEqualToString:@"确认密码(6-16位)"]){
        if (text.text.length > 16) {
            text.text = [text.text substringToIndex:16];
        }
        self.loginUser.passwordConfirm = text.text;
    }
    
}

- (void)popToViewController:(UIViewController *)vc
{
    for (UIViewController *vcHome in self.navigationController.viewControllers) {
        if ([vcHome isKindOfClass:[vc class]]) {
            [self.navigationController popToViewController:vcHome animated:YES];
        }
    }
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
