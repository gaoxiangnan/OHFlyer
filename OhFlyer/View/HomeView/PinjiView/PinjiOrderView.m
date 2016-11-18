//
//  PinjiOrderView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/24.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "PinjiOrderView.h"
#import "UIView+Helpers.h"
#import "PassengerTableViewCell.h"
#import "BottomShadowView.h"
#import "MD_BaoxiaoCell.h"
#import <YYText/YYText.h>
@interface PinjiOrderView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _havePassengerNum;
    NSInteger _switchOpen;
}

@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIImageView *showImg;

@property (nonatomic, strong) UIView *remindView;
@property (nonatomic, strong) UIImageView *remindImg;
@property (nonatomic, strong) UILabel *remindContent;


@property (nonatomic, strong) UIView *tripMessageView;
@property (nonatomic, strong) UIImageView *airPic;
@property (nonatomic, strong) UILabel *airTypeLb;

@property (nonatomic, strong) UILabel *startTime;
@property (nonatomic, strong) UILabel *startPlace;
@property (nonatomic, strong) UILabel *arriveTime;
@property (nonatomic, strong) UILabel *arrivePlace;

@property (nonatomic, strong)UIImageView *showTime;
@property (nonatomic, strong) UILabel *timeNum;
@property (nonatomic, strong)UIView *lineTime;
@property (nonatomic, strong)UIImageView *showSeat;
@property (nonatomic, strong) UILabel *seatNum;
@property (nonatomic, strong)UIView *lineSeat;
@property (nonatomic, strong)UIImageView *showPerson;
@property (nonatomic, strong) UILabel *personNum;


@property (nonatomic, strong) UITableView *passengerTableView;
@property (nonatomic, strong) UILabel *passengerLb;
@property (nonatomic, strong) UILabel *addPasgerLb;
@property (nonatomic, strong) UIImageView *addPasgerImg;

@property (nonatomic, strong) BottomShadowView *canshiView;
@property (nonatomic, strong) UILabel *canshiLb;
@property (nonatomic, strong) UILabel *placeHolderLb;
@property (nonatomic, strong) UIImageView *rightArrow;


@property (nonatomic, strong) BottomShadowView *iPhoneView;
@property (nonatomic, strong) UILabel *iphoneLb;
@property (nonatomic, strong) UITextField *iphoneTf;

@property (nonatomic, strong) BottomShadowView *mailView;
@property (nonatomic, strong) UILabel *mailLb;
@property (nonatomic, strong) UITextField *mailTf;

@property (nonatomic, strong) UITableView *baoxiaoTableView;
@property (nonatomic, strong) UILabel *baoxiaoLb;
@property (nonatomic, strong) UISwitch *controlSwitch;

@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) UIButton *checkBtn;
@property (nonatomic, strong) UIButton *nextBtn;


@end

@implementation PinjiOrderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _havePassengerNum = 0;
        _switchOpen = 0;
        [self InitWithSubViews];
        
    }
    return self;
}
- (void)InitWithSubViews
{
    if (_havePassengerNum < 1) {
        if (_switchOpen < 1) {
            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 663);
        }else{
            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 663+45*3);
        }
        
    }else{
        if (_switchOpen < 1) {
            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 663+68*_havePassengerNum);
        }else{
            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 663+68*_havePassengerNum+45*3);
        }
        
    }
    
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
        make.height.equalTo(@(180));
    }];
    
    [_bgScrollView addSubview:self.remindView];
    [_remindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_showImg.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(28));
    }];
    [_remindView addSubview:self.remindImg];
    [_remindImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_remindView).offset(20);
        make.centerY.equalTo(_remindView);
    }];
    [_remindView addSubview:self.remindContent];
    [_remindContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_remindImg.mas_right).offset(3);
        make.centerY.equalTo(_remindView);
        make.right.equalTo(_remindView.mas_right).offset(-20);
    }];
    
    
    [_bgScrollView addSubview:self.tripMessageView];
    [_tripMessageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_remindView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(110));
    }];
    
    [_tripMessageView addSubview:self.airPic];
    [_airPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_tripMessageView);
        make.top.equalTo(_tripMessageView).offset(15);
    }];
    [_tripMessageView addSubview:self.airTypeLb];
    [_airTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_tripMessageView);
        make.top.equalTo(_airPic.mas_bottom).offset(11);
    }];
    
    
    [_tripMessageView addSubview:self.startTime];
    [_startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_airPic.mas_left).offset(-32);
        make.top.equalTo(_tripMessageView).offset(10);
    }];
    [_tripMessageView addSubview:self.startPlace];
    [_startPlace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_startTime.mas_right);
        make.centerY.equalTo(_airTypeLb);
    }];
    
    [_tripMessageView addSubview:self.arriveTime];
    [_arriveTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airPic.mas_right).offset(32);
        make.top.equalTo(_startTime);
    }];
    [_tripMessageView addSubview:self.arrivePlace];
    [_arrivePlace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_arriveTime);
        make.top.equalTo(_startPlace);
    }];
    
    [_tripMessageView addSubview:self.showTime];
    [_showTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tripMessageView).offset(kScaleFrom_iPhone5s_Desgin(27));
        make.bottom.equalTo(_tripMessageView.mas_bottom).offset(-15);
    }];
    [_tripMessageView addSubview:self.timeNum];
    [_timeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTime.mas_right).offset(3);
        make.centerY.equalTo(_showTime);
    }];
    [_tripMessageView addSubview:self.lineTime];
    [_lineTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tripMessageView).offset(kDeviceWidth/3);
        make.centerY.equalTo(_showTime);
        make.width.equalTo(@(0.5));
        make.height.equalTo(@(15));
    }];
    
    [_tripMessageView addSubview:self.showSeat];
    [_showSeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineTime).offset(kScaleFrom_iPhone5s_Desgin(23));
        make.centerY.equalTo(_showTime);
    }];
    [_tripMessageView addSubview:self.seatNum];
    [_seatNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showSeat.mas_right).offset(3);
        make.centerY.equalTo(_showSeat);
    }];
    [_tripMessageView addSubview:self.lineSeat];
    [_lineSeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineTime).offset(kDeviceWidth/3);;
        make.centerY.equalTo(_lineTime);
        make.width.equalTo(@(0.5));
        make.height.equalTo(@(15));
    }];
    
    [_tripMessageView addSubview:self.showPerson];
    [_showPerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineSeat).offset(15);
        make.centerY.equalTo(_seatNum);
    }];
    [_tripMessageView addSubview:self.personNum];
    [_personNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPerson.mas_right).offset(3);
        make.centerY.equalTo(_showPerson);
    }];
    
    [_bgScrollView addSubview:self.passengerTableView];
    [_passengerTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_tripMessageView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45 + _havePassengerNum * 68));
    }];
    
    
    
    [_bgScrollView addSubview:self.canshiView];
    [_canshiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_passengerTableView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_canshiView addSubview:self.canshiLb];
    [_canshiLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_canshiView).offset(20);
        make.centerY.equalTo(_canshiView);
        make.width.equalTo(@(kDeviceWidth/3));
    }];
    [_canshiView addSubview:self.placeHolderLb];
    [_placeHolderLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_canshiLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.centerY.equalTo(_canshiView);
    }];
    [_canshiView addSubview:self.rightArrow];
    [_rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_canshiView.mas_right).offset(-20);
        make.centerY.equalTo(_canshiView);
    }];
    
    [_bgScrollView addSubview:self.iPhoneView];
    [_iPhoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_canshiView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_iPhoneView addSubview:self.iphoneLb];
    [_iphoneLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_canshiLb);
        make.centerY.equalTo(_iPhoneView);
        make.width.equalTo(_canshiLb);
    }];
    [_iPhoneView addSubview:self.iphoneTf];
    [_iphoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iphoneLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.centerY.equalTo(_iPhoneView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(10)));
    }];
    
    [_bgScrollView addSubview:self.mailView];
    [_mailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_iPhoneView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_mailView addSubview:self.mailLb];
    [_mailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_canshiLb);
        make.centerY.equalTo(_mailView);
        make.width.equalTo(_canshiLb);
    }];
    [_mailView addSubview:self.mailTf];
    [_mailTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iphoneLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.centerY.equalTo(_mailView);
        make.width.equalTo(@(kDeviceWidth/3*2-kScaleFrom_iPhone5s_Desgin(10)));
    }];
    
    [_bgScrollView addSubview:self.baoxiaoTableView];
    [_baoxiaoTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_mailView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45+_switchOpen*45));
    }];
    
    
    
    [_bgScrollView addSubview:self.footView];
    [_footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_baoxiaoTableView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(90));
    }];
    
    
    
    //点击协议
    YYLabel *promptLabel = [[YYLabel alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone5s_Desgin(225), 10, 150, 18)];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"我已阅读并同意"];
    text.yy_font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightThin];
    NSMutableAttributedString *new = [[NSMutableAttributedString alloc] initWithString:@"使用协议"];
    new.yy_font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightThin];
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
    [_footView addSubview:promptLabel];
    
    
    self.checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.checkBtn setImage:[UIImage imageNamed:@"btn_checkbox_unselected"] forState:UIControlStateNormal];
    [self.checkBtn setImage:[UIImage imageNamed:@"btn_checkbox_selected"] forState:UIControlStateSelected];
    [self.checkBtn addTarget:self action:@selector(checkBoxSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_footView addSubview:self.checkBtn];
    [self.checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(promptLabel.mas_left);
        make.centerY.equalTo(promptLabel);
        make.size.equalTo(@(34));
    }];
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.nextBtn.backgroundColor = [UIColor redColor];
    [self.nextBtn addTarget:self action:@selector(onSelectNextBtn) forControlEvents:UIControlEventTouchUpInside];
    [_footView addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_footView);
        make.bottom.equalTo(_footView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.scrollEnabled = YES;
        _bgScrollView.backgroundColor = RGBCOLOR(246, 246, 246);
//        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 663);
        
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
- (UIView *)remindView
{
    if (!_remindView) {
        _remindView = [UIView new];
        _remindView.backgroundColor = RGBCOLOR(246, 246, 246);
    }
    return _remindView;
}
- (UIImageView *)remindImg
{
    if (!_remindImg) {
        _remindImg = [UIImageView new];
        _remindImg.image = [UIImage imageNamed:@"show_baoji"];
    }
    return _remindImg;
}
- (UILabel *)remindContent
{
    if (!_remindContent) {
        _remindContent = [UILabel new];
        _remindContent.text = @"最少12人成行，否则将及时退费，并赠送飞享者积分";
        _remindContent.font = [UIFont systemFontOfSize:11 weight:UIFontWeightLight];
    }
    return _remindContent;
}
- (UIView *)tripMessageView
{
    if (!_tripMessageView) {
        _tripMessageView = [UIView new];
        _tripMessageView.backgroundColor = [UIColor whiteColor];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setBounds:_tripMessageView.bounds];
        [shapeLayer setPosition:_tripMessageView.center];
        [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
        
        // 设置虚线颜色为blackColor
        [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
        [shapeLayer setStrokeColor:[[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0f] CGColor]];
        
        // 3.0f设置虚线的宽度
        [shapeLayer setLineWidth:0.5f];
        [shapeLayer setLineJoin:kCALineJoinRound];
        
        // 3=线的宽度 1=每条线的间距
        [shapeLayer setLineDashPattern:
         [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
          [NSNumber numberWithInt:3],nil]];
        
        // Setup the path
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 66);
        CGPathAddLineToPoint(path, NULL, kDeviceWidth,66);
        
        [shapeLayer setPath:path];
        CGPathRelease(path);
        
        // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
        [[_tripMessageView layer] addSublayer:shapeLayer];
    }
    return _tripMessageView;
}
- (UIImageView *)airPic
{
    if (!_airPic) {
        _airPic = [UIImageView new];
        _airPic.image = [UIImage imageNamed:@"order_land"];
    }
    return _airPic;
}
- (UILabel *)airTypeLb
{
    if (!_airTypeLb) {
        _airTypeLb = [UILabel new];
        _airTypeLb.text = @"湾流G650";
        _airTypeLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _airTypeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _airTypeLb.textAlignment = NSTextAlignmentLeft;
    }
    return _airTypeLb;
}

- (UILabel *)startTime
{
    if (!_startTime) {
        _startTime = [UILabel new];
        _startTime.text = @"08-23 06:40";
        _startTime.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _startTime.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _startTime.textAlignment = NSTextAlignmentLeft;
    }
    return _startTime;
}
- (UILabel *)startPlace
{
    if (!_startPlace) {
        _startPlace = [UILabel new];
        _startPlace.text = @"北京南苑机场";
        _startPlace.textColor = RGBACOLOR(0, 0, 0, 1);
        _startPlace.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _startPlace.textAlignment = NSTextAlignmentLeft;
    }
    return _startPlace;
}

- (UILabel *)arriveTime
{
    if (!_arriveTime) {
        _arriveTime = [UILabel new];
        _arriveTime.text = @"08-23 06:40";
        _arriveTime.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _arriveTime.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _arriveTime.textAlignment = NSTextAlignmentLeft;
    }
    return _arriveTime;
}
- (UILabel *)arrivePlace
{
    if (!_arrivePlace) {
        _arrivePlace = [UILabel new];
        _arrivePlace.text = @"浦东国际机场";
        _arrivePlace.textColor = RGBACOLOR(0, 0, 0, 1);
        _arrivePlace.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _arrivePlace.textAlignment = NSTextAlignmentLeft;
    }
    return _arrivePlace;
}
- (UIImageView *)showTime
{
    if (!_showTime) {
        _showTime = [UIImageView new];
        _showTime.image = [UIImage imageNamed:@"show_time"];
    }
    return _showTime;
}
- (UILabel *)timeNum
{
    if (!_timeNum) {
        _timeNum = [UILabel new];
        _timeNum.text = @"6h20m";
        _timeNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _timeNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _timeNum.textAlignment = NSTextAlignmentLeft;
    }
    return _timeNum;
}
- (UIView *)lineTime
{
    if (!_lineTime) {
        _lineTime = [UIView new];
        _lineTime.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    }
    return _lineTime;
}
- (UIImageView *)showSeat
{
    if (!_showSeat) {
        _showSeat = [UIImageView new];
        _showSeat.image = [UIImage imageNamed:@"set_order"];
    }
    return _showSeat;
}
- (UILabel *)seatNum
{
    if (!_seatNum) {
        _seatNum = [UILabel new];
        _seatNum.text = @"剩余10个座位";
        _seatNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _seatNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _seatNum.textAlignment = NSTextAlignmentLeft;
    }
    return _seatNum;
}
- (UIView *)lineSeat
{
    if (!_lineSeat) {
        _lineSeat = [UIView new];
        _lineSeat.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    }
    return _lineSeat;
}
- (UIImageView *)showPerson
{
    if (!_showPerson) {
        _showPerson = [UIImageView new];
        _showPerson.image = [UIImage imageNamed:@"pinji_maxperson"];
    }
    return _showPerson;
}
- (UILabel *)personNum
{
    if (!_personNum) {
        _personNum = [UILabel new];
        _personNum.text = @"成行人数12人";
        _personNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _personNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _personNum.textAlignment = NSTextAlignmentLeft;
    }
    return _personNum;
}

- (UITableView *)passengerTableView
{
    if (!_passengerTableView) {
        _passengerTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _passengerTableView.delegate = self;
        _passengerTableView.dataSource = self;
        _passengerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _passengerTableView;
}

- (UILabel *)passengerLb
{
    if (!_passengerLb) {
        _passengerLb = [UILabel new];
        _passengerLb.text = @"乘客信息";
        _passengerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _passengerLb;
}
- (UILabel *)addPasgerLb
{
    if (!_addPasgerLb) {
        _addPasgerLb = [UILabel new];
        _addPasgerLb.text = @"选择乘客";
        _addPasgerLb.textColor = [UIColor blackColor];
        _addPasgerLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _addPasgerLb;
}
- (UIImageView *)addPasgerImg
{
    if (!_addPasgerImg) {
        _addPasgerImg = [UIImageView new];
        _addPasgerImg.image = [UIImage imageNamed:@"select_passenger"];
    }
    return _addPasgerImg;
}
- (BottomShadowView *)canshiView
{
    if (!_canshiView) {
        _canshiView = [BottomShadowView new];
        _canshiView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSelectCanshiBtn)];
        [_canshiView addGestureRecognizer:tap];
    }
    return _canshiView;
}
- (UILabel *)canshiLb
{
    if (!_canshiLb) {
        _canshiLb = [UILabel new];
        _canshiLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _canshiLb.text = @"选择餐食";
    }
    return _canshiLb;
}
- (UILabel *)placeHolderLb
{
    if (!_placeHolderLb) {
        _placeHolderLb = [UILabel new];
        _placeHolderLb.text = @"请选择餐食";
        _placeHolderLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _placeHolderLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _placeHolderLb;
}
- (UIImageView *)rightArrow
{
    if (!_rightArrow) {
        _rightArrow = [UIImageView new];
        _rightArrow.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _rightArrow;
}
- (BottomShadowView *)iPhoneView
{
    if (!_iPhoneView) {
        _iPhoneView = [BottomShadowView new];
        _iPhoneView.backgroundColor = [UIColor whiteColor];
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
        _mailTf.placeholder = @"用于接收邮件信息";
        _mailTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _mailTf;
}
- (UITableView *)baoxiaoTableView
{
    if (!_baoxiaoTableView) {
        _baoxiaoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _baoxiaoTableView.delegate = self;
        _baoxiaoTableView.dataSource = self;
        _baoxiaoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _baoxiaoTableView;
}

- (UILabel *)baoxiaoLb
{
    if (!_baoxiaoLb) {
        _baoxiaoLb = [UILabel new];
        _baoxiaoLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _baoxiaoLb.text = @"报销/购买凭证";
    }
    return _baoxiaoLb;
}
- (UISwitch *)controlSwitch
{
    if (!_controlSwitch) {
        _controlSwitch = [UISwitch new];
        _controlSwitch.tintColor = [UIColor redColor];
        _controlSwitch.thumbTintColor = [UIColor purpleColor];
        _controlSwitch.onTintColor = [UIColor redColor];
//        _baoxiaoSwitch.on = NO;
        [_controlSwitch addTarget:self action:@selector(switchChangee:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _controlSwitch;
}
- (UIView *)footView
{
    if (!_footView) {
        _footView = [UIView new];
        _footView.backgroundColor = RGBCOLOR(246, 246, 246);
    }
    return _footView;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == _passengerTableView) {
        BottomShadowView *passengerView = [[BottomShadowView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        passengerView.backgroundColor = [UIColor whiteColor];
        UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tapBtn.frame = passengerView.bounds;
        [tapBtn addTarget:self action:@selector(onAddPassengerBtn:) forControlEvents:UIControlEventTouchUpInside];
        [passengerView addSubview:tapBtn];

        [passengerView addSubview:self.passengerLb];
        [_passengerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(passengerView).offset(20);
            make.centerY.equalTo(passengerView);
            make.width.equalTo(@(kDeviceWidth/3));
        }];
        
        [passengerView addSubview:self.addPasgerImg];
        [_addPasgerImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(passengerView.mas_right).offset(-20);
            make.centerY.equalTo(passengerView);
        }];
        [passengerView addSubview:self.addPasgerLb];
        [_addPasgerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_addPasgerImg.mas_left).offset(-10);
            make.centerY.equalTo(passengerView);
        }];
        return passengerView;
    }else{
        BottomShadowView *baoxiaoView = [[BottomShadowView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        baoxiaoView.backgroundColor = [UIColor whiteColor];
        
        [baoxiaoView addSubview:self.baoxiaoLb];
        [_baoxiaoLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(baoxiaoView).offset(20);
            make.centerY.equalTo(baoxiaoView);
        }];
        
        [baoxiaoView addSubview:self.controlSwitch];
        [_controlSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(baoxiaoView).offset(kScaleFrom_iPhone5s_Desgin(-20));
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
    if (tableView == _passengerTableView) {
        return 68;
    }else{
        return 45;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _passengerTableView) {
        return _havePassengerNum;
    }else{
        return _switchOpen;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _passengerTableView) {
        static NSString *identify = @"PassengerTableViewCell";
        PassengerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[PassengerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
            cell.deleteBlock = ^(){
                NSLog(@"我要删掉你");
            };
        }
        return cell;
    }else{
        static NSString *identifys = @"MD_BaoxiaoCell";
        MD_BaoxiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifys];
        if (!cell) {
            cell = [[MD_BaoxiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifys];
        }
        if (indexPath.row == 0) {
            cell.stateLb.text = @"发票抬头";
//            cell.contentsLb.text = self.invoiceHeader;
        }else if (indexPath.row == 1){
            cell.stateLb.text = @"配送方式";
//            cell.contentsLb.text = self.invoiceType;
        }else{
            cell.stateLb.text = @"配送地址";
//            cell.contentsLb.text = self.invoiceAddress;
        }
        return cell;
        
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//预定条款
- (void)checkUserAgreement
{
    if (_termsBlock) {
        _termsBlock();
    }
}
- (void)onSelectNextBtn
{
    if (_nextBlock) {
        _nextBlock();
    }
}
- (void)checkBoxSelected:(UIButton *)sender
{
    sender.selected = !sender.selected;
}
- (void)onAddPassengerBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        _havePassengerNum = 2;
    }else{
        _havePassengerNum = 0;
    }
    
    if (_passengerBlock) {
        _passengerBlock();
    }
    [self InitWithSubViews];
    [_passengerTableView reloadData];
}
- (void)onSelectCanshiBtn
{
    if (_canshiBlock) {
        _canshiBlock();
    }
}
- (void)switchChangee:(UISwitch *)sender
{
    if (sender.on) {
        _switchOpen = 3;
    }else{
        _switchOpen = 0;
    }
    [self InitWithSubViews];
    [_baoxiaoTableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
