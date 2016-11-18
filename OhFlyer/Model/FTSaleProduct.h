//
//  FTSaleProduct.h
//  FlyShare
//
//  Created by zzxcc on 16/1/22.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTSaleProduct : NSObject
@property (nonatomic, strong, nonnull) NSString *productId;
@property (nonatomic, strong, nonnull) NSString *productName;
@property (nonatomic, strong, nonnull) NSString *startTime;
@property (nonatomic, strong, nonnull) NSString *endTime;
@property (nonatomic, strong, nonnull) NSString *startCity;
@property (nonatomic, strong, nonnull) NSString *endCity;
@property (nonatomic, strong, nonnull) NSString *startPort;
@property (nonatomic, strong, nonnull) NSString *endPort;
@property (nonatomic, strong, nonnull) NSString *beginDate;
@property (nonatomic, strong, nonnull) NSString *endDate;
@property (nonatomic, strong, nonnull) NSString *limitNumber;
@property (nonatomic, strong, nonnull) NSString *remainSeats;
@property (nonatomic, strong, nonnull) NSString *price;
@property (nonatomic, strong, nonnull) NSString *salePrice;
@property (nonatomic, strong, nonnull) NSString *modelName;//飞机类型
@property (nonatomic, strong, nonnull) NSString *createTime;//飞机类型
@property (nonatomic, strong, nonnull) NSString *email;

@property (nonatomic, strong, nonnull) NSString *dispatchAddress;
@property (nonatomic, strong, nonnull) NSString *dispatchInvoice;
@property (nonatomic, strong, nonnull) NSString *dispatchType;
@property (nonatomic, strong, nonnull) NSString *mealContent;


@property (nonatomic, strong, nonnull) NSString *planeId;
@property (nonatomic, strong, nonnull) NSString *planeName;
@property (nonatomic, strong, nonnull) NSString *brandId;
@property (nonatomic, strong, nonnull) NSString *modelId;
@property (nonatomic, strong, nonnull) NSString *seatBg;
@property (nonatomic, strong, nonnull) NSString *xNum;
@property (nonatomic, strong, nonnull) NSString *yNum;
@property (nonatomic, strong, nonnull) NSNumber *isTop;
@property (nonatomic, strong, nonnull) NSNumber *status;
@property (nonatomic, strong, nonnull) NSString *banner;
@property (nonatomic, strong, nonnull) NSString *editTime;
@property (nonatomic, strong, nonnull) NSNumber *isSel;
@property (nonatomic, strong, nonnull) NSString *picUrl;
@property (nonatomic, strong, nonnull) NSNumber *picType;
@property (nonatomic, strong, nonnull) NSNumber *sort;
@property (nonatomic, strong, nonnull) NSMutableArray *planePics;


@property (nonnull, nonatomic, strong) NSDictionary *propertyArrayMap;

//餐食信息
@property (nonatomic, strong, nonnull) NSMutableArray *mealData;
@property (nonatomic, strong, nonnull) NSString *mealId;
@property (nonatomic, strong, nonnull) NSString *mealName;
@property (nonatomic, strong, nonnull) NSString *mealNum;
@property (nonatomic, strong, nonnull) NSString *mealUrl;
@property (nonatomic, strong, nonnull) NSString *content;
@property (nonatomic, strong, nonnull) NSString *mealType;
@property (nonatomic, strong, nonnull) NSString *mealDType;

//乘客信息
@property (nonatomic, strong, nonnull) NSMutableArray *persons;
@property (nonatomic, strong, nonnull) NSString *cardNo;
@property (nonatomic, strong, nonnull) NSString *cardType;
@property (nonatomic, strong, nonnull) NSString *country;
@property (nonatomic, strong, nonnull) NSString *firstName;
@property (nonatomic, strong, nonnull) NSString *lastName;
@property (nonatomic, strong, nonnull) NSString *mobile;
@property (nonatomic, strong, nonnull) NSString *userId;
@property (nonatomic, strong, nonnull) NSString *userName;


//座位信息
@property (nonatomic, strong, nonnull) NSMutableArray *seatData;
@property (nonatomic, strong, nonnull) NSString *seatId;
@property (nonatomic, strong, nonnull) NSString *gpId;
@property (nonatomic, strong, nonnull) NSNumber *seatType;
@property (nonatomic, strong, nonnull) NSString *posX;
@property (nonatomic, strong, nonnull) NSString *posY;
@property (nonatomic, strong, nonnull) NSString *seatPrice;

- (NSString *)getSeatImageSelected;
- (NSString *)getSeatImageUnselected;

@end
