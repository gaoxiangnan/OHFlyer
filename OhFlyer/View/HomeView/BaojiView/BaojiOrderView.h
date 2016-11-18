//
//  BaojiOrderView.h
//  OhFlyer
//
//  Created by 向楠 on 16/9/1.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^RemarkBlock)();
typedef void (^ExplainBlock)();
typedef void (^SureBlock)();
@interface BaojiOrderView : BaseView
@property (nonatomic, copy) RemarkBlock remark;
@property (nonatomic, copy) ExplainBlock explain;
@property (nonatomic, copy) SureBlock sure;

@end
