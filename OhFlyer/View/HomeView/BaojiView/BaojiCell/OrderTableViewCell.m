//
//  OrderTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/24.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "OrderTableViewCell.h"
@interface OrderTableViewCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *airPic;
@property (nonatomic, strong) UILabel *airTypeLb;
/*   出发  */
@property (nonatomic, strong) UILabel *startLb;
@property (nonatomic, strong) UILabel *startAirport;
/*  到达   */
@property (nonatomic, strong) UILabel *arriveLb;
@property (nonatomic, strong) UILabel *arriveAirport;
/*  日期  */
@property (nonatomic, strong) UILabel *showDate;
@property (nonatomic, strong) UILabel *startDate;
@property (nonatomic, strong) UIImageView *showDateImg;
/*  乘客  */
@property (nonatomic, strong) UIImageView *seatImg;
@property (nonatomic, strong) UILabel *seatNum;
@property (nonatomic, strong) UIView *lineSeat;

@property (nonatomic, strong) UIImageView *timesImg;
@property (nonatomic, strong) UILabel *timeNum;
@property (nonatomic, strong) UIView *lineTime;

@property (nonatomic, strong) UIImageView *landImg;
@property (nonatomic, strong) UILabel *landNum;
@end
@implementation OrderTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
        make.height.equalTo(@(180));
    }];
    
    [_bgView addSubview:self.airPic];
    [_airPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_bgView).offset(20);
    }];
    [_bgView addSubview:self.airTypeLb];
    [_airTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_airPic.mas_bottom).offset(3);
    }];
    /*   出发  */
    
    
    [_bgView addSubview:self.startLb];
    [_startLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(20);
        make.top.equalTo(_bgView).offset(15);
    }];
    [_bgView addSubview:self.startAirport];
    [_startAirport mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startLb);
        make.top.equalTo(_startLb.mas_bottom).offset(5);
    }];
    /*  到达   */
    
    [_bgView addSubview:self.arriveLb];
    [_arriveLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView.mas_right).offset(-20);
        make.top.equalTo(_startLb);
    }];
    [_bgView addSubview:self.arriveAirport];
    [_arriveAirport mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arriveLb.mas_right);
        make.top.equalTo(_startAirport);
    }];
    /*  日期  */
    [_bgView addSubview:self.showDateImg];
    [_showDateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startLb);
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
    [_bgView addSubview:self.seatImg];
    [_seatImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showDateImg);
        make.top.equalTo(_startDate.mas_bottom).offset(35);
    }];
    [_bgView addSubview:self.seatNum];
    [_seatNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_seatImg.mas_right).offset(5);
        make.centerY.equalTo(_seatImg);
    }];
    
    [_bgView addSubview:self.lineSeat];
    [_lineSeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(kDeviceWidth/3);
        make.top.equalTo(_seatNum);
        make.width.equalTo(@(1));
        make.height.equalTo(@(15));
    }];
    
    [_bgView addSubview:self.timesImg];
    [_timesImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineSeat).offset(22);
        make.top.equalTo(_seatImg);
    }];
    [_bgView addSubview:self.timeNum];
    [_timeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timesImg.mas_right).offset(6);
        make.top.equalTo(_seatNum);
    }];
    [_bgView addSubview:self.lineTime];
    [_lineTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineSeat).offset(kDeviceWidth/3-20);
        make.top.equalTo(_lineSeat);
        make.width.equalTo(@(1));
        make.height.equalTo(@(15));
    }];
    
    [_bgView addSubview:self.landImg];
    [_landImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineTime).offset(22);
        make.top.equalTo(_timesImg);
    }];
    [_bgView addSubview:self.landNum];
    [_landNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_landImg.mas_right).offset(6);
        make.top.equalTo(_timeNum);
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
    CGPathMoveToPoint(path, NULL, 20, 126);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(325),126);
    
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
    CGPathMoveToPoint(path, NULL, 20, 66);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(325),66);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[_bgView layer] addSublayer:shapeLayer];
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
- (UILabel *)startAirport
{
    if (!_startAirport) {
        _startAirport = [UILabel new];
        _startAirport.text = @"首都机场";
        _startAirport.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _startAirport.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _startAirport.textAlignment = NSTextAlignmentLeft;
    }
    return _startAirport;
}
- (UILabel *)arriveLb
{
    if (!_arriveLb) {
        _arriveLb = [UILabel new];
        _arriveLb.text = @"上海";
        _arriveLb.textAlignment = NSTextAlignmentRight;
        _arriveLb.textColor = [UIColor blackColor];
        _arriveLb.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
        _arriveLb.textAlignment = NSTextAlignmentRight;
    }
    return _arriveLb;
}
- (UILabel *)arriveAirport
{
    if (!_arriveAirport) {
        _arriveAirport = [UILabel new];
        _arriveAirport.text = @"虹桥机场";
        _arriveAirport.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _arriveAirport.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _arriveAirport.textAlignment = NSTextAlignmentRight;
    }
    return _arriveAirport;
}
- (UILabel *)showDate
{
    if (!_showDate) {
        _showDate = [UILabel new];
        _showDate.textColor = [UIColor darkGrayColor];
        _showDate.text = @"出发日期";
        _showDate.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
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
        _startDate.textColor = [UIColor blackColor];
        _startDate.text = @"2016-11-12 13:12";
        _startDate.userInteractionEnabled = YES;
        _startDate.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _startDate.textAlignment = NSTextAlignmentRight;
    }
    return _startDate;
}
- (UILabel *)seatNum
{
    if (!_seatNum) {
        _seatNum = [UILabel new];
        _seatNum.text = @"共14个座位";
        _seatNum.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _seatNum.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _seatNum.textAlignment = NSTextAlignmentLeft;
    }
    return _seatNum;
}
- (UIImageView *)seatImg
{
    if (!_seatImg) {
        _seatImg = [UIImageView new];
        _seatImg.image = [UIImage imageNamed:@"set_order"];
    }
    return _seatImg;
}
- (UIView *)lineSeat
{
    if (!_lineSeat) {
        _lineSeat = [UIView new];
        _lineSeat.backgroundColor = RGBACOLOR(0, 0, 0, 0.2);
    }
    return _lineSeat;
}
- (UILabel *)timeNum
{
    if (!_timeNum) {
        _timeNum = [UILabel new];
        _timeNum.text = @"2h30m";
        _timeNum.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _timeNum.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _timeNum.textAlignment = NSTextAlignmentLeft;
    }
    return _timeNum;
}
- (UIImageView *)timesImg
{
    if (!_timesImg) {
        _timesImg = [UIImageView new];
        _timesImg.image = [UIImage imageNamed:@"show_time"];
    }
    return _timesImg;
}
- (UIView *)lineTime
{
    if (!_lineTime) {
        _lineTime = [UIView new];
        _lineTime.backgroundColor = RGBACOLOR(0, 0, 0, 0.2);
    }
    return _lineTime;
}
- (UILabel *)landNum
{
    if (!_landNum) {
        _landNum = [UILabel new];
        _landNum.text = @"加降2次";
        _landNum.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _landNum.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        _landNum.textAlignment = NSTextAlignmentLeft;
    }
    return _landNum;
}
- (UIImageView *)landImg
{
    if (!_landImg) {
        _landImg = [UIImageView new];
        _landImg.image = [UIImage imageNamed:@"showLand"];
    }
    return _landImg;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
