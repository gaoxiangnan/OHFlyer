//
//  MenuSelectCell.h
//  FlyShare
//
//  Created by 向楠 on 16/5/13.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "FTSaleProduct.h"
#import "KeysModel.h"
#import "FoodSelectView.h"

typedef void (^limitNumBlock)();

@interface MenuSelectCell : BaseTableViewCell
@property (nonatomic, copy) limitNumBlock myBlock;

- (void)translateDataType:(FoodSelectType)type passengerCount:(NSInteger)passengerCount andData:(KeysModel *)mealType;
+ (CGFloat)cellHeight;
@end
