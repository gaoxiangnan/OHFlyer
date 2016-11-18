//
//  CTInfoS0TableViewCell.h
//  FlyShare
//
//  Created by zzxcc on 15/12/21.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

@interface CTInfoS0Cell : BaseTableViewCell
@property (nonatomic, strong) UIImageView *addImage;
@property (nonatomic, strong) UILabel *addTraveler;
@property (nonatomic, strong) UIImageView *rightArrow;


+ (CGFloat)cellHeight;

@end
