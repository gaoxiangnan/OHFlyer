//
//  MineOrderView.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^OrderDetailBlock)(NSInteger index);
@interface MineOrderView : BaseView

@property (nonatomic, copy) OrderDetailBlock orderBlock;
@end
