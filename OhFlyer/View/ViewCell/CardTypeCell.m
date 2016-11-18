//
//  CardTypeTableViewCell.m
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CardTypeCell.h"

#define FS_CTCardTypeMarginLeft kScaleFrom_iPhone5s_Desgin(20.0)
#define FS_CTCardNumberMarginLeft kScaleFrom_iPhone5s_Desgin(100.0)

@implementation CardTypeCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self InitWithSubViews];
    }
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.cardType];
    [_cardType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(FS_CTCardTypeMarginLeft);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.cardNumber];
    [_cardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(FS_CTCardNumberMarginLeft);
    }];
    
    [self addSubview:self.selectedImg];
    [_selectedImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-38);
    }];
}

- (UILabel *)cardType
{
    if (!_cardType) {
        _cardType = [UILabel new];
        _cardType.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        _cardType.textAlignment = NSTextAlignmentLeft;
    }
    return _cardType;
}

- (UILabel *)cardNumber
{
    if (!_cardNumber) {
        _cardNumber = [UILabel new];
        _cardNumber.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        _cardNumber.textAlignment = NSTextAlignmentLeft;
//        _cardNumber.text = @"343434334";
    }
    return _cardNumber;
}
- (UIImageView *)selectedImg
{
    if (!_selectedImg) {
        _selectedImg = [UIImageView new];
        _selectedImg.hidden = YES;
        _selectedImg.image = [UIImage imageNamed:@"card_selected"];
    }
    return _selectedImg;
}


+ (CGFloat)cellHeight
{
    return kScaleFrom_iPhone5s_Desgin(44.0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        _selectedImg.hidden = NO;
        _cardNumber.textColor = HEXCOLOR(@"e94709", 1);
    }else{
        _selectedImg.hidden = YES;
        _cardNumber.textColor = RGBACOLOR(0, 0, 0, 0.7);
    }

    // Configure the view for the selected state
}

@end
