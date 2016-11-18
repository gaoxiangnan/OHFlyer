//
//  CT_OrderDetailView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/9.
//  Copyright © 2016年 Vutumn. All rights reserved.
//  “包机”

#import "CT_OrderDetailView.h"
#import "BottomShadowView.h"
#import "OrderTableViewCell.h"
//#import "CT_OrderDetailCell.h"
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)

#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleBgViewHeight kScaleFrom_iPhone5s_Desgin(65)
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleMoreWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define CT_OrderTableCellHeight kScaleFrom_iPhone5s_Desgin(110)


@interface CT_OrderDetailView ()<UITableViewDelegate,UITableViewDataSource>
{
    int aa;
    int abc;
}

@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIView *bgOneView;
@property (nonatomic, strong) UIView *bgTwoView;

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UILabel *orderStateLabel;
@property (nonatomic, strong) UILabel *orderNoLb;
@property (nonatomic, strong) UILabel *allMoneyLb;
@property (nonatomic, strong) UILabel *depositLb;


@property (nonatomic, strong) UITableView *tripNumTab;
@property (nonatomic, strong) UIView *tableHeaderView;

@property (nonatomic, strong) UILabel *personMessageLb;
@property (nonatomic, strong) UILabel *personNameStateLb;
@property (nonatomic, strong) UILabel *personNameLb;
@property (nonatomic, strong) UILabel *phoneNoStateLb;
@property (nonatomic, strong) UILabel *phoneNoLb;
@property (nonatomic, strong) UILabel *mailStateLb;
@property (nonatomic, strong) UILabel *mailLb;
@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line2;
@property (nonatomic, strong) UIView *line3;

@property (nonatomic, strong) UIView *remarkView;
@property (nonatomic, strong) UILabel *showRemark;
@property (nonatomic, strong) UILabel *remarkLb;

@end

@implementation CT_OrderDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kFT_buttonBgColor;
        aa = 2;
        abc = 0;
        [self initWithSubviews];
    }
    return self;
}
- (void)initWithSubviews
{
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@(self.frame.size.height - kScaleFrom_iPhone5s_Desgin(40)));
    }];
    
    
    
    _bgScrollView.contentSize = CGSizeMake(kDeviceWidth,1000);
    
    
//第一个view
    [_bgScrollView addSubview:self.bgOneView];
    [_bgOneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(513));
    }];
    
    
    [_bgOneView addSubview:self.headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgOneView);
        make.top.equalTo(_bgOneView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(66));
    }];
    
    [_headView addSubview:self.orderStateLabel];
    [_orderStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headView).offset(20);
        make.top.equalTo(_headView).offset(13);
    }];
    [_headView addSubview:self.orderNoLb];
    [_orderNoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_orderStateLabel);
        make.top.equalTo(_orderStateLabel.mas_bottom).offset(7);
    }];
    [_headView addSubview:self.allMoneyLb];
    [_allMoneyLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headView.mas_right).offset(-20);
        make.centerY.equalTo(_orderStateLabel);
    }];
    [_headView addSubview:self.depositLb];
    [_depositLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_allMoneyLb);
        make.top.equalTo(_orderNoLb);
    }];
    
    [_bgScrollView addSubview:self.tripNumTab];
    [_tripNumTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView).offset(10);
        make.top.equalTo(_headView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth-20));
        make.height.equalTo(@(437));
    }];
    
    
//第二个View
    [_bgScrollView addSubview:self.bgTwoView];
    [_bgTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_tripNumTab.mas_bottom).offset(10);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(180));
    }];
    [_bgTwoView addSubview:self.personMessageLb];
    [_personMessageLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_bgTwoView).offset(15);
    }];
    
    [_bgTwoView addSubview:self.line1];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView);
        make.top.equalTo(@(45));
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgTwoView addSubview:self.personNameStateLb];
    [_personNameStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_line1.mas_bottom).offset(15);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgTwoView addSubview:self.personNameLb];
    [_personNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_personNameStateLb.mas_right);
        make.top.equalTo(_personNameStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    
    [_bgTwoView addSubview:self.line2];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView);
        make.top.equalTo(@(90));
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgTwoView addSubview:self.phoneNoStateLb];
    [_phoneNoStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_line2.mas_bottom).offset(15);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgTwoView addSubview:self.phoneNoLb];
    [_phoneNoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneNoStateLb.mas_right);
        make.top.equalTo(_phoneNoStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    
    [_bgTwoView addSubview:self.line3];
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView);
        make.top.equalTo(@(135));
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgTwoView addSubview:self.mailStateLb];
    [_mailStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_line3.mas_bottom).offset(15);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgTwoView addSubview:self.mailLb];
    [_mailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mailStateLb.mas_right);
        make.top.equalTo(_mailStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
//备注
    [_bgScrollView addSubview:self.remarkView];
    [_remarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgTwoView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(70));
    }];
    [_remarkView addSubview:self.showRemark];
    [_showRemark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_remarkView).offset(20);
        make.top.equalTo(_remarkView).offset(10);
    }];
    [_remarkView addSubview:self.remarkLb];
    [_remarkLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showRemark);
        make.top.equalTo(_showRemark.mas_bottom).offset(5);;
    }];
   
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        _bgScrollView.backgroundColor = kFT_buttonBgColor;
    }
    return _bgScrollView;
}

- (UIView *)bgOneView
{
    if (!_bgOneView) {
        _bgOneView = [UIView new];
        _bgOneView.backgroundColor = RGBACOLOR(246, 246, 246, 1);
    }
    return _bgOneView;
}
- (UIView *)headView{
    if (!_headView) {
        _headView = [UIView new];
        _headView.backgroundColor = kFT_buttonBgColor;
    }
    return _headView;
}
- (UILabel *)orderStateLabel{
    if (!_orderStateLabel) {
        _orderStateLabel = [UILabel new];
        _orderStateLabel.text = @"代付款";
        _orderStateLabel.textColor = RGBCOLOR(233, 71, 9);
        _orderStateLabel.textAlignment = NSTextAlignmentLeft;
        _orderStateLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        
    }
    return _orderStateLabel;
}
- (UILabel *)orderNoLb{
    if (!_orderNoLb) {
        _orderNoLb = [UILabel new];
        _orderNoLb.text = @"订单编号 2620689723875";
        _orderNoLb.textColor = [UIColor grayColor];
        _orderNoLb.textAlignment = NSTextAlignmentLeft;
        _orderNoLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _orderNoLb;
}
- (UILabel *)allMoneyLb
{
    if (!_allMoneyLb) {
        _allMoneyLb = [UILabel new];
        _allMoneyLb.text = @"¥88000";
        _allMoneyLb.textColor = RGBCOLOR(233, 71, 9);
        _allMoneyLb.textAlignment = NSTextAlignmentLeft;
        _allMoneyLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _allMoneyLb;
}
- (UILabel *)depositLb{
    if (!_depositLb) {
        _depositLb = [UILabel new];
        _depositLb.text = @"已付定金¥20000";
        _depositLb.textColor = [UIColor grayColor];
        _depositLb.textAlignment = NSTextAlignmentRight;
        _depositLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _depositLb;
}
- (UIView *)bgTwoView
{
    if (!_bgTwoView) {
        _bgTwoView = [UIView new];
        _bgTwoView.backgroundColor = [UIColor whiteColor];
    }
    return _bgTwoView;
}


- (UITableView *)tripNumTab
{
    if (!_tripNumTab) {
        _tripNumTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth-20, 215) style:UITableViewStylePlain];
        _tripNumTab.delegate = self;
        _tripNumTab.dataSource = self;
        _tripNumTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tripNumTab.tableFooterView = self.tableHeaderView;
    }
    return _tripNumTab;
}
- (UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth-20, 55)];
        _tableHeaderView.backgroundColor = RGBCOLOR(246, 246, 246);
        UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, kDeviceWidth-20, 45)];
        contentView.backgroundColor = [UIColor whiteColor];
        [_tableHeaderView addSubview:contentView];
        
        UIImageView *maxPassenger = [UIImageView new];
        maxPassenger.image = [UIImage imageNamed:@"max_person"];
        [contentView addSubview:maxPassenger];
        [maxPassenger mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(contentView).offset(20);
            make.centerY.equalTo(contentView);
        }];
        
        UILabel *maxPassengerLb = [UILabel new];
        maxPassengerLb.text = @"最大乘客人数";
        maxPassengerLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        maxPassengerLb.textColor = [UIColor blackColor];
        [contentView addSubview:maxPassengerLb];
        [maxPassengerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(maxPassenger.mas_right).offset(6);
            make.centerY.equalTo(contentView);
        }];
        
        UILabel *numPassengerLb = [UILabel new];
        numPassengerLb.text = @"12个";
        numPassengerLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        numPassengerLb.textColor = [UIColor blackColor];
        [contentView addSubview:numPassengerLb];
        [numPassengerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(contentView.mas_right).offset(-22);
            make.centerY.equalTo(contentView);
        }];
        
    }
    return _tableHeaderView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"OrderTableViewCell";
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}

- (UILabel *)personMessageLb{
    if (!_personMessageLb) {
        _personMessageLb = [UILabel new];
        _personMessageLb.text = @"联系人信息";
        _personMessageLb.textColor = [UIColor blackColor];
        _personMessageLb.textAlignment = NSTextAlignmentLeft;
        _personMessageLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _personMessageLb;
}
- (UILabel *)personNameStateLb{
    if (!_personNameStateLb) {
        _personNameStateLb = [UILabel new];
        _personNameStateLb.text = @"姓名";
        _personNameStateLb.textColor = [UIColor blackColor];
        _personNameStateLb.textAlignment = NSTextAlignmentLeft;
        _personNameStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _personNameStateLb;
}
- (UILabel *)personNameLb{
    if (!_personNameLb) {
        _personNameLb = [UILabel new];
        _personNameLb.text = @"张晓丽";
        _personNameLb.textColor = [UIColor blackColor];
        _personNameLb.textAlignment = NSTextAlignmentLeft;
        _personNameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _personNameLb;
}
- (UILabel *)phoneNoStateLb{
    if (!_phoneNoStateLb) {
        _phoneNoStateLb = [UILabel new];
        _phoneNoStateLb.text = @"联系手机";
        _phoneNoStateLb.textColor = [UIColor blackColor];
        _phoneNoStateLb.textAlignment = NSTextAlignmentLeft;
        _phoneNoStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _phoneNoStateLb;
}
- (UILabel *)phoneNoLb{
    if (!_phoneNoLb) {
        _phoneNoLb = [UILabel new];
        _phoneNoLb.text = @"18210238706";
        _phoneNoLb.textColor = [UIColor blackColor];
        _phoneNoLb.textAlignment = NSTextAlignmentLeft;
        _phoneNoLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _phoneNoLb;
    
}
- (UILabel *)mailStateLb{
    if (!_mailStateLb) {
        _mailStateLb = [UILabel new];
        _mailStateLb.text = @"E-mail";
        _mailStateLb.textColor = [UIColor blackColor];
        _mailStateLb.textAlignment = NSTextAlignmentLeft;
        _mailStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _mailStateLb;
    
}
- (UILabel *)mailLb{
    if (!_mailLb) {
        _mailLb = [UILabel new];
        _mailLb.text = @"gaoxiangnan_nan@126.com";
        _mailLb.textColor = [UIColor blackColor];
        _mailLb.textAlignment = NSTextAlignmentLeft;
        _mailLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _mailLb;
    
}
- (UIView *)line1{
    if (!_line1) {
        _line1 = [UIView new];
        _line1.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line1;
}
- (UIView *)line2{
    if (!_line2) {
        _line2 = [UIView new];
        _line2.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line2;
}
- (UIView *)line3{
    if (!_line3) {
        _line3 = [UIView new];
        _line3.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line3;
}
- (UIView *)remarkView
{
    if (!_remarkView) {
        _remarkView = [UIView new];
        _remarkView.backgroundColor = [UIColor whiteColor];
    }
    return _remarkView;
}
- (UILabel *)showRemark{
    if (!_showRemark) {
        _showRemark = [UILabel new];
        _showRemark.text = @"备注";
        _showRemark.textColor = [UIColor blackColor];
        _showRemark.textAlignment = NSTextAlignmentLeft;
        _showRemark.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showRemark;
    
}
- (UILabel *)remarkLb{
    if (!_remarkLb) {
        _remarkLb = [UILabel new];
        _remarkLb.text = @"飞机上将有一位病人，需要vip休息室，谢谢！";
        _remarkLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _remarkLb.textAlignment = NSTextAlignmentLeft;
        _remarkLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _remarkLb;
    
}
- (void)onPayMoneyBtn
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
