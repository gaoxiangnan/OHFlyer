//
//  TripCountrySelectView.h
//  OhFlyer
//
//  Created by 向楠 on 16/9/8.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^NextBlock)();
typedef void(^BackBlock)();
@interface TripCountrySelectView : BaseView

@property (nonatomic, copy) NextBlock nextBlock;
@property (nonatomic, copy) BackBlock backBlock;


@end
