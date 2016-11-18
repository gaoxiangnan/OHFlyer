//
//  BaojiOrderView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/1.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiOrderView.h"
#import "BottomShadowView.h"
#import "OrderTripDetail.h"
#import "OrderTableViewCell.h"
#import "UIView+DrawLine.h"
@interface BaojiOrderView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIImageView *showImg;

@property (nonatomic, strong) UITableView *tripNumTab;
@property (nonatomic, strong) UIView *tableHeaderView;

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
@property (nonatomic, strong) UILabel *remarkContent;
@property (nonatomic, strong) UIImageView *arrowRight;

@property (nonatomic, strong) UIImageView *explainBaojiImg;
@property (nonatomic, strong) UILabel *explainBaojiLb;

@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) UILabel *showPriceLb;
@property (nonatomic, strong) UILabel *priceLb;
@property (nonatomic, strong) UIButton *nextBtn;
@end

@implementation BaojiOrderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.backgroundColor = RGBCOLOR(246, 246, 246);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(remarkChange:) name:REMARKCONTENT object:nil];
        [self InitWithSubViews];
    }
    return self;
}
- (void)remarkChange:(NSNotification *)notif
{
    _remarkContent.text = notif.object;
}

- (void)InitWithSubViews
{
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-64));
    }];
    
    [_bgScrollView addSubview:self.showImg];
    [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(200));
    }];
    
    [_bgScrollView addSubview:self.tripNumTab];
    [_tripNumTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView).offset(10);
        make.top.equalTo(_showImg.mas_bottom);
        make.width.equalTo(@(kDeviceWidth-20));
        make.height.equalTo(@(245));
    }];
    
    [_bgScrollView addSubview:self.passengerView];
    [_passengerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_tripNumTab.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(40));
    }];
    [_passengerView addSubview:self.passengerLb];
    [_passengerLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passengerView).offset(20);
        make.centerY.equalTo(_passengerView);
        make.width.equalTo(@(kDeviceWidth/3));
    }];

    
    [_bgScrollView addSubview:self.nameView];
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
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
    
    [_bgScrollView addSubview:self.iPhoneView];
    [_iPhoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
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
    
    [_bgScrollView addSubview:self.mailView];
    [_mailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
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
    
    [_bgScrollView addSubview:self.remarkView];
    [_remarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_mailView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(40));
    }];
    
    [_remarkView addSubview:self.remarkLb];
    [_remarkLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passengerLb);
        make.centerY.equalTo(_remarkView);
        make.width.equalTo(_passengerLb);
    }];
    
    [_remarkView addSubview:self.remarkContent];
    [_remarkContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_remarkLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.centerY.equalTo(_remarkView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(40)));
        make.height.equalTo(_remarkView);
    }];
    [_remarkView addSubview:self.arrowRight];
    [_arrowRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_remarkView.mas_right).offset(-15);
        make.centerY.equalTo(_remarkView);
    }];
    
    [_bgScrollView addSubview:self.explainBaojiLb];
    [_explainBaojiLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_remarkView.mas_right).offset(-20);
        make.top.equalTo(_remarkView.mas_bottom).offset(5);
    }];
    [_bgScrollView addSubview:self.explainBaojiImg];
    [_explainBaojiImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_explainBaojiLb.mas_left).offset(-5);
        make.top.equalTo(_explainBaojiLb);
    }];
    
    [self addSubview:self.footView];
    [_footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_remarkView.mas_bottom).offset(30);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(55));
    }];
    
    [_footView addSubview:self.showPriceLb];
    [_showPriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_footView).offset(20);
        make.centerY.equalTo(_footView);
    }];
    [_footView addSubview:self.priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceLb.mas_right).offset(10);
        make.top.equalTo(_showPriceLb);
    }];

    
     UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn setTitle:@"提交" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn addTarget:self action:@selector(onSelectNextBtn) forControlEvents:UIControlEventTouchUpInside];
    [_footView addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_footView.mas_right);
        make.top.equalTo(_footView);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(140)));
        make.height.equalTo(_footView);
    }];
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.scrollEnabled = YES;
        //        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 720);
    }
    return _bgScrollView;
}
- (UIImageView *)showImg
{
    if (!_showImg) {
        _showImg = [UIImageView new];
        [_showImg sd_setImageWithURL:[NSURL URLWithString:@"http://img4.bbs.szhome.com/UploadFiles/Images/2009/06/30/0630154313327.jpg"] placeholderImage:nil];
    }
    return _showImg;
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
        _passengerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
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
        _nameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _nameLb.text = @"姓名";
    }
    return _nameLb;
}
- (UITextField *)nameTf
{
    if (!_nameTf) {
        _nameTf = [UITextField new];
        _nameTf.placeholder = @"输入姓名";
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
        _iphoneLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _iphoneLb.text = @"联系手机";
    }
    return _iphoneLb;
}
- (UITextField *)iphoneTf
{
    if (!_iphoneTf) {
        _iphoneTf = [UITextField new];
        _iphoneTf.placeholder = @"输入11位手机号";
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
        _mailLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _mailLb.text = @"E-mail";
    }
    return _mailLb;
}
- (UITextField *)mailTf
{
    if (!_mailTf) {
        _mailTf = [UITextField new];
        _mailTf.placeholder = @"name@ohflyer.com";
        _mailTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _mailTf;
}
- (BottomShadowView *)remarkView
{
    if (!_remarkView) {
        _remarkView = [BottomShadowView new];
        _remarkView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *remarkGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onRemarkGes)];
        [_remarkView addGestureRecognizer:remarkGes];
    }
    return _remarkView;
}
- (UIImageView *)arrowRight
{
    if (!_arrowRight) {
        _arrowRight = [UIImageView new];
        _arrowRight.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _arrowRight;
}
- (UILabel *)remarkLb
{
    if (!_remarkLb) {
        _remarkLb = [UILabel new];
        _remarkLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _remarkLb.text = @"备注";
    }
    return _remarkLb;
}
- (UILabel *)remarkContent
{
    if (!_remarkContent) {
        _remarkContent = [UILabel new];
        _remarkContent.text = @"不放辣，要酸甜口味的，秋月妹妹，哇卡卡卡卡卡卡";
        _remarkContent.backgroundColor = [UIColor whiteColor];
        _remarkContent.font = [UIFont systemFontOfSize:13 weight:UIFontWeightLight];
    }
    return _remarkContent;
}
- (UIImageView *)explainBaojiImg
{
    if (!_explainBaojiImg) {
        _explainBaojiImg = [UIImageView new];
        _explainBaojiImg.image = [UIImage imageNamed:@"explain_baoji"];
    }
    return _explainBaojiImg;
}
- (UILabel *)explainBaojiLb
{
    if (!_explainBaojiLb) {
        _explainBaojiLb = [UILabel new];
        _explainBaojiLb.text = @"包机费用说明";
        _explainBaojiLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _explainBaojiLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _explainBaojiLb.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapExplain = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapExplainGes)];
        [_explainBaojiLb addGestureRecognizer:tapExplain];
    }
    return _explainBaojiLb;
}
- (UIView *)footView
{
    if (!_footView) {
        _footView = [UIView new];
        _footView.backgroundColor = [UIColor whiteColor];
    }
    return _footView;
}
- (UILabel *)showPriceLb
{
    if (!_showPriceLb) {
        _showPriceLb = [UILabel new];
        _showPriceLb.text = @"参考价格";
        _showPriceLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _showPriceLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _showPriceLb;
}
- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.text = @"¥234,800";
        _priceLb.textColor = [UIColor orangeColor];
        _priceLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _priceLb;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
- (void)onSelectNextBtn
{
    if (_sure) {
        _sure();
    }
}
- (void)onRemarkGes
{
    if (_remark) {
        _remark();
    }
}

- (void)onTapExplainGes
{
    if (_explain) {
        _explain();
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
