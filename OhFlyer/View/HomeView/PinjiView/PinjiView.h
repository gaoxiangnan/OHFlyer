//
//  PinjiView.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/23.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^onSelectOrderBlock)();
@interface PinjiView : BaseView

@property (nonatomic, strong) NSArray *hotCityArr;
@property (nonatomic, strong) NSArray *hotCityEnArr;
@property (nonatomic, copy) onSelectOrderBlock orderBlock;

@end
