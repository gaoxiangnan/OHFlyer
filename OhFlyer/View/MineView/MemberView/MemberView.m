//
//  MemberView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/9.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MemberView.h"
@interface MemberView ()
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIImageView *bgImv;
@property (nonatomic, strong) UIView *bgMenuView;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *nameLb;

@property (nonatomic, strong) UIView *integralView;
@property (nonatomic, strong) UILabel *myIntegral;
@property (nonatomic, strong) UIImageView *integralImg;
@property (nonatomic, strong) UILabel *numIntegral;
@property (nonatomic, strong) UIImageView *intrgralArrow;

@property (nonatomic, strong) UIView *line;

@property (nonatomic, strong) UIView *memberGradeView;
@property (nonatomic, strong) UILabel *memberGrade;
@property (nonatomic, strong) UIImageView *gradeImg;
@property (nonatomic, strong) UILabel *detailGrade;
@property (nonatomic, strong) UIImageView *gradeArrow;

@property (nonatomic, strong) UIView *privilegeView;
@property (nonatomic, strong) UILabel *myPrivilegeLb;
@property (nonatomic, strong) UIView *privilegeLine;


@property (nonatomic, strong) UIScrollView *pricilegeScr;

@property (nonatomic, strong) NSArray *picSelectArr;
@property (nonatomic, strong) NSArray *picNomalArr;
@property (nonatomic, strong) NSArray *nameArr;




@end
@implementation MemberView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.picSelectArr = [NSArray arrayWithObjects:@"cloud_butler_select",@"birthday_select",@"activity_select",@"pickup_select",@"Concierge_select",@"specialoffer_select",@"present_select", nil];
        self.picNomalArr = [NSArray arrayWithObjects:@"cloud_butler_nomal",@"birthday_nomal",@"activity_nomal",@"pickup_nomal",@"Concierge_nomal",@"specialoffer_nomal",@"present_nomal", nil];
        self.nameArr = [NSArray arrayWithObjects:@"云端管家",@"生日特权",@"活动尊享",@"接机服务",@"礼宾服务",@"特价专享",@"礼品馈赠", nil];
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@(kDeviceHeight - 44));
    }];
    
    [_bgScrollView addSubview:self.bgImv];
    [_bgImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_bgScrollView);
    }];
    
    
    [_bgScrollView addSubview:self.bgMenuView];
    [_bgMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgImv.mas_bottom);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(190));
    }];
    
    [_bgScrollView addSubview:self.loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView).offset(kScaleFrom_iPhone5s_Desgin(117));
        make.width.height.equalTo(@(80));
    }];
    
    [_bgScrollView addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgScrollView);
        make.top.equalTo(_loginBtn.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(20));
    }];
    
    [_bgMenuView addSubview:self.integralView];
    [_integralView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgMenuView);
        make.top.equalTo(_bgMenuView).offset(77);
        make.width.equalTo(_bgMenuView);
        make.height.equalTo(@(55));
    }];
    [_integralView addSubview:self.integralImg];
    [_integralImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_integralView).offset(20);
        make.centerY.equalTo(_integralView);
    }];
    [_integralView addSubview:self.myIntegral];
    [_myIntegral mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_integralImg.mas_right).offset(10);
        make.centerY.equalTo(_integralView);
    }];
    [_integralView addSubview:self.intrgralArrow];
    [_intrgralArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_integralView.mas_right).offset(-20);
        make.centerY.equalTo(_integralView);
    }];
    [_integralView addSubview:self.numIntegral];
    [_numIntegral mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_intrgralArrow.mas_left).offset(-10);
        make.centerY.equalTo(_integralView);
    }];
    
    [_integralView addSubview:self.line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_myIntegral);
        make.top.equalTo(_integralView.mas_bottom).offset(-1);
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(60)));
        make.height.equalTo(@(0.5));
        
    }];
    
    [_bgMenuView addSubview:self.memberGradeView];
    [_memberGradeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_bgMenuView);
        make.top.equalTo(_integralView.mas_bottom);
        make.height.equalTo(_integralView);
    }];
    [_memberGradeView addSubview:self.gradeImg];
    [_gradeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_memberGradeView).offset(20);
        make.centerY.equalTo(_memberGradeView);
    }];
    [_memberGradeView addSubview:self.memberGrade];
    [_memberGrade mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_gradeImg.mas_right).offset(10);
        make.centerY.equalTo(_memberGradeView);
    }];
    [_memberGradeView addSubview:self.gradeArrow];
    [_gradeArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgMenuView.mas_right).offset(-20);
        make.centerY.equalTo(_memberGradeView);
    }];
    [_memberGradeView addSubview:self.detailGrade];
    [_detailGrade mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_gradeArrow.mas_left).offset(-10);
        make.centerY.equalTo(_memberGradeView);
    }];
    
    [_bgScrollView addSubview:self.privilegeView];
    [_privilegeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_bgScrollView);
        make.top.equalTo(_bgMenuView.mas_bottom).offset(10);
        make.height.equalTo(@(136));
    }];
    [_privilegeView addSubview:self.myPrivilegeLb];
    [_myPrivilegeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_privilegeView).offset(20);
        make.top.equalTo(_privilegeView).offset(20);
    }];
    [_privilegeView addSubview:self.privilegeLine];
    [_privilegeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_privilegeView);
        make.top.equalTo(_privilegeView).offset(kScaleFrom_iPhone5s_Desgin(46));
        make.height.equalTo(@(0.5));
    }];
    [_privilegeView addSubview:self.pricilegeScr];
    [_pricilegeScr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_privilegeView);
        make.top.equalTo(_privilegeLine.mas_bottom);
        make.bottom.equalTo(_privilegeView.mas_bottom);
    }];
}
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [UIScrollView new];
        _bgScrollView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6" alpha:1];
        if (kDeviceWidth == 320) {
            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, kDeviceHeight+50);
            
        }else{
            //            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, kDeviceHeight);
            
        }
    }
    return _bgScrollView;
}
- (UIImageView *)bgImv
{
    if (!_bgImv) {
        _bgImv = [UIImageView new];
        _bgImv.image = [UIImage imageNamed:@"member_bg"];
    }
    return _bgImv;
}

- (UIView *)bgMenuView
{
    if (!_bgMenuView) {
        _bgMenuView = [UIView new];
        _bgMenuView.backgroundColor = [UIColor whiteColor];
    }
    return _bgMenuView;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 40;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.borderWidth = 2;
        _loginBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
        [_loginBtn addTarget:self action:@selector(onSelectLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.text = @"飞翔者";
        _nameLb.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
        _nameLb.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLb;
}
- (UIView *)integralView
{
    if (!_integralView) {
        _integralView = [UIView new];
        UITapGestureRecognizer *integralTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapGes:)];
        [_integralView addGestureRecognizer:integralTap];
    }
    return _integralView;
}
- (UILabel *)myIntegral
{
    if (!_myIntegral) {
        _myIntegral = [UILabel new];
        _myIntegral.text = @"我的积分";
        _myIntegral.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        _myIntegral.textAlignment = NSTextAlignmentCenter;
    }
    return _myIntegral;
}
- (UIImageView *)integralImg
{
    if (!_integralImg) {
        _integralImg = [UIImageView new];
        _integralImg.image = [UIImage imageNamed:@"my_integral"];
    }
    return _integralImg;
}
- (UILabel *)numIntegral
{
    if (!_numIntegral) {
        _numIntegral = [UILabel new];
        _numIntegral.text = @"52400";
        _numIntegral.textColor = [UIColor orangeColor];
        _numIntegral.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _numIntegral.textAlignment = NSTextAlignmentCenter;
    }
    return _numIntegral;
}
- (UIImageView *)intrgralArrow
{
    if (!_intrgralArrow) {
        _intrgralArrow = [UIImageView new];
        _intrgralArrow.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _intrgralArrow;
}

- (UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}

- (UIView *)memberGradeView
{
    if (!_memberGradeView) {
        _memberGradeView = [UIView new];
        UITapGestureRecognizer *memberGradeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapGes:)];
        [_memberGradeView addGestureRecognizer:memberGradeTap];
    }
    return _memberGradeView;
}
- (UILabel *)memberGrade
{
    if (!_memberGrade) {
        _memberGrade = [UILabel new];
        _memberGrade.text = @"会员等级";
        _memberGrade.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        _memberGrade.textAlignment = NSTextAlignmentCenter;
    }
    return _memberGrade;
}
- (UIImageView *)gradeImg
{
    if (!_gradeImg) {
        _gradeImg = [UIImageView new];
        _gradeImg.image = [UIImage imageNamed:@"member_grade"];
    }
    return _gradeImg;
}
- (UILabel *)detailGrade
{
    if (!_detailGrade) {
        _detailGrade = [UILabel new];
        _detailGrade.text = @"银卡";
        _detailGrade.textColor = [UIColor orangeColor];
        _detailGrade.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _detailGrade.textAlignment = NSTextAlignmentCenter;
    }
    return _detailGrade;
}
- (UIImageView *)gradeArrow
{
    if (!_gradeArrow) {
        _gradeArrow = [UIImageView new];
        _gradeArrow.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _gradeArrow;
}

- (UIView *)privilegeView
{
    if (!_privilegeView) {
        _privilegeView = [UIView new];
        _privilegeView.backgroundColor = [UIColor whiteColor];
    }
    return _privilegeView;
}
- (UILabel *)myPrivilegeLb
{
    if (!_myPrivilegeLb) {
        _myPrivilegeLb = [UILabel new];
        _myPrivilegeLb.text = @"我的特权";
        _myPrivilegeLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _myPrivilegeLb;
}
- (UIView *)privilegeLine
{
    if (!_privilegeLine) {
        _privilegeLine = [UIView new];
        _privilegeLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _privilegeLine;
}
- (UIScrollView *)pricilegeScr
{
    if (!_pricilegeScr) {
        _pricilegeScr = [UIScrollView new];
        _pricilegeScr.backgroundColor = [UIColor whiteColor];
        _pricilegeScr.contentSize = CGSizeMake(kScaleFrom_iPhone5s_Desgin(566), 88);
        [self createSubViews];
    }
    return _pricilegeScr;
}
- (void)createSubViews
{
    for (int i = 0; i < 7; i ++) {
        UIButton *subPric = [UIButton buttonWithType:UIButtonTypeCustom];
        subPric.tag = 2000+i;
        subPric.titleLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
        [subPric setTitle:[_nameArr objectAtIndex:i] forState:UIControlStateNormal];
        [subPric setImage:[UIImage imageNamed:[_picNomalArr objectAtIndex:i]] forState:UIControlStateNormal];
        [subPric setImage:[UIImage imageNamed:[_picSelectArr objectAtIndex:i]] forState:UIControlStateSelected];
        [subPric setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [subPric setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        subPric.frame = CGRectMake(80*i + 1*i, 0, 80, 88);
        [self initButton:subPric ];
        [subPric addTarget:self action:@selector(onSelectPricilegeBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_pricilegeScr addSubview:subPric];
    }
    for (int j = 0; j < 6; j ++) {
        UIView *shuLine = [[UIView alloc] initWithFrame:CGRectMake(80 + 81*j, 24, 1, 26)];
        shuLine.backgroundColor = [UIColor lightGrayColor];
        [_pricilegeScr addSubview:shuLine];
    }
}
-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, -10.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,20.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}

- (void)onSelectLoginBtn
{
    
}
- (void)onTapGes:(UIGestureRecognizer *)ges
{
    
    if (ges.view == _integralView) {
        self.tapGestures = integralTap;
    }else{
        self.tapGestures = memberGrade;
    }
    if (_gesBlock) {
        _gesBlock(self.tapGestures);
    }
}
- (void)onSelectPricilegeBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (_pricilegeBlock) {
        _pricilegeBlock(sender.tag-2000);
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
