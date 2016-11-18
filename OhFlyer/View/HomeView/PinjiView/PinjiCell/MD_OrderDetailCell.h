//
//  MD_OrderDetailCell.h
//  FlyShare
//
//  Created by 向楠 on 16/5/11.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "KeysModel.h"

@interface MD_OrderDetailCell : BaseTableViewCell

- (void)translateData:(KeysModel *)keysModel;
+ (CGFloat)cellHeight:(KeysModel *)keysModel;
@end
