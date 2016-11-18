
//
//  TravelerAddTableViewCell.m
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "TravelerAddCell.h"
#import "UIView+DrawLine.h"
#import "UIView+Helpers.h"

//右侧箭头
#define FS_TARightArrowWidth kScaleFrom_iPhone5s_Desgin(6.0f)
#define FS_TARightArrowHeight kScaleFrom_iPhone5s_Desgin(10.0f)

//前面名字
#define FS_TATypeLabelMarginLeft kScaleFrom_iPhone5s_Desgin(20.0f)
#define FS_TARightArrowMarginRight kScaleFrom_iPhone5s_Desgin(20.0f)

//switch
#define FS_TASwitchMarginRight kScaleFrom_iPhone5s_Desgin(20.0f)

//infolabel
#define FS_TAInfoLabelMarginRight kScaleFrom_iPhone5s_Desgin(20.0f)

//userbutton
#define FS_TAUserImageSize kScaleFrom_iPhone5s_Desgin(50.0f)

@interface TravelerAddCell()

@end

@implementation TravelerAddCell

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
    [self addSubview:self.typeLabel];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(FS_TATypeLabelMarginLeft);
    }];
    
    [self addSubview:self.inputField];
    [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(127));
        make.right.equalTo(self).offset(-kScaleFrom_iPhone5s_Desgin(20));
        make.centerY.equalTo(self);
        make.height.equalTo(@kScaleFrom_iPhone5s_Desgin(20));
    }];
    
    [self addSubview:self.rightArrow];
    [_rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.equalTo(@(FS_TARightArrowWidth));
        make.height.equalTo(@(FS_TARightArrowHeight));
        make.right.equalTo(self).offset(-FS_TARightArrowMarginRight);
    }];
    
    [self addSubview:self.switches];
    [_switches mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-FS_TASwitchMarginRight);
    }];
    
    [self addSubview:self.infoLabel];
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.userImage];
    [_userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-FS_TAInfoLabelMarginRight);
        make.width.height.equalTo(@(FS_TAUserImageSize));
    }];
}

- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [UILabel new];
        _typeLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        _typeLabel.textAlignment = NSTextAlignmentLeft;
        _typeLabel.text = @"姓名";
    }
    return _typeLabel;
}

- (UITextField *)inputField
{
    if (!_inputField) {
        _inputField = [UITextField new];
        _inputField.clearButtonMode = UITextFieldViewModeAlways;
        _inputField.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        _inputField.autocapitalizationType =  UITextAutocapitalizationTypeWords;

        _inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14 weight:UIFontWeightThin]}];
        [_inputField addTarget:self action:@selector(textValueChange:) forControlEvents:UIControlEventEditingChanged];

    }
    return _inputField;
}

- (UIImageView *)rightArrow
{
    if (!_rightArrow) {
        _rightArrow = [UIImageView new];
        _rightArrow.image = [UIImage imageNamed:@"arrow_right"];
        _rightArrow.hidden = NO;
    }
    return _rightArrow;
}

- (UISwitch *)switches
{
    if (!_switches) {
        _switches = [UISwitch new];
        _switches.onTintColor = kOrangeColor;
        _switches.hidden = YES;
        _switches.on = YES;
    }
    return _switches;
}

- (UILabel *)infoLabel
{
    if (!_infoLabel) {
        _infoLabel = [UILabel new];
        _infoLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _infoLabel.textAlignment = NSTextAlignmentRight;
        _infoLabel.textColor = kLightGrayTextColor192;
        _infoLabel.hidden = YES;
    }
    return _infoLabel;
}

- (UIButton *)userImage
{
    if (!_userImage) {
        _userImage = [UIButton buttonWithType:UIButtonTypeCustom];
        _userImage.layer.cornerRadius = kScaleFrom_iPhone5s_Desgin(25);
        [_userImage setImage:[UIImage imageNamed:@"btn_userIcon"] forState:UIControlStateNormal];
        _userImage.hidden = YES;
    }
    return _userImage;
}

- (void)layoutSubviews
{
    [_infoLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        NSLog(@"%f", _rightArrow.frameOriginX);
        if (_rightArrow.hidden) {
            make.right.equalTo(self).offset(-FS_TAInfoLabelMarginRight);
        }else{
            make.right.equalTo(_rightArrow.mas_left).offset(-10);
        }
    }];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.inputField.text = nil;
    self.inputField.userInteractionEnabled = YES;
    self.rightArrow.hidden = YES;
    self.inputField.clearButtonMode = UITextFieldViewModeAlways;

}

#pragma mark -cellheight
+ (CGFloat)cellHeight : (UITableViewCellType)cellType
{
    switch (cellType) {
        case UITableViewCellType40:
            return kScaleFrom_iPhone5s_Desgin(40);
            break;
        case UITableViewCellType50:
            return 50.0;
            break;
        default:
            break;
    }
}

- (void)textValueChange:(UITextField *)text
{
    if (self.textValueChangee) {
        self.textValueChangee(text);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
