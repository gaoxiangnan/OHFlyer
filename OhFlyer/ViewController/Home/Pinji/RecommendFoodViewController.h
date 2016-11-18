//
//  RecommendFoodViewController.h
//  FlyShare
//
//  Created by 向楠 on 16/5/13.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "BaseViewController.h"
#import "FoodSelectView.h"

@interface RecommendFoodViewController : BaseViewController

- (instancetype)initWithFoodType:(FoodSelectType)type andDataArr:(NSArray *)foodArr;
@end
