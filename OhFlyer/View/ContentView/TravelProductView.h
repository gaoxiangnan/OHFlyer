//
//  TravelProductView.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/27.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^ListBlock)(NSInteger index);
@interface TravelProductView : BaseView

@property (nonatomic, copy) ListBlock listBlock;

@end
