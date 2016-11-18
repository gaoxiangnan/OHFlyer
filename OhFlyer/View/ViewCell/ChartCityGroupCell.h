//
//  ChartCityGroupCell.h
//  FlyShare
//
//  Created by zzxcc on 16/1/21.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityModel.h"
#import "BaseTableViewCell.h"

@protocol ChartCityGroupCell <NSObject>

- (void) cityGroupCellDidSelectCity:(CityModel *)city;

@end

@interface ChartCityGroupCell : BaseTableViewCell
@property (nonatomic, weak) id<ChartCityGroupCell>delegate;
@property (nonatomic, strong) NSArray *cityArray;
@property (nonatomic, strong) NSMutableArray *arrayCityButtons;
@property (nonatomic, strong) UILabel *noDateLabel;

+ (CGFloat) getCellHeightOfCityArray:(NSArray *)cityArray;

@end
