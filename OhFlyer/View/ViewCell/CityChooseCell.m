//
//  CityChooseTableViewCell.m
//  FlyShare
//
//  Created by zzxcc on 15/11/25.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CityChooseCell.h"

@interface CityChooseCell()

@end

@implementation CityChooseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self InitWithSubViews];
    
    return self;
}

- (void)InitWithSubViews
{
    [self addSubview:self.cityName];
    [_cityName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(@10);
    }];
}

- (UILabel *)cityName
{
    if (!_cityName) {
        _cityName = [UILabel new];
        _cityName.font = [UIFont systemFontOfSize:kSegmentTitleFont weight:UIFontWeightThin];
       // _cityName.text = @"北京";
    }
    return _cityName;
}

- (void)setCityModel:(CityModel *)cityModel
{
    _cityModel = cityModel;
    if (!_cityModel) {
        return;
    }
    _cityName.text = _cityModel.CityName;
}

- (void)setCountryModel:(CountryModel *)countryModel
{
    _countryModel = countryModel;
    if (!_countryModel) {
        return;
    }
    _cityName.text = _countryModel.name;
}

@end
