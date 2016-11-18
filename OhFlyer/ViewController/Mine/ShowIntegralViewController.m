//
//  ShowIntegralViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/11.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ShowIntegralViewController.h"
#import "AppDelegate.h"

@interface ShowIntegralViewController ()
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *contentLb;

@property (nonatomic, strong) UIButton *backBtn;


@end

@implementation ShowIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    alphaView.backgroundColor = [UIColor clearColor];
    baseView.backgroundColor = [UIColor blackColor];
    baseView.alpha = 0.85;
    [self.view addSubview:baseView];
    
    
    [self.view addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(kScaleFrom_iPhone5s_Desgin(126));
    }];
    
    [self.view addSubview:self.contentLb];
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_titleLb.mas_bottom).offset(20);
        make.width.equalTo(@(kDeviceWidth - 108));
    }];
    
    [self.view addSubview:self.backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kScaleFrom_iPhone5s_Desgin(240));
        make.width.height.equalTo(@(30));
    }];
    // Do any additional setup after loading the view from its nib.
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"会员积分兑换方式";
        _titleLb.textColor = RGBACOLOR(255, 255, 255, 1);
        _titleLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _titleLb;
}
- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLb.numberOfLines = 0;
        _contentLb.text = @"1、积分可用于完成拼机、包机产品支付前使用，现金在产品内使用；\n2、单个账户单天使用积分不可超过500积分，银卡及以上等级会员单个账户当天可一次性使用550积分；\n3、会员积分可在后期逐渐开放的会员商城直接兑换商品。";
        _contentLb.textColor = RGBACOLOR(255, 255, 255, 1);
        _contentLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_contentLb.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:12];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_contentLb.text length])];
        _contentLb.attributedText = attributedString;
        
        [_contentLb sizeToFit];
    }
    return _contentLb;
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
