//
//  BaojiDetailTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/31.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiDetailTableViewCell.h"

@interface BaojiDetailTableViewCell ()

@property (nonatomic, strong) UILabel *airTypeLb;
@property (nonatomic, strong) UIImageView *showPriceImg;
@property (nonatomic, strong) UILabel *showPrice;
@property (nonatomic, strong) UILabel *airPrice;

@property (nonatomic, strong) UIImageView *showPersonImg;
@property (nonatomic, strong) UILabel *maxPerson;
@property (nonatomic, strong) UILabel *numPerson;

@property (nonatomic, strong) UIImageView *showTimeImg;
@property (nonatomic, strong) UILabel *showTime;
@property (nonatomic, strong) UILabel *timeLb;

@property (nonatomic, strong) UIImageView *showLandImg;
@property (nonatomic, strong) UILabel *showLandNum;
@property (nonatomic, strong) UILabel *landNumLb;

@property (nonatomic, strong) UIImageView *airPic;
@end

@implementation BaojiDetailTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
     self.backgroundColor = [UIColor whiteColor];
    [self InitWithSubViews];
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    
    
    [self addSubview:self.airTypeLb];
    [_airTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.top.equalTo(self).offset(10);
    }];
    
    [self addSubview:self.showPriceImg];
    [_showPriceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airTypeLb);
        make.top.equalTo(_airTypeLb.mas_bottom).offset(6);
    }];
    
    [self addSubview:self.showPrice];
    [_showPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceImg.mas_right).offset(6);
        make.top.equalTo(_showPriceImg);
    }];
    
    [self addSubview:self.airPrice];
    [_airPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPrice.mas_right).offset(6);
        make.top.equalTo(_showPrice);
    }];
    
    [self addSubview:self.showPersonImg];
    [_showPersonImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceImg);
        make.top.equalTo(_showPriceImg.mas_bottom).offset(8);
    }];
    
    [self addSubview:self.maxPerson];
    [_maxPerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceImg.mas_right).offset(6);
        make.top.equalTo(_showPersonImg);
    }];
    
    [self addSubview:self.numPerson];
    [_numPerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_maxPerson.mas_right).offset(8);
        make.top.equalTo(_maxPerson);
    }];
    
    
    [self addSubview:self.showTimeImg];
    [_showTimeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPersonImg);
        make.top.equalTo(_showPersonImg.mas_bottom).offset(10);
    }];
    [self addSubview:self.showTime];
    [_showTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTimeImg.mas_right).offset(6);
        make.bottom.equalTo(_showTimeImg.mas_bottom);
    }];
    
    [self addSubview:self.timeLb];
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTime.mas_right).offset(6);
        make.top.equalTo(_showTime);
    }];
    
    [self addSubview:self.showLandImg];
    [_showLandImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLb.mas_right).offset(10);
        make.top.equalTo(_showTimeImg);
    }];
    
    [self addSubview:self.showLandNum];
    [_showLandNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showLandImg.mas_right).offset(6);
        make.top.equalTo(_timeLb);
    }];
    [self addSubview:self.landNumLb];
    [_landNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showLandNum.mas_right).offset(5);
        make.top.equalTo(_showLandNum);
    }];
    
    [self addSubview:self.airPic];
    [_airPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(self).offset(14);
    }];
}

- (UILabel *)airTypeLb
{
    if (!_airTypeLb) {
        _airTypeLb = [UILabel new];
        _airTypeLb.text = @"世袭1000";
        _airTypeLb.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _airTypeLb.textAlignment = NSTextAlignmentLeft;
    }
    return _airTypeLb;
}
- (UIImageView *)showPriceImg
{
    if (!_showPriceImg) {
        _showPriceImg = [UIImageView new];
        _showPriceImg.image = [UIImage imageNamed:@"baoji_price"];
    }
    return _showPriceImg;
}
- (UILabel *)showPrice
{
    if (!_showPrice) {
        _showPrice = [UILabel new];
        _showPrice.text = @"参考价格:";
        _showPrice.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _showPrice.textAlignment = NSTextAlignmentLeft;
    }
    return _showPrice;
}
- (UILabel *)airPrice
{
    if (!_airPrice) {
        _airPrice = [UILabel new];
        _airPrice.text = @"￥1000";
        _airPrice.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _airPrice.textAlignment = NSTextAlignmentLeft;
    }
    return _airPrice;
}
- (UIImageView *)showPersonImg
{
    if (!_showPersonImg) {
        _showPersonImg = [UIImageView new];
        _showPersonImg.image = [UIImage imageNamed:@"baoji_showMax"];
    }
    return _showPersonImg;
}
- (UILabel *)maxPerson
{
    if (!_maxPerson) {
        _maxPerson = [UILabel new];
        _maxPerson.text = @"最大乘机人数:";
        _maxPerson.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _maxPerson.textAlignment = NSTextAlignmentLeft;
    }
    return _maxPerson;
}
- (UILabel *)numPerson
{
    if (!_numPerson) {
        _numPerson = [UILabel new];
        _numPerson.text = @"22";
        _numPerson.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _numPerson.textAlignment = NSTextAlignmentLeft;
    }
    return _numPerson;
}
- (UIImageView *)showTimeImg
{
    if (!_showTimeImg) {
        _showTimeImg = [UIImageView new];
        _showTimeImg.image = [UIImage imageNamed:@"show_time"];
    }
    return _showTimeImg;
}
- (UILabel *)showTime
{
    if (!_showTime) {
        _showTime = [UILabel new];
        _showTime.text = @"飞行时长:";
        _showTime.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _showTime.textAlignment = NSTextAlignmentLeft;
    }
    return _showTime;
}
- (UILabel *)timeLb
{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        _timeLb.text = @"5h 30m";
        _timeLb.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _timeLb.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLb;
}
- (UIImageView *)showLandImg
{
    if (!_showLandImg) {
        _showLandImg = [UIImageView new];
        _showLandImg.image = [UIImage imageNamed:@"showLand"];
    }
    return _showLandImg;
}
- (UILabel *)showLandNum
{
    if (!_showLandNum) {
        _showLandNum = [UILabel new];
        _showLandNum.text = @"加降次数:";
        _showLandNum.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _showLandNum.textAlignment = NSTextAlignmentLeft;
    }
    return _showLandNum;
}
- (UILabel *)landNumLb
{
    if (!_landNumLb) {
        _landNumLb = [UILabel new];
        _landNumLb.text = @"2m";
        _landNumLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _landNumLb.textAlignment = NSTextAlignmentLeft;
    }
    return _landNumLb;
}

- (UIImageView *)airPic
{
    if (!_airPic) {
        _airPic = [UIImageView new];
        _airPic.image = [UIImage imageNamed:@"baoji_order"];
    }
    return _airPic;
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
