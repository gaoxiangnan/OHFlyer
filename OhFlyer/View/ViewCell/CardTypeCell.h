//
//  CardTypeTableViewCell.h
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

@interface CardTypeCell : BaseTableViewCell
@property (nonatomic, strong) UILabel *cardType;
@property (nonatomic, strong) UILabel *cardNumber;
@property (nonatomic, strong) UIImageView *selectedImg;

+ (CGFloat)cellHeight;

@end
