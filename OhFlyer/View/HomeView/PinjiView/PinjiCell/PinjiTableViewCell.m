//
//  PinjiTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/25.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "PinjiTableViewCell.h"
@interface PinjiTableViewCell()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *airPic;
@property (nonatomic, strong) UILabel *airTypeLb;
/*   出发  */
@property (nonatomic, strong) UILabel *startLb;
/*  到达   */
@property (nonatomic, strong) UILabel *arriveLb;
/*  日期  */
@property (nonatomic, strong) UIImageView *showStartDateImg;
@property (nonatomic, strong) UIImageView *showArriveDateImg;
@property (nonatomic, strong) UILabel *arriveDate;
@property (nonatomic, strong) UILabel *startDate;

/*  乘客  */
@property (nonatomic, strong) UIImageView *seatImg;
@property (nonatomic, strong) UILabel *seatNum;
@property (nonatomic, strong) UIView *lineSeat;

@property (nonatomic, strong) UIImageView *canNumImg;
@property (nonatomic, strong) UILabel *canNum;
@property (nonatomic, strong) UIView *lineCanNum;

@property (nonatomic, strong) UIImageView *priceImg;
@property (nonatomic, strong) UILabel *showPriceLb;
@property (nonatomic, strong) UILabel *priceLb;
@end
@implementation PinjiTableViewCell
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
        make.left.equalTo(self).offset(12);
        make.top.equalTo(self).offset(10);
        make.width.equalTo(@(kDeviceWidth - 24));
        make.height.equalTo(@(140));
    }];
    
    [_bgView addSubview:self.airPic];
    [_airPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_bgView).offset(32);
    }];
    
    /*   出发  */
    
    
    [_bgView addSubview:self.startLb];
    [_startLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(28);
        make.top.equalTo(_bgView).offset(12);
    }];
    /*  到达   */
    
    [_bgView addSubview:self.arriveLb];
    [_arriveLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView.mas_right).offset(-28);
        make.top.equalTo(_startLb);
    }];
    /*  日期  */
    [_bgView addSubview:self.showStartDateImg];
    [_showStartDateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(10);
        make.top.equalTo(_startLb.mas_bottom).offset(28);
    }];
    
    
    
    [_bgView addSubview:self.airTypeLb];
    [_airTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_showStartDateImg);
    }];
    
    
    [_bgView addSubview:self.startDate];
    [_startDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showStartDateImg.mas_right).offset(5);
        make.top.equalTo(_showStartDateImg);
    }];
    
    [_bgView addSubview:self.arriveDate];
    [_arriveDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView.mas_right).offset(-20);
        make.top.equalTo(_showStartDateImg);
    }];
    [_bgView addSubview:self.showArriveDateImg];
    [_showArriveDateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arriveDate.mas_left).offset(-5);
        make.top.equalTo(_startLb.mas_bottom).offset(25);
    }];
    /*  乘客  */
    
    [_bgView addSubview:self.seatNum];
    [_seatNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(30);
        make.top.equalTo(_startDate.mas_bottom).offset(30);
    }];
    [_bgView addSubview:self.seatImg];
    [_seatImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_seatNum.mas_left).offset(-6);
        make.bottom.equalTo(_seatNum).offset(-3);
    }];
    [_bgView addSubview:self.lineSeat];
    [_lineSeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset((kDeviceWidth-20)/3-15);
        make.top.equalTo(_seatNum);
        make.width.equalTo(@(1));
        make.height.equalTo(@(15));
    }];
    
    [_bgView addSubview:self.canNumImg];
    [_canNumImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineSeat).offset(10);
        make.top.equalTo(_seatImg);
    }];
    [_bgView addSubview:self.canNum];
    [_canNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_canNumImg.mas_right).offset(6);
        make.top.equalTo(_seatNum);
    }];
    [_bgView addSubview:self.lineCanNum];
    [_lineCanNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineSeat).offset((kDeviceWidth-20)/3-10);
        make.top.equalTo(_lineSeat);
        make.width.equalTo(@(1));
        make.height.equalTo(@(15));
    }];
    
    [_bgView addSubview:self.priceImg];
    [_priceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineCanNum).offset(6);
        make.top.equalTo(_lineCanNum);
    }];
    [_bgView addSubview:self.showPriceLb];
    [_showPriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceImg.mas_right).offset(6);
        make.top.equalTo(_canNum);
    }];
    [_bgView addSubview:self.priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceLb.mas_right).offset(3);
        make.top.equalTo(_showPriceLb);
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
    CGPathMoveToPoint(path, NULL, 20, 92);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(325),92);
    
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
    CGPathMoveToPoint(path, NULL, 20, 45);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(155),45);
    
    CGPathMoveToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(215), 45);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(355),45);
    
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
        _startLb.font = [UIFont systemFontOfSize:18 weight:UIFontWeightRegular];
        _startLb.textAlignment = NSTextAlignmentLeft;
    }
    return _startLb;
}

- (UILabel *)arriveLb
{
    if (!_arriveLb) {
        _arriveLb = [UILabel new];
        _arriveLb.text = @"上海";
        _arriveLb.textAlignment = NSTextAlignmentRight;
        _arriveLb.textColor = [UIColor blackColor];
        _arriveLb.font = [UIFont systemFontOfSize:18 weight:UIFontWeightRegular];
        _arriveLb.textAlignment = NSTextAlignmentRight;
    }
    return _arriveLb;
}
- (UILabel *)startDate
{
    if (!_startDate) {
        _startDate = [UILabel new];
        _startDate.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _startDate.text = @"02-12 15:30";
        _startDate.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _startDate.textAlignment = NSTextAlignmentLeft;
    }
    return _startDate;
}
- (UIImageView *)showStartDateImg
{
    if (!_showStartDateImg) {
        _showStartDateImg = [UIImageView new];
        _showStartDateImg.image = [UIImage imageNamed:@"calender_img"];
    }
    return _showStartDateImg;
}
- (UIImageView *)showArriveDateImg
{
    if (!_showArriveDateImg) {
        _showArriveDateImg = [UIImageView new];
        _showArriveDateImg.image = [UIImage imageNamed:@"calender_img"];
    }
    return _showArriveDateImg;
}
- (UILabel *)arriveDate
{
    if (!_arriveDate) {
        _arriveDate = [UILabel new];
        _arriveDate.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _arriveDate.text = @"02-12 13:12";
        _arriveDate.userInteractionEnabled = YES;
        _arriveDate.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _arriveDate.textAlignment = NSTextAlignmentRight;
    }
    return _arriveDate;
}
- (UILabel *)seatNum
{
    if (!_seatNum) {
        _seatNum = [UILabel new];
        _seatNum.text = @"剩余座位：5";
        _seatNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _seatNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _seatNum.textAlignment = NSTextAlignmentLeft;
    }
    return _seatNum;
}
- (UIImageView *)seatImg
{
    if (!_seatImg) {
        _seatImg = [UIImageView new];
        _seatImg.image = [UIImage imageNamed:@"pinji_seat"];
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
- (UILabel *)canNum
{
    if (!_canNum) {
        _canNum = [UILabel new];
        _canNum.text = @"成行人数：9";
        _canNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _canNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _canNum.textAlignment = NSTextAlignmentLeft;
    }
    return _canNum;
}
- (UIImageView *)canNumImg
{
    if (!_canNumImg) {
        _canNumImg = [UIImageView new];
        _canNumImg.image = [UIImage imageNamed:@"pinji_person"];
    }
    return _canNumImg;
}
- (UIView *)lineCanNum
{
    if (!_lineCanNum) {
        _lineCanNum = [UIView new];
        _lineCanNum.backgroundColor = RGBACOLOR(0, 0, 0, 0.2);
    }
    return _lineCanNum;
}
- (UILabel *)showPriceLb
{
    if (!_showPriceLb) {
        _showPriceLb = [UILabel new];
        _showPriceLb.text = @"价格";
        _showPriceLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _showPriceLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _showPriceLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showPriceLb;
}
- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.text = @"￥12,000起";
        _priceLb.textColor = RGBACOLOR(233, 71, 9, 1);
        _priceLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _priceLb.textAlignment = NSTextAlignmentLeft;
    }
    return _priceLb;
}
- (UIImageView *)priceImg
{
    if (!_priceImg) {
        _priceImg = [UIImageView new];
        _priceImg.image = [UIImage imageNamed:@"pinji_price"];
    }
    return _priceImg;
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
