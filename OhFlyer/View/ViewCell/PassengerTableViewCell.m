//
//  PassengerTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/26.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "PassengerTableViewCell.h"
#import "UIView+DrawLine.h"
@interface PassengerTableViewCell ()

@property (nonatomic, strong) UIButton *delBtn;
@property (nonatomic, strong) UILabel *passengerName;
@property (nonatomic, strong) UILabel *showCardLb;
@property (nonatomic, strong) UILabel *cardNumLb;



@end

@implementation PassengerTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    
    [self addLineUp:YES andDown:NO andColor:RGBACOLOR(239, 239, 239, 0.7)];
    
    [self addSubview:self.delBtn];
    [_delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.passengerName];
    [_passengerName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_delBtn.mas_right).offset(30);
        make.centerY.equalTo(self).offset(-10);
    }];
    [self addSubview:self.showCardLb];
    [_showCardLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passengerName);
        make.centerY.equalTo(self).offset(12);
    }];
    [self addSubview:self.cardNumLb];
    [_cardNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showCardLb.mas_right).offset(5);
        make.top.equalTo(_showCardLb);
    }];
}
- (UIButton *)delBtn
{
    if (!_delBtn) {
        _delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delBtn setBackgroundImage:[UIImage imageNamed:@"passenger_delete"] forState:UIControlStateNormal];
        [_delBtn addTarget:self action:@selector(onDeleteBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delBtn;
}
- (UILabel *)passengerName
{
    if (!_passengerName) {
        _passengerName = [UILabel new];
        _passengerName.text = @"张晓丽";
        _passengerName.textColor = [UIColor blackColor];
        _passengerName.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _passengerName;
}
- (UILabel *)showCardLb
{
    if (!_showCardLb) {
        _showCardLb = [UILabel new];
        _showCardLb.text = @"身份证:";
        _showCardLb.textColor = RGBCOLOR(100, 101, 103);
        _showCardLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _showCardLb;
}
- (UILabel *)cardNumLb
{
    if (!_cardNumLb) {
        _cardNumLb = [UILabel new];
        _cardNumLb.text = @"1304291189823237721";
        _cardNumLb.textColor = RGBCOLOR(100, 101, 103);
        _cardNumLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _cardNumLb;
}

- (void)onDeleteBtn
{
    if (_deleteBlock) {
        _deleteBlock();
    }
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
