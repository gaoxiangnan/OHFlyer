//
//  SelectedFoodView.h
//  FlyShare
//
//  Created by 向楠 on 16/5/17.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeysModel.h"
typedef void (^onSureBlock)(NSString *);
typedef void (^onChangeBlock)();
@interface SelectedFoodView : UIView
@property (nonatomic, copy) onSureBlock sureBlock;
@property (nonatomic, copy) onChangeBlock changeBlock;
- (instancetype)initWithFrame:(CGRect)frame andData:(NSArray *)foodArr;
@end
