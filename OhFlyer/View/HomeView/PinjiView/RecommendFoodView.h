//
//  RecommendFoodView.h
//  FlyShare
//
//  Created by 向楠 on 16/5/17.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodSelectView.h"

typedef void (^pushNextViewBlock)(NSArray *);
@interface RecommendFoodView : UIView
@property (nonatomic, copy) pushNextViewBlock pushNextViewBlock;
- (instancetype)initWithFrame:(CGRect)frame FoodType:(FoodSelectType)type andData:(NSArray *)foodArr;
@end
