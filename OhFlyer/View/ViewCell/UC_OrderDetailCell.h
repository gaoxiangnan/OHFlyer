//
//  OrderDetailCell.h
//  FlyShare
//
//  Created by 向楠 on 16/5/5.
//  Copyright © 2016年 Vutumn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "FTSaleProduct.h"

@interface UC_OrderDetailCell : BaseTableViewCell
@property (nonatomic, strong) UILabel *nameLb;
@property (nonatomic, strong) UILabel *cardNoLb;
@property (nonatomic, strong) UIView *line;

- (void)translateData:(FTSaleProduct *)model;
+ (CGFloat)cellHeight;
@end
