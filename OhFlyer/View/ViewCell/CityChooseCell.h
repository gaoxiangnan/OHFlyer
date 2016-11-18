//
//  CityChooseTableViewCell.h
//  FlyShare
//
//  Created by zzxcc on 15/11/25.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "CityModel.h"
#import "CountryModel.h"

@interface CityChooseCell : BaseTableViewCell
@property (nonatomic, strong) UILabel *cityName;
@property (nonatomic, strong) CityModel *cityModel;
@property (nonatomic, strong) CountryModel *countryModel;

@end
