//
//  UC_OrderDetailView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/5.
//  Copyright © 2016年 Vutumn. All rights reserved.
//  “旅行”

#import "UC_OrderDetailView.h"
#import "BottomShadowView.h"
#import "UC_OrderDetailCell.h"
#import "FlightTableViewCell.h"
#import <YYText/YYText.h>

#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleBgViewHeight kScaleFrom_iPhone5s_Desgin(65)
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleMoreWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))


@interface UC_OrderDetailView ()<UITableViewDelegate,UITableViewDataSource>
{
    int aa;
    int abc;
}

@property (nonatomic, strong) BottomShadowView *headView;
@property (nonatomic, strong) UILabel *orderStateLabel;
@property (nonatomic, strong) UILabel *orderNoLb;
@property (nonatomic, strong) UILabel *allMoneyLb;
@property (nonatomic, strong) UILabel *depositLb;

@property (nonatomic, strong) YYLabel *promptLabel;
@property (nonatomic, strong) UILabel *orderNameLb;
@property (nonatomic, strong) UILabel *startDateLb;

@property (nonatomic, strong) BottomShadowView *zhiFuView;
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIView *bgOneView;

@property (nonatomic, strong) UITableView *flightTable;
@property (nonatomic, strong) UIView *flithtHeaderView;

@property (nonatomic, strong) UITableView *passengerTable;
@property (nonatomic, strong) UIView *tableHeaderView;

@property (nonatomic, strong) UIView *bgTwoView;

@property (nonatomic, strong) UITableView *travelTable;
@property (nonatomic, strong) UIView *travelTableHeader;

@property (nonatomic, strong) UITableView *baoxiaoTable;
@property (nonatomic, strong) UIView *baoxiaoHeader;

@property (nonatomic, strong) UIView *bgFourView;
@property (nonatomic, strong) UIView *bgFiveView;
@property (nonatomic, strong) UIView *jifenView;







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
@property (nonatomic, strong) UIView *lineJifen;



@property (nonatomic, strong) UILabel *numRoomStateLb;
@property (nonatomic, strong) UILabel *numRoomLb;

@property (nonatomic, strong) UILabel *integralStateLb;
@property (nonatomic, strong) UILabel *integralLb;

@property (nonatomic, strong) UILabel *moneyLb;
@property (nonatomic, strong) UIButton *payBtn;

@end

@implementation UC_OrderDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        aa = 2;
        abc = 0;
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight - 64));
    }];
    
    
//第一个view
    [_bgScrollView addSubview:self.bgOneView];
    _bgScrollView.contentSize = CGSizeMake(self.frame.size.width,kScaleFrom_iPhone5s_Desgin(165) + kScaleFrom_iPhone5s_Desgin(180) + kScaleFrom_iPhone5s_Desgin(60) + kScaleFrom_iPhone5s_Desgin(80)*aa + kScaleFrom_iPhone5s_Desgin(68)*2 + kScaleFrom_iPhone5s_Desgin(10)*5 + 200);
    [_bgOneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(153));
    }];

    [_bgOneView addSubview:self.headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgOneView);
        make.top.equalTo(_bgOneView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(76));
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
    
    [_bgOneView addSubview:self.promptLabel];
    
    [_bgOneView addSubview:self.startDateLb];
    [_startDateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_promptLabel);
        make.top.equalTo(_promptLabel.mas_bottom).offset(10);
    }];
    
    
    
    
    [_bgScrollView addSubview:self.flightTable];
    [_flightTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgOneView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(200));
    }];
    
    [_bgScrollView addSubview:self.passengerTable];
    [_passengerTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_flightTable.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(185));
    }];
    
    
    
    
    
    //第四个View
    [_bgScrollView addSubview:self.bgFourView];
    [_bgFourView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_passengerTable.mas_bottom).offset(10);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(45));
    }];
    [_bgFourView addSubview:self.numRoomStateLb];
    [_numRoomStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgFourView).offset(20);
        make.centerY.equalTo(_bgFourView);
    }];
    [_bgFourView addSubview:self.numRoomLb];
    [_numRoomLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgFourView.mas_right).offset(-20);
        make.centerY.equalTo(_numRoomStateLb);
    }];
    
    
    
    
    [_bgScrollView addSubview:self.travelTable];
    [_travelTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgFourView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    
//第二个View
    [_bgScrollView addSubview:self.bgTwoView];
    [_bgTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_travelTable.mas_bottom).offset(10);
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
    
    
    [_bgScrollView addSubview:self.baoxiaoTable];
    [_baoxiaoTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgTwoView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    
    

    
//第五个view
    [_bgScrollView addSubview:self.bgFiveView];
    [_bgFiveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_baoxiaoTable.mas_bottom).offset(10);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(45));
    }];
    [_bgFiveView addSubview:self.integralStateLb];
    [_integralStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgFiveView).offset(20);
        make.centerY.equalTo(_bgFiveView);
    }];
    
    [_bgScrollView addSubview:self.jifenView];
    [_jifenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgFiveView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_jifenView addSubview:self.lineJifen];
    [_lineJifen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jifenView);
        make.top.equalTo(_jifenView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    [_jifenView addSubview:self.integralLb];
    [_integralLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jifenView).offset(20);
        make.centerY.equalTo(_jifenView);
    }];
    [_bgScrollView addSubview:self.payBtn];
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_jifenView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(50));
    }];
    
}
- (UIView *)zhiFuView
{
    if (!_zhiFuView) {
        _zhiFuView = [BottomShadowView new];
    }
    return _zhiFuView;
}
- (UILabel *)moneyLb{
    if (!_moneyLb) {
        _moneyLb = [UILabel new];
        _moneyLb.text = @"￥9500";
        _moneyLb.textColor = [UIColor orangeColor];
        _moneyLb.textAlignment = NSTextAlignmentLeft;
        _moneyLb.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
        
    }
    return _moneyLb;
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
        _bgScrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        _bgScrollView.backgroundColor = kFT_buttonBgColor;
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
- (UITableView *)flightTable
{
    if (!_flightTable) {
        _flightTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _flightTable.tableHeaderView = self.flithtHeaderView;
        _flightTable.delegate = self;
        _flightTable.dataSource = self;
        _flightTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _flightTable;
}
- (UIView *)flithtHeaderView
{
    if (!_flithtHeaderView) {
        _flithtHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
        _flithtHeaderView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLb = [UILabel new];
        titleLb.text = @"航班信息";
        titleLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        titleLb.textColor = [UIColor blackColor];
        [_flithtHeaderView addSubview:titleLb];
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_flithtHeaderView).offset(20);
            make.centerY.equalTo(_flithtHeaderView);
        }];
    }
    return _flithtHeaderView;
}
- (UIView *)bgTwoView
{
    if (!_bgTwoView) {
        _bgTwoView = [UIView new];
        _bgTwoView.backgroundColor = [UIColor whiteColor];
    }
    return _bgTwoView;
}

- (UIView *)bgFourView{
    if (!_bgFourView) {
        _bgFourView = [UIView new];
        _bgFourView.backgroundColor = [UIColor whiteColor];
    }
    return _bgFourView;
}
- (UIView *)bgFiveView{
    if (!_bgFiveView) {
        _bgFiveView = [UIView new];
        _bgFiveView.backgroundColor = [UIColor whiteColor];
    }
    return _bgFiveView;
}
- (UIView *)jifenView
{
    if (!_jifenView) {
        _jifenView = [UIView new];
        _jifenView.backgroundColor = [UIColor whiteColor];
    }
    return _jifenView;
}


- (UIView *)headView{
    if (!_headView) {
        _headView = [BottomShadowView new];
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

- (YYLabel *)promptLabel{
    if (!_promptLabel) {
        _promptLabel = [[YYLabel alloc] initWithFrame:CGRectMake(20, 85, kDeviceWidth-40, 30)];
        NSMutableAttributedString *new = [[NSMutableAttributedString alloc] initWithString:@"马尔代夫班度士岛Bandos land4晚自助游"];
        new.yy_font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
        new.yy_color = RGBCOLOR(233, 71, 9);
        new.yy_underlineColor = RGBCOLOR(233, 71, 9);
        new.yy_underlineStyle = NSUnderlineStyleSingle;
        YYTextBorder *border = [YYTextBorder new];
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(0, -4, 0, -4);
        border.fillColor = [UIColor colorWithWhite:0.000 alpha:0.220];
        YYTextHighlight *highlight = [YYTextHighlight new];
        // [highlight setBorder:border];
        __weak typeof(self) weakSelf = self;
        
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            [weakSelf checkUserAgreement];
        };
        [new yy_setTextHighlight:highlight range:new.yy_rangeOfAll];
        _promptLabel.attributedText = new;
    }
    return _promptLabel;
}
- (UILabel *)startDateLb{
    if (!_startDateLb) {
        _startDateLb = [UILabel new];
        _startDateLb.text = @"出发日期：2015-09-12";
        _startDateLb.textColor = [UIColor blackColor];
        _startDateLb.textAlignment = NSTextAlignmentLeft;
        _startDateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _startDateLb;
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
- (UIView *)lineJifen{
    if (!_lineJifen) {
        _lineJifen = [UIView new];
        _lineJifen.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _lineJifen;
}
- (UITableView *)passengerTable{
    if (!_passengerTable) {
        _passengerTable = [[UITableView alloc]init];
        _passengerTable.delegate = self;
        _passengerTable.dataSource = self;
        _passengerTable.scrollEnabled = NO;
        _passengerTable.tableHeaderView = self.tableHeaderView;
        _passengerTable.tableFooterView.userInteractionEnabled = YES;
        _passengerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _passengerTable;
}
- (UIView *)tableHeaderView{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        _tableHeaderView.backgroundColor = [UIColor whiteColor];
        
        UILabel *headerLb = [UILabel new];
        headerLb.text = @"乘客信息";
        headerLb.textColor = [UIColor blackColor];
        headerLb.textAlignment = NSTextAlignmentLeft;
        headerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        [_tableHeaderView addSubview:headerLb];
        [headerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tableHeaderView).offset(20);
            make.centerY.equalTo(_tableHeaderView);
        }];
        
        UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_bottom"] forState:UIControlStateNormal];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_top"] forState:UIControlStateSelected];
        [arrowBtn addTarget:self action:@selector(onTaoMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_tableHeaderView addSubview:arrowBtn];
        [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_tableHeaderView.mas_right);
            make.top.equalTo(_tableHeaderView);
            make.width.equalTo(@(50));
            make.height.equalTo(@(45));
        }];
        
    }
    return _tableHeaderView;
}

- (UITableView *)travelTable{
    if (!_travelTable) {
        _travelTable = [[UITableView alloc]init];
        _travelTable.delegate = self;
        _travelTable.dataSource = self;
        _travelTable.scrollEnabled = NO;
        _travelTable.tableHeaderView = self.travelTableHeader;
        _travelTable.tableFooterView.userInteractionEnabled = YES;
        _travelTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _travelTable;
}
- (UIView *)travelTableHeader{
    if (!_travelTableHeader) {
        _travelTableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        _travelTableHeader.backgroundColor = [UIColor whiteColor];
        
        UILabel *headLb = [UILabel new];
        headLb.text = @"行程安排";
        headLb.textColor = [UIColor blackColor];
        headLb.textAlignment = NSTextAlignmentLeft;
        headLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        [_travelTableHeader addSubview:headLb];
        [headLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_travelTableHeader).offset(20);
            make.centerY.equalTo(_travelTableHeader);
        }];
        
        UIButton *arrowsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowsBtn setImage:[UIImage imageNamed:@"arrow_bottom"] forState:UIControlStateNormal];
        [arrowsBtn setImage:[UIImage imageNamed:@"arrow_top"] forState:UIControlStateSelected];
        [arrowsBtn addTarget:self action:@selector(onTaoMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_travelTableHeader addSubview:arrowsBtn];
        [arrowsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_travelTableHeader.mas_right);
            make.top.equalTo(_travelTableHeader);
            make.width.equalTo(@(50));
            make.height.equalTo(@(45));
        }];
        
    }
    return _travelTableHeader;
}
- (UITableView *)baoxiaoTable{
    if (!_baoxiaoTable) {
        _baoxiaoTable = [[UITableView alloc]init];
        _baoxiaoTable.delegate = self;
        _baoxiaoTable.dataSource = self;
        _baoxiaoTable.scrollEnabled = NO;
        _baoxiaoTable.tableHeaderView = self.baoxiaoHeader;
        _baoxiaoTable.tableFooterView.userInteractionEnabled = YES;
        _baoxiaoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _baoxiaoTable;
}
- (UIView *)baoxiaoHeader{
    if (!_baoxiaoHeader) {
        _baoxiaoHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        _baoxiaoHeader.backgroundColor = [UIColor whiteColor];
        
        UILabel *headLb = [UILabel new];
        headLb.text = @"报销／购买凭证";
        headLb.textColor = [UIColor blackColor];
        headLb.textAlignment = NSTextAlignmentLeft;
        headLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        [_baoxiaoHeader addSubview:headLb];
        [headLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_baoxiaoHeader).offset(20);
            make.centerY.equalTo(_baoxiaoHeader);
        }];
        
        UIButton *arrowsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowsBtn setImage:[UIImage imageNamed:@"arrow_bottom"] forState:UIControlStateNormal];
        [arrowsBtn setImage:[UIImage imageNamed:@"arrow_top"] forState:UIControlStateSelected];
        [arrowsBtn addTarget:self action:@selector(onTaoMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_baoxiaoHeader addSubview:arrowsBtn];
        [arrowsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_baoxiaoHeader.mas_right);
            make.top.equalTo(_baoxiaoHeader);
            make.width.equalTo(@(50));
            make.height.equalTo(@(45));
        }];
        
    }
    return _baoxiaoHeader;
}

- (UILabel *)numRoomStateLb
{
    if (!_numRoomStateLb) {
        _numRoomStateLb = [UILabel new];
        _numRoomStateLb.text = @"房间数";
        _numRoomStateLb.textColor = [UIColor blackColor];
        _numRoomStateLb.textAlignment = NSTextAlignmentLeft;
        _numRoomStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _numRoomStateLb;
}
- (UILabel *)numRoomLb{
    if (!_numRoomLb) {
        _numRoomLb = [UILabel new];
        _numRoomLb.text = @"5间";
        _numRoomLb.textColor = [UIColor blackColor];
        _numRoomLb.textAlignment = NSTextAlignmentLeft;
        _numRoomLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _numRoomLb;
}
- (UILabel *)integralStateLb
{
    if (!_integralStateLb) {
        _integralStateLb = [UILabel new];
        _integralStateLb.text = @"使用积分";
        _integralStateLb.textColor = [UIColor blackColor];
        _integralStateLb.textAlignment = NSTextAlignmentLeft;
        _integralStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _integralStateLb;
}
- (UILabel *)integralLb
{
    if (!_integralLb) {
        _integralLb = [UILabel new];
        _integralLb.text = @"使用500积分抵用500元";
        _integralLb.textColor = [UIColor blackColor];
        _integralLb.textAlignment = NSTextAlignmentLeft;
        _integralLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _integralLb;
}
#pragma tableview 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _flightTable) {
        return 2;
    }else if (tableView == _passengerTable){
        return 2;
    }else if(tableView == _travelTable){
        return 0;
    }else{
        return 0;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _flightTable) {
        return 80;
    }else if(tableView == _passengerTable){
        return 70;
    }else if(tableView == _travelTable){
        return 70;
    }else{
        return 70;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identify = @"FlightTableViewCell";
    static NSString *identiflier = @"UC_OrderDetailCell";
    
    if (tableView == _flightTable) {
        FlightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FlightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    }else if(tableView == _passengerTable){
        UC_OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identiflier];
        if (!cell) {
            cell = [[UC_OrderDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiflier];
        }
        cell.nameLb.text = @"张晓丽";
        cell.cardNoLb.text = @"130721198808294651";
        return cell;
    }else if(tableView == _travelTable){
        UC_OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identiflier];
        if (!cell) {
            cell = [[UC_OrderDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiflier];
        }
        cell.nameLb.text = @"张晓丽";
        cell.cardNoLb.text = @"130721198808294651";
        return cell;
    }else{
        UC_OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identiflier];
        if (!cell) {
            cell = [[UC_OrderDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiflier];
        }
        cell.nameLb.text = @"张晓丽";
        cell.cardNoLb.text = @"130721198808294651";
        return cell;
    }
}

- (void)onTaoMoreBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
}
- (void)onPayMoneyBtn
{
    
}
- (void)checkUserAgreement
{
    NSLog(@"我是可恶的张小珍");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
