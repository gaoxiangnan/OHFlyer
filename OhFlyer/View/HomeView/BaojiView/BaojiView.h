//
//  BaojiView.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/23.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
#import "TripBaojiView.h"
#import "TripBaojiBackView.h"
#import "TripBaojiMoreView.h"

typedef void (^onSearchBlock)();
@interface BaojiView : BaseView

@property (nonatomic, copy) onSearchBlock myBlock;
@property (nonatomic, strong) TripBaojiView *tripView;
@property (nonatomic, strong) TripBaojiBackView *tripBackView;
@property (nonatomic, strong) TripBaojiMoreView *tripMoreView;
@end
