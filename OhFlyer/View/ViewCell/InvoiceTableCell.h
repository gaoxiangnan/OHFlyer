//
//  InvoiceTableCell.h
//  FlyShare
//
//  Created by 向楠 on 16/6/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "Invoice.h"

@interface InvoiceTableCell : BaseTableViewCell
@property (nonatomic, strong) Invoice *invoice;
+ (CGFloat)cellHeight;
@end
