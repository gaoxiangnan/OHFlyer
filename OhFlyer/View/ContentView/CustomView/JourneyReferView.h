//
//  JourneyReferView.h
//  OhFlyer
//
//  Created by 向楠 on 16/9/8.
//  Copyright © 2016年 向楠. All rights reserved.
//
typedef void(^NextBlock)();
typedef void(^BackJourneyBlock)();
typedef void (^DateBlock)();

#import "BaseView.h"

@interface JourneyReferView : BaseView
@property (nonatomic, copy) NextBlock nextBlock;
@property (nonatomic, copy) BackJourneyBlock journeyBack;
@property (nonatomic, copy) DateBlock dateBlock;

@end
