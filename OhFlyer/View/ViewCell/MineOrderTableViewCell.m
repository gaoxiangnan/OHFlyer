//
//  MineOrderTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MineOrderTableViewCell.h"

@interface MineOrderTableViewCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *airImg;
@property (nonatomic, strong) UILabel *orderTypeLb;
@property (nonatomic, strong) UIView *orderLine;
@property (nonatomic, strong) UILabel *orderMessageLb;
@property (nonatomic, strong) UILabel *numMoneyLb;
@property (nonatomic, strong) UIView *productLine;

@property (nonatomic, strong) UILabel *addressLb;
@property (nonatomic, strong) UIImageView *showAirImg;
@property (nonatomic, strong) UILabel *airTypeLb;
@property (nonatomic, strong) UIImageView *showTimeImg;
@property (nonatomic, strong) UILabel *startTimeLb;
@property (nonatomic, strong) UIView *targetLine;

@property (nonatomic, strong) NSArray *handleArr;
@end

@implementation MineOrderTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.handleArr = [NSArray arrayWithObjects:@"取消订单",@"支付定金", nil];
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
        make.height.equalTo(@(185));
    }];
    
    [_bgView addSubview:self.airImg];
    [_airImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(12);
        make.top.equalTo(_bgView).offset(10);
    }];
    [_bgView addSubview:self.orderTypeLb];
    [_orderTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airImg.mas_right).offset(10);
        make.top.equalTo(_airImg);
    }];
    [_bgView addSubview:self.orderLine];
    [_orderLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_orderTypeLb.mas_right).offset(10);
        make.top.equalTo(_bgView).offset(15);
        make.width.equalTo(@(1));
        make.height.equalTo(@(18));
    }];
    [_bgView addSubview:self.orderMessageLb];
    [_orderMessageLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_orderLine).offset(10);
        make.top.equalTo(_airImg);
    }];
    [_bgView addSubview:self.numMoneyLb];
    [_numMoneyLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView).offset(-20);
        make.top.equalTo(_orderTypeLb);
    }];
    
    [_bgView addSubview:self.productLine];
    [_productLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView);
        make.top.equalTo(_bgView).offset(38);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgView addSubview:self.addressLb];
    [_addressLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(20);
        make.top.equalTo(_productLine).offset(10);
    }];
    [_bgView addSubview:self.showAirImg];
    [_showAirImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addressLb);
        make.top.equalTo(_addressLb.mas_bottom).offset(10);
    }];
    [_bgView addSubview:self.airTypeLb];
    [_airTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showAirImg.mas_right).offset(5);
        make.top.equalTo(_showAirImg);
    }];
    [_bgView addSubview:self.showTimeImg];
    [_showTimeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showAirImg);
        make.top.equalTo(_showAirImg.mas_bottom).offset(10);
    }];
    [_bgView addSubview:self.startTimeLb];
    [_startTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airTypeLb);
        make.top.equalTo(_showTimeImg);
    }];
    
    [_bgView addSubview:self.targetLine];
    [_targetLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView);
        make.top.equalTo(_startTimeLb.mas_bottom).offset(15);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [self createHandleBtn:self.handleArr];
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView  = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
- (UIImageView *)airImg
{
    if (!_airImg) {
        _airImg = [UIImageView new];
        _airImg.image = [UIImage imageNamed:@"air_pinji"];
    }
    return _airImg;
}
- (UILabel *)orderTypeLb
{
    if (!_orderTypeLb) {
        _orderTypeLb = [UILabel new];
        _orderTypeLb.text = @"拼机";
        _orderTypeLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _orderTypeLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _orderTypeLb;
}
- (UIView *)orderLine
{
    if (!_orderLine) {
        _orderLine  = [UIView new];
        _orderLine.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _orderLine;
}
- (UILabel *)orderMessageLb
{
    if (!_orderMessageLb) {
        _orderMessageLb = [UILabel new];
        _orderMessageLb.text = @"代付款";
        _orderMessageLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _orderMessageLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _orderMessageLb;
}
- (UILabel *)numMoneyLb
{
    if (!_numMoneyLb) {
        _numMoneyLb = [UILabel new];
        _numMoneyLb.text = @"￥18800";
        _numMoneyLb.textColor = RGBACOLOR(165, 42, 36, 1);
        _numMoneyLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _numMoneyLb;
}
- (UIView *)productLine
{
    if (!_productLine) {
        _productLine  = [UIView new];
        _productLine.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _productLine;
}
- (UILabel *)addressLb
{
    if (!_addressLb) {
        _addressLb = [UILabel new];
        _addressLb.text = @"北京－上海";
        _addressLb.textColor = RGBACOLOR(0, 0, 0, 1);
        _addressLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _addressLb;
}
- (UIImageView *)showAirImg
{
    if (!_showAirImg) {
        _showAirImg = [UIImageView new];
        _showAirImg.image = [UIImage imageNamed:@"show_airTtpe"];
    }
    return _showAirImg;
}
- (UILabel *)airTypeLb
{
    if (!_airTypeLb) {
        _airTypeLb = [UILabel new];
        _airTypeLb.text = @"机型：湾流G650";
        _airTypeLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _airTypeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _airTypeLb;
}
- (UIImageView *)showTimeImg
{
    if (!_showTimeImg) {
        _showTimeImg = [UIImageView new];
        _showTimeImg.image = [UIImage imageNamed:@"show_time"];
    }
    return _showTimeImg;
}
- (UILabel *)startTimeLb
{
    if (!_startTimeLb) {
        _startTimeLb = [UILabel new];
        _startTimeLb.text = @"起飞时间：2016-08-23 13:00";
        _startTimeLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _startTimeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _startTimeLb;
}
- (UIView *)targetLine
{
    if (!_targetLine) {
        _targetLine  = [UIView new];
        _targetLine.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _targetLine;
}
- (void)createHandleBtn:(NSArray *)handleArr
{
    for (int i = 0; i < handleArr.count; i ++) {
        UIButton *handleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [handleBtn setTitle:[handleArr objectAtIndex:i] forState:UIControlStateNormal];
        [handleBtn setTitleColor:RGBACOLOR(0, 0, 0, 0.7) forState:UIControlStateNormal];
        handleBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        [handleBtn setBackgroundImage:[UIImage imageNamed:@"handle_btn"] forState:UIControlStateNormal];
        [handleBtn addTarget:self action:@selector(onSelectHandleOneBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:handleBtn];
        
        [handleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_bgView.mas_right).offset(-15-i*(80+14));
            make.top.equalTo(_targetLine).offset(12);
            make.width.equalTo(@(80));
            make.height.equalTo(@(34));
        }];
    }
}
- (void)onSelectHandleOneBtn:(UIButton *)sender
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
