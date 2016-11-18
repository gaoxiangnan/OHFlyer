//
//  FindProductView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/13.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "FindProductView.h"
#import "BottomShadowView.h"
#import "ShadowView.h"
#import "UIView+DrawLine.h"
#import <YYText/YYText.h>
#import "UIView+Helpers.h"
#import "MD_BaoxiaoCell.h"
#import "CounterView.h"
@interface FindProductView ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL _switchOn;
}

@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel * productName;
@property (nonatomic, strong) UILabel *showStartDateLb;
@property (nonatomic, strong) UILabel *startDate;
@property (nonatomic, strong) UILabel *priceLb;
@property (nonatomic, strong) UILabel *remaieEats;

@property (nonatomic, strong) BottomShadowView *numPersonView;
@property (nonatomic, strong) UILabel *showPersonLb;
@property (nonatomic, strong) UILabel *choosePersonLb;
@property (nonatomic, strong) UIImageView *personImg;

@property (nonatomic, strong) BottomShadowView *roomView;
@property (nonatomic, strong) UILabel *showNumRoomLb;
@property (nonatomic, strong) CounterView *numRoom;

@property (nonatomic, strong) UIView *nameView;
@property (nonatomic, strong) UILabel *showName;
@property (nonatomic, strong) UITextField *nameTf;

@property (nonatomic, strong) UIView *phoneView;
@property (nonatomic, strong) UILabel *showPhone;
@property (nonatomic, strong) UITextField *phoneTf;

@property (nonatomic, strong) UIView *mailView;
@property (nonatomic, strong) UILabel *showMail;
@property (nonatomic, strong) UITextField *mailTf;


@property (nonatomic, strong) UILabel *showBaoxiaoLb;
@property (nonatomic, strong) UISwitch *baoxiaoSh;

@property (nonatomic, strong) ShadowView *jifenView;
@property (nonatomic, strong) UILabel *showJifenLb;
@property (nonatomic, strong) UILabel *jifenDetailLb;
@property (nonatomic, strong) UIButton *jifenBtn;


@property (nonatomic, strong) UIView *checkView;
@property (nonatomic, strong) UIButton *checkBtn;


@property (nonatomic, strong) ShadowView *footView;
@property (nonatomic, strong) UILabel *showTotalLb;
@property (nonatomic, strong) UILabel *totalLb;
@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) UITableView *passengerTableView;
@property (nonatomic, strong) UITableView *baoxiaoTableView;


@end

@implementation FindProductView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBCOLOR(246, 246, 246);
        _switchOn = NO;
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgScrollView];
    if (_switchOn) {
        _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 700);
    }else{
        _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 560);
    }
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(self);
        make.height.equalTo(@(kDeviceHeight-64-45));
    }];
    
    [_bgScrollView addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(_bgScrollView);
        make.height.equalTo(@(118));
    }];
    [_bgView addSubview:self.productName];
    [_productName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(20);
        make.top.equalTo(_bgView).offset(20);
    }];
    [_bgView addSubview:self.showStartDateLb];
    [_showStartDateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_productName);
        make.top.equalTo(_productName.mas_bottom).offset(10);
    }];
    [_bgView addSubview:self.startDate];
    [_startDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showStartDateLb.mas_right).offset(20);
        make.top.equalTo(_showStartDateLb);
    }];
    [_bgView addSubview:self.priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showStartDateLb);
        make.top.equalTo(_showStartDateLb.mas_bottom).offset(10);
    }];
    [_bgView addSubview:self.remaieEats];
    [_remaieEats mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLb.mas_right).offset(5);
        make.top.equalTo(_priceLb);
    }];
    
    
    
    
    [_bgScrollView addSubview:self.passengerTableView];
    [_passengerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    
    [_bgScrollView addSubview:self.roomView];
    [_roomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(_passengerTableView);
        make.top.equalTo(_passengerTableView.mas_bottom).offset(10);
    }];
    [_roomView addSubview:self.showNumRoomLb];
    [_showNumRoomLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_roomView).offset(20);
        make.centerY.equalTo(_roomView);
    }];
    [_roomView addSubview:self.numRoom];
    [_numRoom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_roomView.mas_right).offset(-20);
        make.centerY.equalTo(_roomView);
        make.width.equalTo(@(90));
        make.height.equalTo(@(27));
    }];
    
    
    
    [_bgScrollView addSubview:self.nameView];
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_bgScrollView);
        make.top.equalTo(_roomView.mas_bottom).offset(10);
        make.height.equalTo(@(45));
    }];
    [_nameView addSubview:self.showName];
    [_showName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showNumRoomLb);
        make.centerY.equalTo(_nameView);
    }];
    [_nameView addSubview:self.nameTf];
    [_nameTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameView).offset(kScaleFrom_iPhone5s_Desgin(100));
        make.centerY.equalTo(_nameView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(10)));
    }];
    
    
    
    [_bgScrollView addSubview:self.phoneView];
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(_nameView);
        make.top.equalTo(_nameView.mas_bottom).offset(10);
    }];
    [_phoneView addSubview:self.showPhone];
    [_showPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showName);
        make.centerY.equalTo(_phoneView);
    }];
    [_phoneView addSubview:self.phoneTf];
    [_phoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneView).offset(kScaleFrom_iPhone5s_Desgin(100));
        make.centerY.equalTo(_phoneView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(10)));
    }];
    
    
    
    
    [_bgScrollView addSubview:self.mailView];
    [_mailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(_nameView);
        make.top.equalTo(_phoneView.mas_bottom).offset(10);
    }];
    [_mailView addSubview:self.showMail];
    [_showMail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showName);
        make.centerY.equalTo(_mailView);
    }];
    [_mailView addSubview:self.mailTf];
    [_mailTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mailView).offset(kScaleFrom_iPhone5s_Desgin(100));
        make.centerY.equalTo(_mailView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(10)));
    }];
    
    
//报销
    [_bgScrollView addSubview:self.baoxiaoTableView];
    if (_switchOn) {
        [_baoxiaoTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bgScrollView);
            make.top.equalTo(_mailView.mas_bottom).offset(10);
            make.width.equalTo(_mailView);
            make.height.equalTo(@(172));
        }];
    }else{
        [_baoxiaoTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bgScrollView);
            make.top.equalTo(_mailView.mas_bottom).offset(10);
            make.width.equalTo(_mailView);
            make.height.equalTo(@(45));
        }];
    }
    
    
    
//积分
    [_bgScrollView addSubview:self.jifenView];
    [_jifenView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_bgScrollView);
        make.top.equalTo(_baoxiaoTableView.mas_bottom).offset(10);
        make.height.equalTo(@(75));
    }];
    [_jifenView addSubview:self.showJifenLb];
    [_showJifenLb mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jifenView).offset(20);
        make.top.equalTo(_jifenView).offset(10);
    }];
    [_jifenView addSubview:self.jifenBtn];
    [_jifenBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_jifenView.mas_right).offset(-20);
        make.centerY.equalTo(_showJifenLb);
        make.width.equalTo(@(14));
        make.height.equalTo(@(14));
    }];
    [_jifenView addSubview:self.jifenDetailLb];
    [_jifenDetailLb mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showJifenLb);
        make.top.equalTo(_showJifenLb.mas_bottom).offset(10);
    }];
    
    [_bgScrollView addSubview:self.checkView];
    [_checkView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_jifenView);
        make.top.equalTo(_jifenView.mas_bottom);
        make.height.equalTo(@(40));
    }];
    //点击协议
    YYLabel *promptLabel = [[YYLabel alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone5s_Desgin(230), 10, 150, 15)];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"我已阅读并同意"];
    text.yy_font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightLight];
    NSMutableAttributedString *new = [[NSMutableAttributedString alloc] initWithString:@"预定条款"];
    new.yy_font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightLight];
    new.yy_color = kOrangeColor;
    new.yy_underlineColor = kOrangeColor;
    new.yy_underlineStyle = NSUnderlineStyleSingle;
    //点击效果
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
    [text appendAttributedString:new];
    promptLabel.attributedText = text;
    [_checkView addSubview:promptLabel];
    
    self.checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.checkBtn setImage:[UIImage imageNamed:@"showPwd_nomal"] forState:UIControlStateNormal];
    [self.checkBtn setImage:[UIImage imageNamed:@"showPwd_select"] forState:UIControlStateSelected];
    [self.checkBtn addTarget:self action:@selector(checkBoxSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_checkView addSubview:self.checkBtn];
    [self.checkBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(promptLabel.mas_left);
        make.centerY.equalTo(promptLabel);
        make.size.equalTo(@(34));
    }];
    
    [self addSubview:self.footView];
    [_footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
    [_footView addSubview:self.showTotalLb];
    [_showTotalLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showJifenLb);
        make.centerY.equalTo(_footView);
    }];
    [_footView addSubview:self.totalLb];
    [_totalLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTotalLb.mas_right).offset(5);
        make.centerY.equalTo(_footView);
    }];
    [_footView addSubview:self.sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_footView.mas_right).offset(-20);
        make.centerY.equalTo(_footView);
        make.height.equalTo(@(35));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(140)));
    }];
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [UIScrollView new];
    }
    return _bgScrollView;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = RGBCOLOR(246, 246, 246);
    }
    return _bgView;
}
- (UILabel *)productName
{
    if (!_productName) {
        _productName = [UILabel new];
        _productName.text = @"泰国普吉岛-PP岛7日游";
        _productName.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _productName.textAlignment = NSTextAlignmentLeft;
    }
    return _productName;
}
- (UILabel *)showStartDateLb
{
    if (!_showStartDateLb) {
        _showStartDateLb = [UILabel new];
        _showStartDateLb.text = @"出发日期:";
        _showStartDateLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _showStartDateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _showStartDateLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showStartDateLb;
}
- (UILabel *)startDate
{
    if (!_startDate) {
        _startDate = [UILabel new];
        _startDate.text = @"2016-09-15";
        _startDate.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _startDate.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _startDate.textAlignment = NSTextAlignmentLeft;
    }
    return _startDate;
}
- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.text = @"剩余6个席位";
        _priceLb.textColor = RGBACOLOR(233, 71, 9, 1);
        _priceLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _priceLb.textAlignment = NSTextAlignmentLeft;
    }
    return _priceLb;
}
- (UILabel *)remaieEats
{
    if (!_remaieEats) {
        _remaieEats = [UILabel new];
        _remaieEats.text = @"￥56870/人";
        _remaieEats.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _remaieEats.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _remaieEats.textAlignment = NSTextAlignmentLeft;
    }
    return _remaieEats;
}
- (BottomShadowView *)numPersonView
{
    if (!_numPersonView) {
        _numPersonView = [BottomShadowView new];
        _numPersonView.backgroundColor = [UIColor whiteColor];
    }
    return _numPersonView;
}
- (UILabel *)showPersonLb
{
    if (!_showPersonLb) {
        _showPersonLb = [UILabel new];
        _showPersonLb.text = @"乘客信息";
        _showPersonLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _showPersonLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showPersonLb;
}
- (UIImageView *)personImg
{
    if (!_personImg) {
        _personImg = [UIImageView new];
        _personImg.image = [UIImage imageNamed:@"select_passenger"];
    }
    return _personImg;
}
- (UILabel *)choosePersonLb
{
    if (!_choosePersonLb) {
        _choosePersonLb = [UILabel new];
        _choosePersonLb.text = @"选择乘客";
        _choosePersonLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _choosePersonLb.textAlignment = NSTextAlignmentLeft;
    }
    return _choosePersonLb;
}
- (BottomShadowView *)roomView
{
    if (!_roomView) {
        _roomView = [BottomShadowView new];
        _roomView.backgroundColor = [UIColor whiteColor];
    }
    return _roomView;
}
- (UILabel *)showNumRoomLb
{
    if (!_showNumRoomLb) {
        _showNumRoomLb = [UILabel new];
        _showNumRoomLb.text = @"房间数";
        _showNumRoomLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _showNumRoomLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showNumRoomLb;
}
- (CounterView *)numRoom
{
    if (!_numRoom) {
        _numRoom = [[CounterView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    return _numRoom;
}
- (UIView *)nameView
{
    if (!_nameView) {
        _nameView = [UIView new];
        _nameView.backgroundColor = [UIColor whiteColor];
    }
    return _nameView;
}
- (UILabel *)showName
{
    if (!_showName) {
        _showName = [UILabel new];
        _showName.text = @"姓名";
        _showName.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _showName.textAlignment = NSTextAlignmentLeft;
    }
    return _showName;
}
- (UITextField *)nameTf
{
    if (!_nameTf) {
        _nameTf = [UITextField new];
        _nameTf.placeholder = @"请输入姓名";
        _nameTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _nameTf;
}
- (UIView *)phoneView
{
    if (!_phoneView) {
        _phoneView = [UIView new];
        _phoneView.backgroundColor = [UIColor whiteColor];
    }
    return _phoneView;
}
- (UILabel *)showPhone
{
    if (!_showPhone) {
        _showPhone = [UILabel new];
        _showPhone.text = @"联系手机";
        _showPhone.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _showPhone.textAlignment = NSTextAlignmentLeft;
    }
    return _showPhone;
}
- (UITextField *)phoneTf
{
    if (!_phoneTf) {
        _phoneTf = [UITextField new];
        _phoneTf.placeholder = @"用于接收通知短信";
        _phoneTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _phoneTf;
}
- (UIView *)mailView
{
    if (!_mailView) {
        _mailView = [UIView new];
        _mailView.backgroundColor = [UIColor whiteColor];
    }
    return _mailView;
}
- (UILabel *)showMail
{
    if (!_showMail) {
        _showMail = [UILabel new];
        _showMail.text = @"E-mail";
        _showMail.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _showMail.textAlignment = NSTextAlignmentLeft;
    }
    return _showMail;
}
- (UITextField *)mailTf
{
    if (!_mailTf) {
        _mailTf = [UITextField new];
        _mailTf.placeholder = @"用于接收邮件信息";
        _mailTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _mailTf;
}

- (UILabel *)showBaoxiaoLb
{
    if (!_showBaoxiaoLb) {
        _showBaoxiaoLb = [UILabel new];
        _showBaoxiaoLb.text = @"报销/购买凭证";
        _showBaoxiaoLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _showBaoxiaoLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showBaoxiaoLb;
}
- (UISwitch *)baoxiaoSh
{
    if (!_baoxiaoSh) {
        _baoxiaoSh = [UISwitch new];
        _baoxiaoSh.tintColor = [UIColor redColor];
        _baoxiaoSh.thumbTintColor = [UIColor purpleColor];
        _baoxiaoSh.onTintColor = [UIColor redColor];
        //        _baoxiaoSwitch.on = NO;
        [_baoxiaoSh addTarget:self action:@selector(switchChangee:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _baoxiaoSh;
}
- (ShadowView *)jifenView
{
    if (!_jifenView) {
        _jifenView = [ShadowView new];
        _jifenView.backgroundColor = [UIColor whiteColor];
    }
    return _jifenView;
}
- (UILabel *)showJifenLb
{
    if (!_showJifenLb) {
        _showJifenLb = [UILabel new];
        _showJifenLb.text = @"使用积分";
        _showJifenLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _showJifenLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showJifenLb;
}
- (UIButton *)jifenBtn
{
    if (!_jifenBtn) {
        _jifenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jifenBtn setBackgroundImage:[UIImage imageNamed:@"showPwd_select"] forState:UIControlStateSelected];
        [_jifenBtn setBackgroundImage:[UIImage imageNamed:@"showPwd_nomal"] forState:UIControlStateNormal];
        _jifenBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_jifenBtn addTarget:self action:@selector(onSelectBtnClient:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jifenBtn;
}
- (UILabel *)jifenDetailLb
{
    if (!_jifenDetailLb) {
        _jifenDetailLb = [UILabel new];
        _jifenDetailLb.text = @"可使用500积分抵用500元";
        _jifenDetailLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _jifenDetailLb.textAlignment = NSTextAlignmentLeft;
    }
    return _jifenDetailLb;
}
- (UIView *)checkView
{
    if (!_checkView) {
        _checkView = [UIView new];
        _checkView.backgroundColor = [UIColor clearColor];
    }
    return _checkView;
}
- (ShadowView *)footView
{
    if (!_footView) {
        _footView = [ShadowView new];
        _footView.backgroundColor = RGBACOLOR(239, 239, 239, 0.95);
    }
    return _footView;
}
- (UILabel *)showTotalLb
{
    if (!_showTotalLb) {
        _showTotalLb = [UILabel new];
        _showTotalLb.text = @"总额：";
        _showTotalLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _showTotalLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showTotalLb;
}
- (UILabel *)totalLb
{
    if (!_totalLb) {
        _totalLb = [UILabel new];
        _totalLb.text = @"￥18800";
        _totalLb.textColor = RGBCOLOR(233, 71, 9);;
        _totalLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _totalLb.textAlignment = NSTextAlignmentLeft;
    }
    return _totalLb;
}
- (UIButton *)sureBtn
{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.backgroundColor = RGBCOLOR(233, 71, 9);
        _sureBtn.layer.cornerRadius = 3;
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_sureBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(onSureBtnClient:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
- (UITableView *)baoxiaoTableView{
    if (!_baoxiaoTableView) {
        _baoxiaoTableView = [[UITableView alloc]init];
        _baoxiaoTableView.delegate = self;
        _baoxiaoTableView.dataSource = self;
        _baoxiaoTableView.scrollEnabled = NO;
        _baoxiaoTableView.tableFooterView.userInteractionEnabled = YES;
        _baoxiaoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _baoxiaoTableView;
}
- (UITableView *)passengerTableView{
    if (!_passengerTableView) {
        _passengerTableView = [[UITableView alloc]init];
        _passengerTableView.delegate = self;
        _passengerTableView.dataSource = self;
        _passengerTableView.scrollEnabled = NO;
        _passengerTableView.tableFooterView.userInteractionEnabled = YES;
        _passengerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _passengerTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == _passengerTableView) {
        UIView *passengerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        passengerView.backgroundColor = [UIColor whiteColor];
        
        [passengerView addSubview:self.showPersonLb];
        [_showPersonLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(passengerView).offset(20);
            make.centerY.equalTo(passengerView);
        }];
        [passengerView addSubview:self.personImg];
        [_personImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(passengerView.mas_right).offset(-20);
            make.centerY.equalTo(passengerView);
        }];
        [passengerView addSubview:self.choosePersonLb];
        [_choosePersonLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_personImg.mas_left).offset(-10);
            make.centerY.equalTo(passengerView);
        }];
        return passengerView;
    }else{
        UIView *baoxiaoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        baoxiaoView.backgroundColor = [UIColor whiteColor];
        [baoxiaoView addLineUp:NO andDown:YES andColor:RGBCOLOR(246, 246, 246)];
        
        [baoxiaoView addSubview:self.showBaoxiaoLb];
        [_showBaoxiaoLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(baoxiaoView).offset(20);
            make.centerY.equalTo(baoxiaoView);
        }];
        [baoxiaoView addSubview:self.baoxiaoSh];
        [_baoxiaoSh mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(baoxiaoView.mas_right).offset(-20);
            make.centerY.equalTo(baoxiaoView);
        }];
        return baoxiaoView;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return  [MD_BaoxiaoCell cellHeight:@"安徽省看的哈会计师的看见爱上"] +20;
    }else if (indexPath.row == 1){
        return [MD_BaoxiaoCell cellHeight:@"安徽省看的哈会计师的看见爱上"] + 20;
    }else{
        return [MD_BaoxiaoCell cellHeight:@"安徽省看的哈会计师的看见爱加速离开的骄傲了开始就对啦"] + 20;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifliers = @"MD_BaoxiaoCell";
    MD_BaoxiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifliers];
    if (!cell) {
        cell = [[MD_BaoxiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifliers];
    }
    if (indexPath.row == 0) {
        cell.stateLb.text = @"发票抬头";
        cell.contentsLb.text = @"安徽省看的哈会计师的看见爱上";
    }else if (indexPath.row == 1){
        cell.stateLb.text = @"配送方式";
        cell.contentsLb.text = @"安徽省看的哈会计师的看见爱上";
    }else{
        cell.stateLb.text = @"配送地址";
        cell.contentsLb.text = @"安徽省看的哈会计师的看见爱加速离开的骄傲了开始就对啦";
    }
    return cell;
}
- (void)switchChangee:(UISwitch *)sender
{
    if (sender.on) {
        _switchOn = YES;
    }else{
        _switchOn = NO;
    }
    [self InitWithSubViews];
}
- (void)checkUserAgreement
{
    
}
- (void)checkBoxSelected:(UIButton *)sender
{
    sender.selected = !sender.selected;
}
- (void)onSureBtnClient:(UIButton *)sender
{
    
}
- (void)onSelectBtnClient:(UIButton *)sender
{
    sender.selected = !sender.selected;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
