//
//  AddressTableCell.h
//  FlyShare
//
//  Created by 向楠 on 16/6/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "Address.h"

@interface AddressTableCell : BaseTableViewCell
@property (nonatomic, strong) Address *address;
+ (CGFloat)cellHeight;
@end
