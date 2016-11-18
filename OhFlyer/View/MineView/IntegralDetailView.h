//
//  IntegralDetailView.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^integralExplainBlock)();
typedef void (^onBackBlock)();
@interface IntegralDetailView : BaseView

@property (nonatomic, copy) integralExplainBlock explainBlock;
@property (nonatomic, copy) onBackBlock myBlock;

@end
