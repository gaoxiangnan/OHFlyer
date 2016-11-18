//
//  ChoosePassengerCell.m
//  FlyShare
//
//  Created by zzxcc on 16/1/14.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "ChoosePassengerCell.h"

//nameLabel
static const CGFloat FS_CPNameLabelMarginLeft = 48.0;
static const CGFloat FS_CPNameLabelMarginTop = 8.0;

//idCard
static const CGFloat FS_CPIdCardMarginBottom = 9.0;

//cardNumber
static const CGFloat FS_CPCardNumberMarginLeft = 131.0;

static const CGFloat FS_CPselectButtonSize = 56.0f;

@implementation ChoosePassengerCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // self.backgroundColor = [UIColor yellowColor];
    [self InitWithSubViews];
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(FS_CPNameLabelMarginLeft));
        make.top.equalTo(@(FS_CPNameLabelMarginTop));
    }];
    
    [self addSubview:self.idCard];
    [_idCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.bottom.equalTo(self).offset(-FS_CPIdCardMarginBottom);
    }];
    
    [self addSubview:self.cardNumber];
    [_cardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(FS_CPCardNumberMarginLeft);
        make.centerY.equalTo(_idCard);
    }];
    
    [self addSubview:self.selectButton];
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.height.equalTo(@(FS_CPselectButtonSize));
        
    }];
}

- (UIButton *)selectButton
{
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.userInteractionEnabled = NO;
        [_selectButton setImage:[UIImage imageNamed:@"travel_checkbox_unselected"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"travel_checkbox_selected"] forState:UIControlStateSelected];
//        [_selectButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightRegular];
    }
    return _nameLabel;
}

- (UILabel *)idCard
{
    if (!_idCard) {
        _idCard = [UILabel new];
        _idCard.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightThin];
        _idCard.textColor = kLightGrayTextColor;
    }
    return _idCard;
}

- (UILabel *)cardNumber
{
    if (!_cardNumber) {
        _cardNumber = [UILabel new];
        _cardNumber.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightThin];
        _cardNumber.textColor = kLightGrayTextColor;
    }
    return _cardNumber;
}


+ (CGFloat)cellHeight
{
    return 60.0;
}

#pragma mark -private
- (void)selectAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
