//
//  IntegralDetailView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "IntegralDetailView.h"
#import "IntegralDetailTableViewCell.h"

@interface IntegralDetailView ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _oldOffset;
}
@property (nonatomic, strong) UITableView *integralTab;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *integralLb;
@property (nonatomic, strong) UILabel *userNameLb;
@property (nonatomic, strong) UILabel *phoneNumLb;

@property (nonatomic, strong) UIButton *backBtn;



@end

@implementation IntegralDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        [self InitWithSubViews];

    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.integralTab];
    [self addSubview:self.backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-kScaleFrom_iPhone5s_Desgin(24));
        make.width.height.equalTo(@(36));
    }];
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.hidden = YES;
        [_backBtn setImage:[UIImage imageNamed:@"yuan_backBtn"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UITableView *)integralTab
{
    if (!_integralTab) {
        _integralTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
        _integralTab.delegate = self;
        _integralTab.dataSource = self;
        _integralTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _integralTab;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 50;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.borderWidth = 3;
        _loginBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    return _loginBtn;
}
- (UILabel *)integralLb
{
    if (!_integralLb) {
        _integralLb = [UILabel new];
        _integralLb.textColor = [UIColor colorWithRed:222/255.0 green:21/255.0 blue:21/255.0 alpha:1];
        _integralLb.text = @"52400";
        _integralLb.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    }
    return _integralLb;
}
- (UILabel *)userNameLb
{
    if (!_userNameLb) {
        _userNameLb = [[UILabel alloc] init];
        _userNameLb.text = @"飞享者";
        _userNameLb.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
        _userNameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _userNameLb;
}
- (UILabel *)phoneNumLb
{
    if (!_phoneNumLb) {
        _phoneNumLb = [UILabel new];
        _phoneNumLb.text = @"18348788486";
        _phoneNumLb.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
        _phoneNumLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _phoneNumLb;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kScaleFrom_iPhone5s_Desgin(208);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceHeight, kScaleFrom_iPhone5s_Desgin(208))];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIButton *explainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    explainBtn.frame = CGRectMake(kScaleFrom_iPhone5s_Desgin(339), kScaleFrom_iPhone5s_Desgin(36), 16, 18);
    [explainBtn setBackgroundImage:[UIImage imageNamed:@"integral_explain"] forState:UIControlStateNormal];
    [explainBtn addTarget:self action:@selector(onIntegralExplainBtn) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:explainBtn];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, kScaleFrom_iPhone5s_Desgin(64), kDeviceWidth, kScaleFrom_iPhone5s_Desgin(93))];
    bgView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6" alpha:1];
    
    [bgView addSubview:self.loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(kScaleFrom_iPhone5s_Desgin(20));
        make.top.equalTo(bgView).offset(-kScaleFrom_iPhone5s_Desgin(20));
        make.width.height.equalTo(@(100));
    }];
    UIImageView *ingegralImg = [[UIImageView alloc]initWithFrame:CGRectMake(kScaleFrom_iPhone5s_Desgin(295), kScaleFrom_iPhone5s_Desgin(20), 20, 22)];
    ingegralImg.image = [UIImage imageNamed:@"my_integral"];
    [bgView addSubview:ingegralImg];
    
    [bgView addSubview:self.integralLb];
    [_integralLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(kScaleFrom_iPhone5s_Desgin(274));
        make.top.equalTo(bgView).offset(kScaleFrom_iPhone5s_Desgin(46));
    }];
    [bgView addSubview:self.userNameLb];
    [_userNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(kScaleFrom_iPhone5s_Desgin(134));
        make.top.equalTo(bgView).offset(kScaleFrom_iPhone5s_Desgin(25));
    }];
    [bgView addSubview:self.phoneNumLb];
    [_phoneNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userNameLb);
        make.top.equalTo(_integralLb).offset(10);
    }];
    
    UIImageView *integralPic = [[UIImageView alloc]initWithFrame:CGRectMake(20, kScaleFrom_iPhone5s_Desgin(180), 9, 14)];
    integralPic.image = [UIImage imageNamed:@"integral_detail"];
    [headerView addSubview:integralPic];
    
    UILabel *integralDetail = [[UILabel alloc] initWithFrame:CGRectMake(40, kScaleFrom_iPhone5s_Desgin(180), 100, 20)];
    integralDetail.text = @"积分明细";
    integralDetail.textColor = RGBACOLOR(0, 0, 0, 0.7);
    integralDetail.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [headerView addSubview:integralDetail];
    
    [headerView addSubview:bgView];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"IntegralDetailTableViewCell";
    IntegralDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[IntegralDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y > _oldOffset) {//如果当前位移大于缓存位移，说明scrollView向上滑动
        _backBtn.hidden = YES;
        NSLog(@"1111111111");
    }else{
        _backBtn.hidden = NO;
        NSLog(@"22222222222");
    }
    
    _oldOffset = scrollView.contentOffset.y;//将当前位移变成缓存位移
    
    
}
- (void)onBackBtn
{
    if (_myBlock) {
        _myBlock();
    }
}
- (void)onIntegralExplainBtn
{
    if (_explainBlock) {
        _explainBlock();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
