//
//  FlightTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/19.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "FlightTableViewCell.h"

@interface FlightTableViewCell ()

@property (nonatomic, strong) UIImageView *showImg;

@property (nonatomic, strong) UILabel *startTimeLb;
@property (nonatomic, strong) UILabel *startPlaceLb;


@property (nonatomic, strong) UILabel *arraveTimeLb;
@property (nonatomic, strong) UILabel *arravePlaceLb;

@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UILabel *airType;

@end

@implementation FlightTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    [shapeLayer setPosition:self.center];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0f] CGColor]];
    
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:1.0f];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:5],
      [NSNumber numberWithInt:1],nil]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, kDeviceWidth,0);
    
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[self layer] addSublayer:shapeLayer];
    
    [self addSubview:self.showImg];
    [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(10);
    }];
    [self addSubview:self.arrowImg];
    [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-10);
    }];
    [self addSubview:self.airType];
    [_airType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(10);
    }];
    
    [self addSubview:self.startTimeLb];
    [_startTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrowImg.mas_left).offset(-30);
        make.top.equalTo(self).offset(16);
    }];
    [self addSubview:self.startPlaceLb];
    [_startPlaceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_startTimeLb);
        make.top.equalTo(_startTimeLb.mas_bottom).offset(6);
    }];
    [self addSubview:self.arraveTimeLb];
    [_arraveTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_startTimeLb);
        make.left.equalTo(_arrowImg.mas_right).offset(30);
    }];
    [self addSubview:self.arravePlaceLb];
    [_arravePlaceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_arraveTimeLb);
        make.top.equalTo(_startPlaceLb);
    }];
    
    
}
- (UIImageView *)showImg
{
    if (!_showImg) {
        _showImg = [UIImageView new];
        _showImg.image = [UIImage imageNamed:@"proDetail_go"];
    }
    return _showImg;
}
- (UILabel *)startTimeLb
{
    if (!_startTimeLb) {
        _startTimeLb = [UILabel new];
        _startTimeLb.textAlignment = NSTextAlignmentRight;
        _startTimeLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _startTimeLb.text = @"08-23 06:40";
        _startTimeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _startTimeLb;
}
- (UILabel *)startPlaceLb
{
    if (!_startPlaceLb) {
        _startPlaceLb = [UILabel new];
        _startPlaceLb.textAlignment = NSTextAlignmentRight;
        _startPlaceLb.text = @"北京南苑机场";
        _startPlaceLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _startPlaceLb;
}
- (UILabel *)arraveTimeLb
{
    if (!_arraveTimeLb) {
        _arraveTimeLb = [UILabel new];
        _arraveTimeLb.textAlignment = NSTextAlignmentLeft;
        _arraveTimeLb.text = @"08-23 06:40";
        _arraveTimeLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _arraveTimeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _arraveTimeLb;
}
- (UILabel *)arravePlaceLb
{
    if (!_arravePlaceLb) {
        _arravePlaceLb = [UILabel new];
        _arravePlaceLb.textAlignment = NSTextAlignmentLeft;
        _arravePlaceLb.text = @"浦东国际机场";
        _arravePlaceLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _arravePlaceLb;
}
- (UIImageView *)arrowImg
{
    if (!_arrowImg) {
        _arrowImg = [UIImageView new];
        _arrowImg.image = [UIImage imageNamed:@"order_land"];
    }
    return _arrowImg;
}
- (UILabel *)airType
{
    if (!_airType) {
        _airType = [UILabel new];
        _airType.textAlignment = NSTextAlignmentLeft;
        _airType.text = @"湾流G650";
        _airType.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _airType.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _airType;
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
