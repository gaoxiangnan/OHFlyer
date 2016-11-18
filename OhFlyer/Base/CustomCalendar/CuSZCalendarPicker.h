//
//  CuSZCalendarPicker.h
//  OhFlyer
//
//  Created by 向楠 on 16/11/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CuSZCalendarPicker : UIView<UICollectionViewDelegate , UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;
@property (nonatomic, copy) void(^calendarBlock)(NSString *complateString);

@end
