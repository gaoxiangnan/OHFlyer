//
//  SubmitView.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "SubmitView.h"
#import "BottomShadowView.h"
#import "UIView+DrawLine.h"
@interface SubmitView ()

@property (nonatomic, strong) UIView *bgStepView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *destination;
@property (nonatomic, strong) UIButton *tripReference;
@property (nonatomic, strong) UIButton *submitDemand;

@property (nonatomic, strong) UIImageView *lineOne;
@property (nonatomic, strong) UIImageView *lineTwo;





@property (nonatomic, strong) BottomShadowView *passengerView;
@property (nonatomic, strong) UILabel *passengerLb;

@property (nonatomic, strong) BottomShadowView *nameView;
@property (nonatomic, strong) UILabel *nameLb;
@property (nonatomic, strong) UITextField *nameTf;


@property (nonatomic, strong) BottomShadowView *iPhoneView;
@property (nonatomic, strong) UILabel *iphoneLb;
@property (nonatomic, strong) UITextField *iphoneTf;

@property (nonatomic, strong) BottomShadowView *mailView;
@property (nonatomic, strong) UILabel *mailLb;
@property (nonatomic, strong) UITextField *mailTf;

@property (nonatomic, strong) BottomShadowView *remarkView;
@property (nonatomic, strong) UILabel *remarkLb;
@property (nonatomic, strong) UITextField *remarkContent;

@property (nonatomic, strong) UIButton *nextBtn;

@end
@implementation SubmitView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBCOLOR(246, 246, 246);
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgStepView];
    [_bgStepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(132));
    }];
    
    [_bgStepView addSubview:self.backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgStepView).offset(10);
        make.top.equalTo(_bgStepView).offset(28);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
    
    [_bgStepView addSubview:self.destination];
    [_destination mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgStepView).offset(30);
        make.top.equalTo(_bgStepView).offset(68);
        make.width.equalTo(@(35));
        make.height.equalTo(@(44));
    }];
    
    [_bgStepView addSubview:self.tripReference];
    [_tripReference mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgStepView);
        make.top.equalTo(_destination);
        make.width.equalTo(@(48));
        make.height.equalTo(@(44));
    }];
    
    [_bgStepView addSubview:self.submitDemand];
    [_submitDemand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgStepView.mas_right).offset(-30);
        make.top.equalTo(_tripReference);
        make.width.equalTo(@(48));
        make.height.equalTo(@(42));
    }];
    
    [_bgStepView addSubview:self.lineOne];
    [_lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_destination.mas_right).offset(kScaleFrom_iPhone5s_Desgin(30));
        make.right.equalTo(_tripReference.mas_left).offset(kScaleFrom_iPhone5s_Desgin(-30));
        make.centerY.equalTo(_destination);
        make.height.equalTo(@(1));
    }];
    
    [_bgStepView addSubview:self.lineTwo];
    [_lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tripReference.mas_right).offset(kScaleFrom_iPhone5s_Desgin(25));
        make.right.equalTo(_submitDemand.mas_left).offset(kScaleFrom_iPhone5s_Desgin(-25));
        make.centerY.equalTo(_tripReference);
        make.height.equalTo(@(1));
    }];
    
    
    
    
    
    
    
    [self addSubview:self.passengerView];
    [_passengerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_bgStepView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(60));
    }];
    [_passengerView addSubview:self.passengerLb];
    [_passengerLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passengerView).offset(20);
        make.centerY.equalTo(_passengerView);
        make.width.equalTo(@(kDeviceWidth/3));
    }];
    
    
    [self addSubview:self.nameView];
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_passengerView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(40));
    }];
    [_nameView addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passengerLb);
        make.centerY.equalTo(_nameView);
        make.width.equalTo(_passengerLb);
    }];
    
    [_nameView addSubview:self.nameTf];
    [_nameTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.centerY.equalTo(_nameView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(40)));
    }];
    
    [self addSubview:self.iPhoneView];
    [_iPhoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_nameView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(40));
    }];
    [_iPhoneView addSubview:self.iphoneLb];
    [_iphoneLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLb);
        make.centerY.equalTo(_iPhoneView);
        make.width.equalTo(_passengerLb);
    }];
    [_iPhoneView addSubview:self.iphoneTf];
    [_iphoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iphoneLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.centerY.equalTo(_iPhoneView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(40)));
    }];
    
    [self addSubview:self.mailView];
    [_mailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_iPhoneView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(40));
    }];
    [_mailView addSubview:self.mailLb];
    [_mailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passengerLb);
        make.centerY.equalTo(_mailView);
        make.width.equalTo(_passengerLb);
    }];
    [_mailView addSubview:self.mailTf];
    [_mailTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iphoneLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.centerY.equalTo(_mailView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(40)));
    }];
    
    [self addSubview:self.remarkView];
    [_remarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_mailView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(84));
    }];
    
    [_remarkView addSubview:self.remarkLb];
    [_remarkLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passengerLb);
        make.top.equalTo(_remarkView).offset(15);
        make.width.equalTo(_passengerLb);
    }];
    
    [_remarkView addSubview:self.remarkContent];
    [_remarkContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_remarkLb);
        make.top.equalTo(_remarkLb.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth-40));
    }];
    [self addSubview:self.nextBtn];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(44);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(287)));
        make.bottom.equalTo(self.mas_bottom).offset(-30);
        make.height.equalTo(@(40));
    }];
    
}




- (UIView *)bgStepView
{
    if (!_bgStepView) {
        _bgStepView = [UIView new];
        _bgStepView.backgroundColor = RGBCOLOR(246, 246, 246);
    }
    return _bgStepView;
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UIButton *)destination
{
    if (!_destination) {
        _destination = [UIButton buttonWithType:UIButtonTypeCustom];
        [_destination setBackgroundImage:[UIImage imageNamed:@"custom_address"] forState:UIControlStateNormal];
    }
    return _destination;
}
- (UIButton *)tripReference
{
    if (!_tripReference) {
        _tripReference = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tripReference setBackgroundImage:[UIImage imageNamed:@"custom_trip_selecting"] forState:UIControlStateNormal];
    }
    return _tripReference;
}
- (UIButton *)submitDemand
{
    if (!_submitDemand) {
        _submitDemand = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitDemand setBackgroundImage:[UIImage imageNamed:@"custom_submit_select"] forState:UIControlStateNormal];
    }
    return _submitDemand;
}
- (UIImageView *)lineOne
{
    if (!_lineOne) {
        _lineOne = [UIImageView new];
        _lineOne.image = [UIImage imageNamed:@"custom_xuline"];
    }
    return _lineOne;
}
- (UIImageView *)lineTwo
{
    if (!_lineTwo) {
        _lineTwo = [UIImageView new];
        _lineTwo.image = [UIImage imageNamed:@"custom_xuline"];
    }
    return _lineTwo;
}










- (BottomShadowView *)passengerView
{
    if (!_passengerView) {
        _passengerView = [BottomShadowView new];
        _passengerView.backgroundColor = [UIColor whiteColor];
    }
    return _passengerView;
}
- (UILabel *)passengerLb
{
    if (!_passengerLb) {
        _passengerLb = [UILabel new];
        _passengerLb.text = @"联系人信息";
        _passengerLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _passengerLb;
}

- (BottomShadowView *)nameView
{
    if (!_nameView) {
        _nameView = [BottomShadowView new];
        _nameView.backgroundColor = [UIColor whiteColor];
        [_nameView addLineUp:YES andDown:NO andColor:RGBCOLOR(239, 239, 239)];
    }
    return _nameView;
}
- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _nameLb.text = @"姓名";
    }
    return _nameLb;
}
- (UITextField *)nameTf
{
    if (!_nameTf) {
        _nameTf = [UITextField new];
        _nameTf.placeholder = @"请输入联系人姓名";
        _nameTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _nameTf;
}
- (BottomShadowView *)iPhoneView
{
    if (!_iPhoneView) {
        _iPhoneView = [BottomShadowView new];
        _iPhoneView.backgroundColor = [UIColor whiteColor];
        [_iPhoneView addLineUp:YES andDown:NO andColor:RGBCOLOR(239, 239, 239)];
    }
    return _iPhoneView;
}
- (UILabel *)iphoneLb
{
    if (!_iphoneLb) {
        _iphoneLb = [UILabel new];
        _iphoneLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _iphoneLb.text = @"联系手机";
    }
    return _iphoneLb;
}
- (UITextField *)iphoneTf
{
    if (!_iphoneTf) {
        _iphoneTf = [UITextField new];
        _iphoneTf.placeholder = @"用于接收通知短信";
        _iphoneTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _iphoneTf;
}
- (BottomShadowView *)mailView
{
    if (!_mailView) {
        _mailView = [BottomShadowView new];
        _mailView.backgroundColor = [UIColor whiteColor];
        [_mailView addLineUp:YES andDown:NO andColor:RGBCOLOR(239, 239, 239)];
    }
    return _mailView;
}
- (UILabel *)mailLb
{
    if (!_mailLb) {
        _mailLb = [UILabel new];
        _mailLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _mailLb.text = @"E-mail";
    }
    return _mailLb;
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
- (BottomShadowView *)remarkView
{
    if (!_remarkView) {
        _remarkView = [BottomShadowView new];
        _remarkView.backgroundColor = [UIColor whiteColor];
    }
    return _remarkView;
}

- (UILabel *)remarkLb
{
    if (!_remarkLb) {
        _remarkLb = [UILabel new];
        _remarkLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _remarkLb.text = @"备注";
    }
    return _remarkLb;
}
- (UITextField *)remarkContent
{
    if (!_remarkContent) {
        _remarkContent = [UITextField new];
        _remarkContent.placeholder = @"其他要求请在此处填写";
        _remarkContent.font = [UIFont systemFontOfSize:13 weight:UIFontWeightLight];
    }
    return _remarkContent;
}
- (UIButton *)nextBtn
{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.layer.cornerRadius = 20;
        _nextBtn.backgroundColor = RGBCOLOR(233, 71, 9);
        [_nextBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(attentionsAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}
- (void)onBackBtn
{
    if (_submitBack) {
        _submitBack();
    }
}
- (void)attentionsAction
{
    if (_nextBlock) {
        _nextBlock();
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
