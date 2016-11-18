//
//  CTInfoS0TableViewCell.m
//  FlyShare
//
//  Created by zzxcc on 15/12/21.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CTInfoS0Cell.h"

//加号
static const CGFloat FSCTIS0AddImageMarginLeft = 20.0;
static const CGFloat FSCTIS0AddImageWidth = 14.0;
static const CGFloat FSCTIS0AddImageHeight = 14.0;

//label
static const CGFloat FSCTIS0TravelerMarginLeft = 12.0;
static const CGFloat FSCTIS0TravelerFont = 14.0;

//right arrow
static const CGFloat FSCTIS0RightArrMarginRight = 20.0;
static const CGFloat FSCTIS0RightARrrWidth = 6.0;
static const CGFloat FSCTIS0RightARrrHeight = 10.0;


@implementation CTInfoS0Cell

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

#pragma mark - UI
- (void)InitWithSubViews
{
    [self addSubview:self.addImage];
    [_addImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(FSCTIS0AddImageMarginLeft);
        make.width.equalTo(@(FSCTIS0AddImageWidth));
        make.height.equalTo(@(FSCTIS0AddImageHeight));
    }];
    
    [self addSubview:self.addTraveler];
    [_addTraveler mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addImage);
        make.left.equalTo(_addImage.mas_right).offset(FSCTIS0TravelerMarginLeft);
    }];
    
    [self addSubview:self.rightArrow];
    [_rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@(FSCTIS0RightARrrWidth));
        make.height.equalTo(@(FSCTIS0RightARrrHeight));
        make.right.equalTo(self).offset(-FSCTIS0RightArrMarginRight);
    }];
}

- (UIImageView *)addImage
{
    if (!_addImage) {
        _addImage = [UIImageView new];
        _addImage.image = [UIImage imageNamed:@"icon_addinfo"];
    }
    return _addImage;
}

- (UILabel *)addTraveler
{
    if (!_addTraveler) {
        _addTraveler = [UILabel new];
        _addTraveler.text = @"添加新旅客";
        _addTraveler.font = [UIFont systemFontOfSize:FSCTIS0TravelerFont weight:UIFontWeightThin];
    }
    return _addTraveler;
}

- (UIImageView *)rightArrow
{
    if (!_rightArrow) {
        _rightArrow = [UIImageView new];
        _rightArrow.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _rightArrow;
}

+ (CGFloat)cellHeight
{
    return 36.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
