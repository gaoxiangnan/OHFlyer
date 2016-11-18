//
//  AddressTableCell.m
//  FlyShare
//
//  Created by 向楠 on 16/6/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "AddressTableCell.h"

//nameLabel
static const CGFloat FS_CTIS1NameLabelMarginLeft = 20.0;
static const CGFloat FS_CTIS1NameLabelMarginTop = 8.0;
static const CGFloat FS_CTIS1NameLabelFont = 14.0;

//rightArrow
static const CGFloat FSCTIS0RightArrMarginRight = 20.0;
static const CGFloat FSCTIS0RightARrrWidth = 6.0;
static const CGFloat FSCTIS0RightARrrHeight = 10.0;

@interface AddressTableCell()
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *addressLabel;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong) UIImageView *rightArrow;

@end
@implementation AddressTableCell
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
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(100)));
    }];
    
    [self addSubview:self.phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(kScaleFrom_iPhone5s_Desgin(10));
        make.top.equalTo(_nameLabel);
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(90)));
    }];
    
    [self addSubview:self.addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.bottom.equalTo(self).offset(-10);
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
    }
    return _nameLabel;
}

- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
        // _idCard.text = @"身份证";
        _addressLabel.textColor = kLightGrayTextColor;
    }
    return _addressLabel;
}

- (UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        _phoneLabel = [UILabel new];
        _phoneLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        // _cardNumber.text = @"3433435335353";
        _phoneLabel.textColor = kLightGrayTextColor;
    }
    return _phoneLabel;
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
- (void)setAddress:(Address *)address
{
    _address = address;
    if (!_address) {
        return;
    }
    _nameLabel.text = [_address valueForKey:@"name"];
    _phoneLabel.text = [_address valueForKey:@"mobile"];
    _addressLabel.text = [_address valueForKey:@"address"];
}

+ (CGFloat)cellHeight
{
    return 60.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
