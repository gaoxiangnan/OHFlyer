//
//  FoodSelectView.h
//  FlyShare
//
//  Created by 向楠 on 16/5/12.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTSaleProduct.h"
typedef enum{
    ChineseFood,
    WesternFood
}FoodSelectType;

typedef void (^RecommendBlock)(NSArray *,FoodSelectType);
typedef void (^SureBlock)(NSArray *);


@interface FoodSelectView : UIView

//@property (nonatomic, weak) id<ChooseFoodViewDelegate>delegate;
@property (nonatomic, copy) RecommendBlock recommendBlock;
@property (nonatomic, copy) SureBlock sureBlock;
- (instancetype)initWithFrame:(CGRect)frame andProductModel:(FTSaleProduct *)model andPassengerCount:(NSInteger)count;
@end
