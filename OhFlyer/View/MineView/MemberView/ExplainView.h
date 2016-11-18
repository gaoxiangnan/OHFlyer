//
//  ExplainView.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^onBackBlock)();
@interface ExplainView : BaseView
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UITableView *contentTab;
@property (nonatomic, copy) onBackBlock myBlock;

@end
