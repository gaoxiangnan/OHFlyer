//
//  BY_OrderDetailView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/9.
//  Copyright © 2016年 Vutumn. All rights reserved.
//  "定制"

#import "BY_OrderDetailView.h"
#import "BottomShadowView.h"
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)

#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleMoreWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
@interface BY_OrderDetailView()

@property (nonatomic, strong) UIButton *payBtn;

@property (nonatomic, strong) UIScrollView *bgScrollView;

@property (nonatomic, strong) UIView *bgOneView;
@property (nonatomic, strong) UIView *bgTwoView;

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UILabel *orderStateLabel;
@property (nonatomic, strong) UILabel *orderNoLb;
@property (nonatomic, strong) UILabel *allMoneyLb;
@property (nonatomic, strong) UILabel *depositLb;

@property (nonatomic, strong) UIView *showAddress;
@property (nonatomic, strong) UIImageView *addressImg;
@property (nonatomic, strong) UILabel *showAddLb;
@property (nonatomic, strong) UIView *addressLine;
@property (nonatomic, strong) UIView *addreddView;
@property (nonatomic, strong) UILabel *showAddressLb;
@property (nonatomic, strong) UILabel *addressLb;


@property (nonatomic, strong) UIView *travelView;
@property (nonatomic, strong) UIImageView *travelImg;
@property (nonatomic, strong) UILabel *showTravel;
@property (nonatomic, strong) UILabel *showTitle;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *showDate;
@property (nonatomic, strong) UILabel *dateLb;
@property (nonatomic, strong) UILabel *showStartCity;
@property (nonatomic, strong) UILabel *startCityLb;
@property (nonatomic, strong) UILabel *showDays;
@property (nonatomic, strong) UILabel *daysLb;
@property (nonatomic, strong) UILabel *showPersonNum;
@property (nonatomic, strong) UILabel *personNumLb;

@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line2;
@property (nonatomic, strong) UIView *line3;
@property (nonatomic, strong) UIView *line4;
@property (nonatomic, strong) UIView *line5;

@property (nonatomic, strong) UIImageView *personImg;
@property (nonatomic, strong) UILabel *personMessageLb;
@property (nonatomic, strong) UILabel *personNameStateLb;
@property (nonatomic, strong) UILabel *personNameLb;
@property (nonatomic, strong) UILabel *phoneNoStateLb;
@property (nonatomic, strong) UILabel *phoneNoLb;
@property (nonatomic, strong) UILabel *mailStateLb;
@property (nonatomic, strong) UILabel *mailLb;
@property (nonatomic, strong) UILabel *remarkStateLb;
@property (nonatomic, strong) UILabel *remarkLb;

@property (nonatomic, strong) UIView *lineImg;
@property (nonatomic, strong) UIView *lineName;
@property (nonatomic, strong) UIView *linePhone;
@property (nonatomic, strong) UIView *lineMail;


@end

@implementation BY_OrderDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kFT_buttonBgColor;

        [self initWithSubviews];
    }
    return self;
}
- (void)initWithSubviews
{
    
    
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-64));
    }];
    
    
    //第一个view
    [_bgScrollView addSubview:self.bgOneView];
    [_bgOneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(156));
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
    
    [_bgOneView addSubview:self.showAddress];
    [_showAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgOneView);
        make.top.equalTo(_headView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_showAddress addSubview:self.addressImg];
    [_addressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showAddress).offset(20);
        make.centerY.equalTo(_showAddress);
    }];
    [_showAddress addSubview:self.showAddLb];
    [_showAddLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addressImg.mas_right).offset(10);
        make.centerY.equalTo(_showAddress);
    }];
    
    [_bgOneView addSubview:self.addreddView];
    [_addreddView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgOneView);
        make.top.equalTo(_showAddress.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_addreddView addSubview:self.addressLine];
    [_addressLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addreddView);
        make.top.equalTo(_addreddView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    [_addreddView addSubview:self.showAddressLb];
    [_showAddressLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addreddView).offset(20);
        make.centerY.equalTo(_addreddView);
    }];
    [_addreddView addSubview:self.addressLb];
    [_addressLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showAddressLb.mas_right).offset(50);
        make.centerY.equalTo(_addreddView);
    }];
//travelView
    
    
    
    
    [_bgScrollView addSubview:self.travelView];
    [_travelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgOneView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(275));
    }];
    [_travelView addSubview:self.travelImg];
    [_travelImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_travelView).offset(20);
        make.top.equalTo(_travelView).offset(14);
    }];
    [_travelView addSubview:self.showTravel];
    [_showTravel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_travelImg.mas_right).offset(10);
        make.centerY.equalTo(_travelImg);
    }];
    [_travelView addSubview:self.line1];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_travelView);
        make.top.equalTo(_travelView).offset(50);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    
    
    
    [_travelView addSubview:self.showTitle];
    [_showTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_travelImg);
        make.top.equalTo(_line1).offset(14);
    }];
    [_travelView addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTitle.mas_right).offset(55);
        make.top.equalTo(_showTitle);
    }];
    [_travelView addSubview:self.line2];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_travelView);
        make.top.equalTo(_line1.mas_bottom).offset(45);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    
    
    
    [_travelView addSubview:self.showDate];
    [_showDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTitle);
        make.top.equalTo(_line2).offset(14);
    }];
    [_travelView addSubview:self.dateLb];
    [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLb);
        make.top.equalTo(_showDate);
    }];
    
    [_travelView addSubview:self.line3];
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line2);
        make.top.equalTo(_line2.mas_bottom).offset(45);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    
    [_travelView addSubview:self.showStartCity];
    [_showStartCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTitle);
        make.top.equalTo(_line3).offset(14);
    }];
    [_travelView addSubview:self.startCityLb];
    [_startCityLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_dateLb);
        make.top.equalTo(_showStartCity);
    }];
    
    [_travelView addSubview:self.line4];
    [_line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line3);
        make.top.equalTo(_line3.mas_bottom).offset(45);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    
    [_travelView addSubview:self.showDays];
    [_showDays mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showStartCity);
        make.top.equalTo(_line4).offset(14);
    }];
    [_travelView addSubview:self.daysLb];
    [_daysLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startCityLb);
        make.top.equalTo(_showDays);
    }];
    [_travelView addSubview:self.line5];
    [_line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line4);
        make.top.equalTo(_line4).offset(45);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    
    
    
    [_travelView addSubview:self.showPersonNum];
    [_showPersonNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTitle);
        make.top.equalTo(_line5).offset(14);
    }];
    [_travelView addSubview:self.personNumLb];
    [_personNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startCityLb);
        make.top.equalTo(_showPersonNum);
    }];
//第二个View
    
    
    [_bgScrollView addSubview:self.bgTwoView];
    [_bgTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_travelView.mas_bottom).offset(10);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(240));
    }];
    [_bgTwoView addSubview:self.personImg];
    [_personImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_bgTwoView).offset(15);
    }];
    [_bgTwoView addSubview:self.personMessageLb];
    [_personMessageLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_personImg.mas_right).offset(10);
        make.centerY.equalTo(_personImg);
    }];
    
    
    
    
    [_bgTwoView addSubview:self.lineImg];
    [_lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView);
        make.top.equalTo(_bgTwoView).offset(50);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgTwoView addSubview:self.personNameStateLb];
    [_personNameStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_lineImg.mas_bottom).offset(15);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgTwoView addSubview:self.personNameLb];
    [_personNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_personNameStateLb.mas_right);
        make.top.equalTo(_personNameStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    
    [_bgTwoView addSubview:self.lineName];
    [_lineName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView);
        make.top.equalTo(_lineImg).offset(45);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgTwoView addSubview:self.phoneNoStateLb];
    [_phoneNoStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_lineName.mas_bottom).offset(15);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgTwoView addSubview:self.phoneNoLb];
    [_phoneNoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneNoStateLb.mas_right);
        make.top.equalTo(_phoneNoStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    
    [_bgTwoView addSubview:self.linePhone];
    [_linePhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView);
        make.top.equalTo(_lineName).offset(45);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgTwoView addSubview:self.mailStateLb];
    [_mailStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_linePhone.mas_bottom).offset(15);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgTwoView addSubview:self.mailLb];
    [_mailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mailStateLb.mas_right);
        make.top.equalTo(_mailStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    
    [_bgTwoView addSubview:self.lineMail];
    [_lineMail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView);
        make.top.equalTo(_linePhone).offset(45);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgTwoView addSubview:self.remarkStateLb];
    [_remarkStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgTwoView).offset(20);
        make.top.equalTo(_lineMail.mas_bottom).offset(15);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgTwoView addSubview:self.remarkLb];
    [_remarkLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_remarkStateLb.mas_right);
        make.top.equalTo(_remarkStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];

    [_bgScrollView addSubview:self.payBtn];
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgTwoView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(40));
    }];
}

- (UIButton *)payBtn
{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBtn.backgroundColor = [UIColor orangeColor];
        _payBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_payBtn setTitle:@"去支付" forState:UIControlStateNormal];
        [_payBtn addTarget:self action:@selector(onPayMoneyBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payBtn;
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [UIScrollView new];
        _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 1000);
    }
    return _bgScrollView;
}
- (UIView *)bgOneView
{
    if (!_bgOneView) {
        _bgOneView = [UIView new];
        _bgOneView.backgroundColor = [UIColor whiteColor];
    }
    return _bgOneView;
}
- (UIView *)bgTwoView
{
    if (!_bgTwoView) {
        _bgTwoView = [UIView new];
        _bgTwoView.backgroundColor = [UIColor whiteColor];
    }
    return _bgTwoView;
}
- (UIView *)headView
{
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

- (UIView *)showAddress
{
    if (!_showAddress) {
        _showAddress = [UIView new];
        _showAddress.backgroundColor = [UIColor whiteColor];
    }
    return _showAddress;
}
- (UIImageView *)addressImg
{
    if (!_addressImg) {
        _addressImg = [UIImageView new];
        _addressImg.image = [UIImage imageNamed:@"order_address"];
    }
    return _addressImg;
}
- (UILabel *)showAddLb{
    if (!_showAddLb) {
        _showAddLb = [UILabel new];
        _showAddLb.text = @"目的地";
        _showAddLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showAddLb.textAlignment = NSTextAlignmentRight;
        _showAddLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showAddLb;
}
- (UIView *)addreddView
{
    if (!_addreddView) {
        _addreddView = [UIView new];
        _addreddView.backgroundColor = [UIColor whiteColor];
    }
    return _addreddView;
}
- (UILabel *)showAddressLb{
    if (!_showAddressLb) {
        _showAddressLb = [UILabel new];
        _showAddressLb.text = @"目的地";
        _showAddressLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showAddressLb.textAlignment = NSTextAlignmentRight;
        _showAddressLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showAddressLb;
}
- (UILabel *)addressLb{
    if (!_addressLb) {
        _addressLb = [UILabel new];
        _addressLb.text = @"波尔多、巴黎";
        _addressLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _addressLb.textAlignment = NSTextAlignmentRight;
        _addressLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _addressLb;
}

- (UIView *)addressLine
{
    if (!_addressLine) {
        _addressLine = [UIView new];
        _addressLine.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _addressLine;
}

- (UIView *)travelView
{
    if (!_travelView) {
        _travelView = [UIView new];
        _travelView.backgroundColor = [UIColor whiteColor];
    }
    return _travelView;
}
- (UIImageView *)travelImg
{
    if (!_travelImg) {
        _travelImg = [UIImageView new];
        _travelImg.image = [UIImage imageNamed:@"order_travel"];
    }
    return _travelImg;
}
- (UILabel *)showTravel
{
    if (!_showTravel) {
        _showTravel = [UILabel new];
        _showTravel.text = @"行程参考";
        _showTravel.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showTravel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _showTravel;
}
- (UILabel *)showTitle
{
    if (!_showTitle) {
        _showTitle = [UILabel new];
        _showTitle.text = @"出行主题";
        _showTitle.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showTitle.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showTitle;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"亲子游学、时尚大咖";
        _titleLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _titleLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _titleLb;
}
- (UILabel *)showDate
{
    if (!_showDate) {
        _showDate = [UILabel new];
        _showDate.text = @"出发日期";
        _showDate.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showDate.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showDate;
}
- (UILabel *)dateLb
{
    if (!_dateLb) {
        _dateLb = [UILabel new];
        _dateLb.text = @"2016-12-21";
        _dateLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _dateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _dateLb;
}
- (UILabel *)showStartCity
{
    if (!_showStartCity) {
        _showStartCity = [UILabel new];
        _showStartCity.text = @"出发城市";
        _showStartCity.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showStartCity.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showStartCity;
}
- (UILabel *)startCityLb
{
    if (!_startCityLb) {
        _startCityLb = [UILabel new];
        _startCityLb.text = @"广东省 东莞市";
        _startCityLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _startCityLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _startCityLb;
}
- (UILabel *)showDays
{
    if (!_showDays) {
        _showDays = [UILabel new];
        _showDays.text = @"出行天数";
        _showDays.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showDays.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showDays;
}
- (UILabel *)daysLb
{
    if (!_daysLb) {
        _daysLb = [UILabel new];
        _daysLb.text = @"7天";
        _daysLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _daysLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _daysLb;
}
- (UILabel *)showPersonNum
{
    if (!_showPersonNum) {
        _showPersonNum = [UILabel new];
        _showPersonNum.text = @"出行人数";
        _showPersonNum.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showPersonNum.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showPersonNum;
}
- (UILabel *)personNumLb
{
    if (!_personNumLb) {
        _personNumLb = [UILabel new];
        _personNumLb.text = @"成人3个   儿童2个";
        _personNumLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _personNumLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _personNumLb;
}
- (UIView *)line1
{
    if (!_line1) {
        _line1 = [UIView new];
        _line1.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line1;
}
- (UIView *)line2
{
    if (!_line2) {
        _line2 = [UIView new];
        _line2.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line2;
}
- (UIView *)line3
{
    if (!_line3) {
        _line3 = [UIView new];
        _line3.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line3;
}
- (UIView *)line4
{
    if (!_line4) {
        _line4 = [UIView new];
        _line4.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line4;
}
- (UIView *)line5
{
    if (!_line5) {
        _line5 = [UIView new];
        _line5.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line5;
}
- (UIImageView *)personImg
{
    if (!_personImg) {
        _personImg = [UIImageView new];
        _personImg.image = [UIImage imageNamed:@"order_xuqiu"];
    }
    return _personImg;
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
        _personNameStateLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
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
        _phoneNoStateLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
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
        _mailStateLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
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
- (UILabel *)remarkStateLb{
    if (!_remarkStateLb) {
        _remarkStateLb = [UILabel new];
        _remarkStateLb.text = @"备注";
        _remarkStateLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _remarkStateLb.textAlignment = NSTextAlignmentLeft;
        _remarkStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _remarkStateLb;
    
}
- (UILabel *)remarkLb{
    if (!_remarkLb) {
        _remarkLb = [UILabel new];
        _remarkLb.text = @"希望餐厅可以选当地特色";
        _remarkLb.textColor = [UIColor blackColor];
        _remarkLb.textAlignment = NSTextAlignmentLeft;
        _remarkLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _remarkLb;
    
}
- (UIView *)lineImg{
    if (!_lineImg) {
        _lineImg = [UIView new];
        _lineImg.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _lineImg;
}
- (UIView *)lineName{
    if (!_lineName) {
        _lineName = [UIView new];
        _lineName.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _lineName;
}
- (UIView *)linePhone{
    if (!_linePhone) {
        _linePhone = [UIView new];
        _linePhone.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _linePhone;
}
- (UIView *)lineMail{
    if (!_lineMail) {
        _lineMail = [UIView new];
        _lineMail.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _lineMail;
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
