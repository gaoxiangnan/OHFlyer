//
//  TuigaiViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/8.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TuigaiViewController.h"

@interface TuigaiViewController ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UIImageView *contentImg;
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation TuigaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight));
    }];
    
    [_bgView addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_bgView).offset(118);
    }];
    
    [_bgView addSubview:self.contentImg];
    [_contentImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_titleLb.mas_bottom).offset(45);
    }];
    [_bgView addSubview:self.backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_contentImg.mas_bottom).offset(70);
        make.width.height.equalTo(@(30));
    }];
    // Do any additional setup after loading the view.
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.85;
    }
    return _bgView;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"退改签说明";
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _titleLb;
}
- (UIImageView *)contentImg
{
    if (!_contentImg) {
        _contentImg = [UIImageView new];
        _contentImg.image = [UIImage imageNamed:@"order_tuigai"];
    }
    return _contentImg;
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"order_close"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (void)onBackBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
