//
//  TripBaojiView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/26.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TripBaojiView.h"
#import "CounterView.h"
#import <QuartzCore/QuartzCore.h>
@interface TripBaojiView ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *airPic;
/*   出发  */
@property (nonatomic, strong) UILabel *showStartLb;
@property (nonatomic, strong) UILabel *startLb;
@property (nonatomic, strong) UILabel *startAirPlaneLb;
@property (nonatomic, strong) UIImageView *showStartImg;
/*  到达   */
@property (nonatomic, strong) UILabel *showArriveLb;
@property (nonatomic, strong) UILabel *arriveLb;
@property (nonatomic, strong) UILabel *arriveAirPlaneLb;
@property (nonatomic, strong) UIImageView *showArriveImg;
/*  日期  */
@property (nonatomic, strong) UILabel *showDate;
@property (nonatomic, strong) UILabel *startDate;
@property (nonatomic, strong) UIImageView *showDateImg;
/*  乘客  */
@property (nonatomic, strong) UILabel *passengerNumLb;
@property (nonatomic, strong) UIImageView *showPassengerImg;
@property (nonatomic, strong) CounterView *numView;

@property (nonatomic, strong) UIButton *searchBtn;

@property (nonatomic, strong) UIImageView *pointRedImg;
@property (nonatomic, strong) UILabel *showPointLb;
@property (nonatomic, strong) UILabel *pointContentLb;

@end

@implementation TripBaojiView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.backgroundColor = RGBCOLOR(246, 246, 246);
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.width.equalTo(self);
        make.height.equalTo(@(197));
    }];
    
    [_bgView addSubview:self.airPic];
    [_airPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_bgView).offset(27);
    }];
    /*   出发  */
    
    [_bgView addSubview:self.showStartImg];
    [_showStartImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(27);
        make.top.equalTo(_bgView).offset(9);
    }];
    [_bgView addSubview:self.showStartLb];
    [_showStartLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showStartImg.mas_right).offset(10);
        make.top.equalTo(_showStartImg);
    }];
    
    [_bgView addSubview:self.startLb];
    [_startLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showStartImg);
        make.top.equalTo(_showStartImg.mas_bottom).offset(5);
    }];
    [_bgView addSubview:self.startAirPlaneLb];
    [_startAirPlaneLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startLb);
        make.top.equalTo(_startLb.mas_bottom).offset(5);
    }];
    
    /*  到达   */
    [_bgView addSubview:self.showArriveImg];
    [_showArriveImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView.mas_right).offset(-70);
        make.top.equalTo(_showStartImg);
    }];
    [_bgView addSubview:self.showArriveLb];
    [_showArriveLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showArriveImg.mas_right).offset(6.5);
        make.top.equalTo(_bgView).offset(9);
    }];
    
    [_bgView addSubview:self.arriveLb];
    [_arriveLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_showArriveLb);
        make.top.equalTo(_startLb);
    }];
    
    [_bgView addSubview:self.arriveAirPlaneLb];
    [_arriveAirPlaneLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arriveLb);
        make.top.equalTo(_startAirPlaneLb);
    }];
    /*  日期  */
    [_bgView addSubview:self.showDateImg];
    [_showDateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showStartImg);
        make.top.equalTo(_startLb.mas_bottom).offset(50);
    }];
    [_bgView addSubview:self.showDate];
    [_showDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showDateImg.mas_right).offset(9);
        make.top.equalTo(_showDateImg);
    }];
    
    [_bgView addSubview:self.startDate];
    [_startDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView.mas_right).offset(-28);
        make.top.equalTo(_showDate);
    }];
    /*  乘客  */
    [_bgView addSubview:self.showPassengerImg];
    [_showPassengerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showDateImg);
        make.top.equalTo(_showDateImg.mas_bottom).offset(40);
    }];
    [_bgView addSubview:self.passengerNumLb];
    [_passengerNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPassengerImg.mas_right).offset(9);
        make.top.equalTo(_showPassengerImg);
    }];
    
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:_bgView.bounds];
    [shapeLayer setPosition:_bgView.center];
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
    CGPathMoveToPoint(path, NULL, 20, 135);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(325),135);
    
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
    CGPathMoveToPoint(path, NULL, 20, 77);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(325),77);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[_bgView layer] addSublayer:shapeLayer];
    
    
    [_bgView addSubview:self.numView];
    [_numView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_startDate);
        make.top.equalTo(_passengerNumLb).offset(-3);
        make.width.equalTo(@(90));
        make.height.equalTo(@(27));
    }];
    if (kDevice_Is_iPhone5) {
        [self addSubview:self.searchBtn];
        [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bgView).offset(35);
            make.right.equalTo(_bgView.mas_right).offset(-35);
            make.top.equalTo(_bgView.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(20));
            make.height.equalTo(@(40));
        }];
    }else{
        [self addSubview:self.searchBtn];
        [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bgView).offset(35);
            make.right.equalTo(_bgView.mas_right).offset(-35);
            make.top.equalTo(_bgView.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(48));
            make.height.equalTo(@(40));
        }];
    }
    
    
    //说明
    [self addSubview:self.pointRedImg];
    [_pointRedImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self.mas_bottom).offset(-kScaleFrom_iPhone5s_Desgin(40));
    }];
    [self addSubview:self.showPointLb];
    [_showPointLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pointRedImg.mas_right).offset(5);
        make.top.equalTo(_pointRedImg);
    }];
    [self addSubview:self.pointContentLb];
    [_pointContentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pointRedImg);
        make.top.equalTo(_pointRedImg.mas_bottom).offset(5);
        make.right.equalTo(self).offset(-5);
    }];
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
- (UIImageView *)airPic
{
    if (!_airPic) {
        _airPic = [UIImageView new];
        _airPic.image = [UIImage imageNamed:@"turn_pic"];
    }
    return _airPic;
}
- (UILabel *)showStartLb
{
    if (!_showStartLb) {
        _showStartLb = [UILabel new];
        _showStartLb.text = @"出发地";
        _showStartLb.textColor = [UIColor darkGrayColor];
        _showStartLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _showStartLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showStartLb;
}
- (UIImageView *)showStartImg
{
    if (!_showStartLb) {
        _showStartImg = [UIImageView new];
        _showStartImg.image = [UIImage imageNamed:@"start_img"];
    }
    return _showStartImg;
}
- (UILabel *)startLb
{
    if (!_startLb) {
        _startLb = [UILabel new];
        _startLb.text = @"北京";
        _startLb.textColor = [UIColor blackColor];
        _startLb.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
        _startLb.textAlignment = NSTextAlignmentLeft;
    }
    return _startLb;
}
- (UILabel *)startAirPlaneLb
{
    if (!_startAirPlaneLb) {
        _startAirPlaneLb = [UILabel new];
        _startAirPlaneLb.text = @"首都机场";
        _startAirPlaneLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _startAirPlaneLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _startAirPlaneLb.textAlignment = NSTextAlignmentLeft;
    }
    return _startAirPlaneLb;
}
- (UILabel *)showArriveLb
{
    if (!_showArriveLb) {
        _showArriveLb = [UILabel new];
        _showArriveLb.text = @"到达地";
        _showArriveLb.textColor = [UIColor darkGrayColor];
        _showArriveLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _showArriveLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showArriveLb;
}
- (UIImageView *)showArriveImg
{
    if (!_showArriveImg) {
        _showArriveImg = [UIImageView new];
        _showArriveImg.image = [UIImage imageNamed:@"arrrive_img"];
    }
    return _showArriveImg;
}
- (UILabel *)arriveLb
{
    if (!_arriveLb) {
        _arriveLb = [UILabel new];
        _arriveLb.text = @"上海";
        _arriveLb.textColor = [UIColor blackColor];
        _arriveLb.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
        _arriveLb.textAlignment = NSTextAlignmentRight;
    }
    return _arriveLb;
}
- (UILabel *)arriveAirPlaneLb
{
    if (!_arriveAirPlaneLb) {
        _arriveAirPlaneLb = [UILabel new];
        _arriveAirPlaneLb.text = @"虹桥机场";
        _arriveAirPlaneLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _arriveAirPlaneLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _arriveAirPlaneLb.textAlignment = NSTextAlignmentLeft;
    }
    return _arriveAirPlaneLb;
}
- (UILabel *)showDate
{
    if (!_showDate) {
        _showDate = [UILabel new];
        _showDate.textColor = [UIColor blackColor];
        _showDate.text = @"出发日期";
        _showDate.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _showDate.textAlignment = NSTextAlignmentLeft;
    }
    return _showDate;
}
- (UIImageView *)showDateImg
{
    if (!_showDateImg) {
        _showDateImg = [UIImageView new];
        _showDateImg.image = [UIImage imageNamed:@"calender_img"];
    }
    return _showDateImg;
}
- (UILabel *)startDate
{
    if (!_startDate) {
        _startDate = [UILabel new];
        _startDate.textColor = [UIColor darkGrayColor];
        _startDate.text = @"2016-11-12 13:12";
        _startDate.userInteractionEnabled = YES;
        _startDate.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _startDate.textAlignment = NSTextAlignmentRight;
        
        UITapGestureRecognizer *dateGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSelectDateClient)];
        [_startDate addGestureRecognizer:dateGes];
    }
    return _startDate;
}
- (UILabel *)passengerNumLb
{
    if (!_passengerNumLb) {
        _passengerNumLb = [UILabel new];
        _passengerNumLb.text = @"乘客人数";
        _passengerNumLb.textColor = [UIColor blackColor];
        _passengerNumLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _passengerNumLb.textAlignment = NSTextAlignmentLeft;
    }
    return _passengerNumLb;
}
- (UIImageView *)showPassengerImg
{
    if (!_showPassengerImg) {
        _showPassengerImg = [UIImageView new];
        _showPassengerImg.image = [UIImage imageNamed:@"max_person"];
    }
    return _showPassengerImg;
}
- (CounterView *)numView
{
    if (!_numView) {
        _numView = [[CounterView alloc] initWithFrame:CGRectMake(0, 0, 27, 90)];
    }
    return _numView;
}
- (UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchBtn.backgroundColor = RGBACOLOR(233, 71, 9, 1);
        _searchBtn.layer.cornerRadius = 3;
        [_searchBtn setImage:[UIImage imageNamed:@"search_baoji"] forState:UIControlStateNormal];
        [_searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_searchBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20.0,0.0, _searchBtn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
        _searchBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(onSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}
- (UIImageView *)pointRedImg
{
    if (!_pointRedImg) {
        _pointRedImg = [UIImageView new];
        _pointRedImg.image = [UIImage imageNamed:@"show_baoji"];
    }
    return _pointRedImg;
}
- (UILabel *)showPointLb
{
    if (!_showPointLb) {
        _showPointLb = [UILabel new];
        _showPointLb.text = @"公务机包机流程：";
        _showPointLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        if (kDevice_Is_iPhone5) {
            _showPointLb.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
        }else{
            _showPointLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        }
        
        _showPointLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showPointLb;
}
- (UILabel *)pointContentLb
{
    if (!_pointContentLb) {
        _pointContentLb = [UILabel new];
        _pointContentLb.text = @"航班搜索 > 选定飞机 > 留下您的联系方式 > 客服人员对接需求";
        _pointContentLb.lineBreakMode = NSLineBreakByWordWrapping;
        _pointContentLb.numberOfLines = 0;
        _pointContentLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        if (kDevice_Is_iPhone5) {
            _pointContentLb.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
        }else{
            _pointContentLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        }
        
        _pointContentLb.textAlignment = NSTextAlignmentLeft;
    }
    return _pointContentLb;
}
- (void)onSearchBtn
{
    if (_searchBlock) {
        _searchBlock();
    }
}
- (void)onSelectDateClient
{
    if (_dateBlock) {
        _dateBlock();
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
