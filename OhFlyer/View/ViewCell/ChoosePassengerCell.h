//
//  ChoosePassengerCell.h
//  FlyShare
//
//  Created by zzxcc on 16/1/14.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

@interface ChoosePassengerCell : BaseTableViewCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *idCard;
@property (nonatomic, strong) UILabel *cardNumber;
@property (nonatomic, strong) UIButton *selectButton;


+ (CGFloat)cellHeight;

@end
