
//
//  SettingViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingView.h"
#import "AboutMeViewController.h"
#import "ChangePwdViewController.h"
#import "Login.h"

@interface SettingViewController ()<pushView>
@property (nonatomic, strong) SettingView *settingView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = kTableViewBGColor;
    self.title = @"设置";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    [self InitWithSubViews];
}

- (void)InitWithSubViews
{
    [self.view addSubview:self.settingView];
}

- (UIView *)settingView
{
    if (!_settingView) {
        _settingView = [[SettingView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64)];
        _settingView.delegate = self;
    }
    return _settingView;
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -delegate
- (void)didSelectIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
//        if ([Login isLogin]) {
            [self.navigationController pushViewController:[ChangePwdViewController new] animated:YES];
//        }else{
//            kTipAlert(loginMessage);
//        }
    }else{
        [self.navigationController pushViewController:[AboutMeViewController new] animated:YES];
    }
}

- (void)loginOut
{
    [Login doLoginout];
    kTipAlert(@"退出成功");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginOut" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
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
