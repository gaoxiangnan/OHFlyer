//
//  SubmitView.h
//  OhFlyer
//
//  Created by 向楠 on 16/11/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^NextBlock)();
typedef void(^SubmitBackBlock)();
@interface SubmitView : BaseView
@property (nonatomic, copy)NextBlock nextBlock;
@property (nonatomic, copy) SubmitBackBlock submitBack;


@end
