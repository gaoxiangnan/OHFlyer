//
//  TripBaojiMoreView.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/31.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^SearchBlock)();
typedef void (^DateBlock)();

@interface TripBaojiMoreView : BaseView
@property (nonatomic, copy) SearchBlock searchBlock;
@property (nonatomic, copy) DateBlock dateBlock;
@end
