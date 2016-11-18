//
//  FoodSelectCell.h
//  FlyShare
//
//  Created by 向楠 on 16/5/12.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "FTSaleProduct.h"
#import "KeysModel.h"
typedef void (^changeNumBlock)(FTSaleProduct *model);

@interface FoodSelectCell : BaseTableViewCell
@property (nonatomic, copy)changeNumBlock myBlock;
+ (CGFloat)cellHeight;
- (void)translateData:(FTSaleProduct *)model passengerCount:(NSInteger)passengerCount mealDType:(NSString *)mealDType;
- (void)translateAllData:(FTSaleProduct *)allModel mealDType:(NSString *)mealDType;
@end
