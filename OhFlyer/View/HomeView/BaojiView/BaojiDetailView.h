//
//  BaojiDetailView.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/31.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void(^onSelectCellBlock)();
@interface BaojiDetailView : BaseView
@property (nonatomic, copy) onSelectCellBlock myBlock;
@end
