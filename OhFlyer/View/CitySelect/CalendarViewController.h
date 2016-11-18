//
//  CalendarViewController.h
//  FlyShare
//
//  Created by zzxcc on 15/11/25.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDTSimpleCalendarViewController.h"
#import "PDTSimpleCalendarViewCell.h"
#import "PDTSimpleCalendarViewHeader.h"
//#import "TravelProduct.h"

typedef NS_ENUM(NSInteger, PushControllerType){
    PushControllerTypeChart, //包机
    PushControllerTypeFlyTogether, //拼机
    PushControllerTypeFlyTogetherB, //拼机B
    PushControllerTypeFTProductDetail, //拼机搜索产品
    PushControllerTypeTravel,
};

@interface CalendarViewController : PDTSimpleCalendarViewController<PDTSimpleCalendarViewDelegate>
@property (nonatomic) PushControllerType pushType;
@property (nonatomic) NSIndexPath *indexPath;

//旅行订单专用初始化方法
- (instancetype)init;//WithProductModel:(TravelProduct *)productModel;

- (instancetype)initWithPushType:(PushControllerType)pushType;

@end
