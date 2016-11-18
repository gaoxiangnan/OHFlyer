//
//  TripBaojiView.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/26.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^DateBlock)();
typedef void (^SearchBlock)();
@interface TripBaojiView : BaseView

@property (nonatomic, copy) DateBlock dateBlock;
@property (nonatomic, copy) SearchBlock searchBlock;

@end
