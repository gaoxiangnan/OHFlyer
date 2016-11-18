//
//  ContentView.h
//  OhFlyer
//
//  Created by 向楠 on 16/9/6.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^DetailBlock)();
typedef void (^FindBlock)();
@interface ContentView : BaseView
@property (nonatomic, copy) DetailBlock myBlock;
@property (nonatomic, copy) FindBlock findBlock;

@end
