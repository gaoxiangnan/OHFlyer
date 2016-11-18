//
//  MineView.h
//  OhFlyer
//
//  Created by 向楠 on 16/9/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef void (^mineCenterBlock)(NSInteger index);
typedef void (^LoginBlock)();
//typedef enum {
//    alwaysMessage = 0,
//    memberCenter,
//    serviceCenter,
//    setCenter
//}MenuSelect;
typedef void (^titleNameBlock)(NSInteger titleIndex);
@interface MineView : BaseView

@property (nonatomic, copy)mineCenterBlock centerBlock;
@property (nonatomic, copy)titleNameBlock titleBlock;
@property (nonatomic, copy)LoginBlock loginBlock;
//@property (nonatomic, assign) MenuSelect menuSelect;

@end
