//
//  CustomTripView.h
//  OhFlyer
//
//  Created by 向楠 on 16/9/6.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
#import "TripCountrySelectView.h"
#import "JourneyReferView.h"
#import "SubmitView.h"
typedef void(^BackBlock)();
@interface CustomTripView : BaseView

@property (nonatomic, strong) TripCountrySelectView *countryView;
@property (nonatomic, strong) JourneyReferView *referView;
@property (nonatomic, strong) SubmitView *submitView;
@property (nonatomic, copy) BackBlock backBlock;
@end
