//
//  CTInfoS1TableViewCell.h
//  FlyShare
//
//  Created by zzxcc on 15/12/21.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "Contacts.h"


@interface CTInfoS1Cell : BaseTableViewCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *idCard;
@property (nonatomic, strong) UILabel *cardNumber;
@property (nonatomic, strong) UIImageView *rightArrow;
@property (nonatomic, strong) Contacts *contacts;


+ (CGFloat)cellHeight;

@end
