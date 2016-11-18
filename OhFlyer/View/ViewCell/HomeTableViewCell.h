//
//  HomeTableViewCell.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))

@interface HomeTableViewCell : BaseTableViewCell
+ (CGFloat)cellHeight;
@end
