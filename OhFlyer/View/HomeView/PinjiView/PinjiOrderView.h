//
//  PinjiOrderView.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/24.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^PassengerBlock)();
typedef void (^CanshiBlock)();
typedef void (^TermsBlock)();
typedef void (^NextStepBlock)();
@interface PinjiOrderView : BaseView

@property (nonatomic, copy) PassengerBlock passengerBlock;
@property (nonatomic, copy) CanshiBlock canshiBlock;
@property (nonatomic, copy) TermsBlock termsBlock;
@property (nonatomic, copy) NextStepBlock nextBlock;

@end
