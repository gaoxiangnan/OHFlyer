//
//  RecommendCell.h
//  FlyShare
//
//  Created by 向楠 on 16/5/13.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "FoodSelectView.h"
#import "FTSaleProduct.h"

@interface RecommendCell : BaseTableViewCell
- (void)translateFoodType:(FoodSelectType)type Data:(FTSaleProduct *)model;
@end
