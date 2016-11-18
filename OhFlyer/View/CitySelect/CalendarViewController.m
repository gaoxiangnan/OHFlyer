//
//  CalendarViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/11/25.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CalendarViewController.h"
#import "NSDate+Common.h"
#import "NSDate+Helper.h"
#import "UIImage+Color.h"

@interface CalendarViewController()
@property (nonatomic, strong) NSMutableArray *customDates;
//@property (nonatomic, strong) TravelProduct *productModel;

@end

@implementation CalendarViewController


- (instancetype)init//WithProductModel:(TravelProduct *)productModel
{
    self = [super init];
    if (self) {
//        self.productModel = productModel;
    }
    return self;
}

- (instancetype)initWithPushType:(PushControllerType)pushType
{
    self =  [super init];
    if (self) {
        self.pushType = pushType;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"出发日期";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];

    self.delegate = self;
    
    [[PDTSimpleCalendarViewCell appearance] setCircleSelectedColor:kOrangeColor];
    [[PDTSimpleCalendarViewCell appearance] setTextDefaultFont:[UIFont systemFontOfSize:15.0f weight:UIFontWeightRegular]];

    self.customDates = [[NSMutableArray alloc] init];
    [self initCustomDates];
    self.firstDate = [NSDate date];
//    self.firstDate = [[NSDate date] initWithTimeIntervalSinceNow: 24*60*60*1];//出发日期选择今天的 后一天
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    offsetComponents.month = 12;
    
//    NSDate *lastDate =[self.calendar dateByAddingComponents:offsetComponents toDate:[[NSDate date] initWithTimeIntervalSinceNow: 24*60*60*1] options:0];
    NSDate *lastDate =[self.calendar dateByAddingComponents:offsetComponents toDate:[NSDate date] options:0];
    self.lastDate = lastDate;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    [self setNavigationBarLineIsHidden:NO];
    self.navigationController.navigationBar.translucent = NO;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = YES;
    [self setNavigationBarLineIsHidden:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:246.0 / 255.0 green:246.0 / 255.0 blue:246.0 / 255.0 alpha:0.95]] forBarMetrics:UIBarMetricsDefault];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

#pragma mark - PDTSimpleCalendarViewDelegate

- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date
{
    
    
    if (self.pushType == PushControllerTypeChart) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:self.indexPath forKey:@"indexpath"];
        [dic setObject:[NSDate stringFromDate:date withFormat:@"yyyy-MM-dd"] forKey:@"date"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshCharter" object:nil userInfo:dic];

    }else if(self.pushType == PushControllerTypeFlyTogether){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshFlyTogether" object:[NSDate stringFromDate:date withFormat:@"yyyy-MM-dd"]];
    }else if (self.pushType == PushControllerTypeFlyTogetherB){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshFlyTogetherB" object:[NSDate stringFromDate:date withFormat:@"yyyy-MM-dd"]];
    }else if(self.pushType == PushControllerTypeFTProductDetail){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshFTProduct" object:[NSDate stringFromDate:date withFormat:@"yyyy-MM-dd"]];

    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTravelOrder" object:[NSDate stringFromDate:date withFormat:@"yyyy-MM-dd"]];
    }
    //刷新旅行订单界面
    [self.navigationController popViewControllerAnimated:YES];

}

- (BOOL)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller shouldUseCustomColorsForDate:(NSDate *)date
{
    if ([self.customDates containsObject:date]) {
            return YES;
    }
    
    return NO;
}

- (UIColor *)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller circleColorForDate:(NSDate *)date
{
    return [UIColor whiteColor];
}

- (UIColor *)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller textColorForDate:(NSDate *)date
{
    return [UIColor orangeColor];
}

#pragma mark -Private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

//Add 3 custom dates, the 15th for the current & 2 next months.
- (void)initCustomDates
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[[NSDate date] initWithTimeIntervalSinceNow: 24*60*60*1]];//今天+一天
    components.day = 15;
    NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:components];
    NSDateComponents *addOneMonthComponents = [[NSDateComponents alloc] init];
    addOneMonthComponents.month =1;
    NSDate *date2 = [[NSCalendar currentCalendar] dateByAddingComponents:addOneMonthComponents toDate:date1 options:0];
    NSDate *date3 = [[NSCalendar currentCalendar] dateByAddingComponents:addOneMonthComponents toDate:date2 options:0];
    
//    for (NSString *date in self.productModel.startTime) {
//    if (self.productModel) {
//        [self.customDates addObject:[NSDate dateFromString:self.productModel.startTime withFormat:@"yyyy-MM-dd"]];
//
//    }
  //  }
    
    //self.customDates = @[date1, date2, date3];
}

- (void)setNavigationBarLineIsHidden:(BOOL)navigationBarLineIsHidden {
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list = self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                NSArray *list2 = imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2 = (UIImageView *)obj2;
                        imageView2.hidden = navigationBarLineIsHidden;
                    }
                }
            }
        }
    }
}


@end
