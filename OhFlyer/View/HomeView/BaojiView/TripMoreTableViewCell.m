//
//  TripMoreTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/18.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TripMoreTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface TripMoreTableViewCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *airPic;
/*   出发  */
@property (nonatomic, strong) UILabel *showStartLb;
@property (nonatomic, strong) UILabel *startLb;
@property (nonatomic, strong) UIImageView *showStartImg;
/*  到达   */
@property (nonatomic, strong) UILabel *showArriveLb;
@property (nonatomic, strong) UILabel *arriveLb;
@property (nonatomic, strong) UIImageView *showArriveImg;

@property (nonatomic, strong) UILabel *startAirPlaneLb;
@property (nonatomic, strong) UILabel *arriveAirPlaneLb;
/*  日期  */
@property (nonatomic, strong) UILabel *showDate;
@property (nonatomic, strong) UILabel *startDate;
@property (nonatomic, strong) UIImageView *showDateImg;
@end

@implementation TripMoreTableViewCell
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
        make.left.width.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.height.equalTo(@(140));
    }];
    
    [_bgView addSubview:self.airPic];
    [_airPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(self).offset(27);
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
        make.top.equalTo(_showStartImg.mas_bottom).offset(10);
    }];
    
    [_bgView addSubview:self.startAirPlaneLb];
    [_startAirPlaneLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startLb);
        make.top.equalTo(_startLb.mas_bottom).offset(6);
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
        make.top.equalTo(_showStartLb);
    }];
    
    [_bgView addSubview:self.arriveLb];
    [_arriveLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_showArriveLb.mas_right);
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
    
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
    CGPathMoveToPoint(path, NULL, 20, 85);
    CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(325),85);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[_bgView layer] addSublayer:shapeLayer];
    
    
    
    UIView *deleteBgView = [UIView new];
    deleteBgView.backgroundColor = RGBCOLOR(246, 246, 246);
    [self.contentView addSubview:deleteBgView];
    
    UIButton *deleteBtn = [UIButton new];
    deleteBtn.backgroundColor = [UIColor whiteColor];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    deleteBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [deleteBgView addSubview:deleteBtn];
    
    [deleteBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(kDeviceWidth-20);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(1);
        make.width.equalTo(self.contentView);
    }];
    
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(80);
        make.top.equalTo(deleteBgView).offset(10);
        make.bottom.equalTo(deleteBgView);
        make.left.equalTo(deleteBgView);
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
        _startDate.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _startDate.text = @"2016-11-12 13:12";
        _startDate.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _startDate.textAlignment = NSTextAlignmentRight;
        
        UITapGestureRecognizer *dateGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSelectDateClient)];
        [_startDate addGestureRecognizer:dateGes];
    }
    return _startDate;
}
- (void)onSelectDateClient
{
    
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
