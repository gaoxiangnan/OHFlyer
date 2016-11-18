//
//  MD_BaoxiaoCell.h
//  FlyShare
//
//  Created by 向楠 on 16/5/11.
//  Copyright © 2016年 Vutumn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

@interface MD_BaoxiaoCell : BaseTableViewCell
@property (nonatomic, strong) UILabel *stateLb;
@property (nonatomic, strong) UILabel *contentsLb;
+ (CGFloat)cellHeight:(NSString *)string;
@end
