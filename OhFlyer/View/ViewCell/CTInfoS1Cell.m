//
//  CTInfoS1TableViewCell.m
//  FlyShare
//
//  Created by zzxcc on 15/12/21.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CTInfoS1Cell.h"

//nameLabel
static const CGFloat FS_CTIS1NameLabelMarginLeft = 20.0;
static const CGFloat FS_CTIS1NameLabelMarginTop = 8.0;
static const CGFloat FS_CTIS1NameLabelFont = 14.0;

//idCard
static const CGFloat FS_CTIS1IdCardMarginBottom = 9.0;
static const CGFloat FS_CTIS1IdCardFont = 12.0;

//cardNumber
static const CGFloat FS_CTIS1CardNumberMarginLeft = 104.0;
static const CGFloat FS_CTIS1CardNumberFont = 12.0;

//rightArrow
static const CGFloat FSCTIS0RightArrMarginRight = 20.0;
static const CGFloat FSCTIS0RightARrrWidth = 6.0;
static const CGFloat FSCTIS0RightARrrHeight = 10.0;



@implementation CTInfoS1Cell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self InitWithSubViews];
    }
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(FS_CTIS1NameLabelMarginLeft));
        make.top.equalTo(@(FS_CTIS1NameLabelMarginTop));
    }];
    
    [self addSubview:self.idCard];
    [_idCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.bottom.equalTo(self).offset(-FS_CTIS1IdCardMarginBottom);
    }];
    
    [self addSubview:self.cardNumber];
    [_cardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(FS_CTIS1CardNumberMarginLeft);
        make.centerY.equalTo(_idCard);
    }];
    
    [self addSubview:self.rightArrow];
    [_rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-FSCTIS0RightArrMarginRight);
        make.width.equalTo(@(FSCTIS0RightARrrWidth));
        make.height.equalTo(@(FSCTIS0RightARrrHeight));

    }];
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:FS_CTIS1NameLabelFont weight:UIFontWeightRegular];
      //  _nameLabel.text = @"多发发的";
    }
    return _nameLabel;
}

- (UILabel *)idCard
{
    if (!_idCard) {
        _idCard = [UILabel new];
        _idCard.font = [UIFont systemFontOfSize:FS_CTIS1IdCardFont weight:UIFontWeightThin];
       // _idCard.text = @"身份证";
        _idCard.textColor = kLightGrayTextColor;
    }
    return _idCard;
}

- (UILabel *)cardNumber
{
    if (!_cardNumber) {
        _cardNumber = [UILabel new];
        _cardNumber.font = [UIFont systemFontOfSize:FS_CTIS1CardNumberFont weight:UIFontWeightThin];
       // _cardNumber.text = @"3433435335353";
        _cardNumber.textColor = kLightGrayTextColor;
    }
    return _cardNumber;
}

- (UIImageView *)rightArrow
{
    if (!_rightArrow) {
        _rightArrow = [UIImageView new];
        _rightArrow.image = [UIImage imageNamed:@"list_rightarrow"];
    }
    return _rightArrow;
}

//setdata
- (void)setContacts:(Contacts *)contacts
{
    _contacts = contacts;
    if (!_contacts) {
        return;
    }
    _nameLabel.text = [_contacts valueForKey:@"name"];
    //（1身份证、2护照、3台胞证、4回乡证、5军人证、6港澳通行证、7户口本、8出生证明、0其他）
    switch ([[_contacts valueForKey:@"card_type"] integerValue]) {
        case 0:
            _idCard.text = @"其它";
            break;
        case 1:
            _idCard.text = @"身份证";
            break;
        case 2:
            _idCard.text = @"护照";
            break;
        case 3:
            _idCard.text = @"台胞证";
            break;
        case 4:
            _idCard.text = @"回乡证";
            break;
        case 5:
            _idCard.text = @"军人证";
            break;
        case 6:
            _idCard.text = @"港澳通行证";
            break;
        case 7:
            _idCard.text = @"户口本";
            break;
        case 8:
            _idCard.text = @"出生证明";
            break;
        default:
            break;
    }
    _cardNumber.text = [_contacts valueForKey:@"card_no"];
    
}

+ (CGFloat)cellHeight
{
    return 60.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
