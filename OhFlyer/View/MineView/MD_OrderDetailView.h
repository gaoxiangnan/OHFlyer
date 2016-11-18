//
//  MD_OrderDetailView.h
//  FlyShare
//
//  Created by 向楠 on 16/5/9.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTSaleProduct.h"

typedef void (^onGoPayBlock)();
typedef void (^TuiGaiBlock)();


@interface MD_OrderDetailView : UIView
@property (nonatomic, copy) onGoPayBlock myBlock;
@property (nonatomic, copy) TuiGaiBlock tuigaiBlock;
- (instancetype)initWithFrame:(CGRect)frame;

- (void)translateData:(FTSaleProduct *)model;
@end
