//
//  ChooseFoodViewController.h
//  FlyShare
//
//  Created by zzxcc on 16/1/25.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTSaleProduct.h"

@interface ChooseFoodViewController : BaseViewController

- (instancetype)initWithProductModel:(FTSaleProduct *)productModel andPassengerCount:(NSInteger)count;

@end
