//
//  OHCalendarPicker.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/28.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"

@interface OHCalendarPicker : BaseView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;
@property (nonatomic, copy) void(^calendarBlock)(NSString *complateString);
@end
