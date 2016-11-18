//
//  OHTravelCalendarViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/28.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "OHTravelCalendarViewController.h"
#import "OHCalendarPicker.h"

@interface OHTravelCalendarViewController ()

@end

@implementation OHTravelCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择出发日期";
    self.navigationController.navigationBar.hidden = NO;
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    OHCalendarPicker *calendarPicker = [[OHCalendarPicker alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    
    [self.view addSubview:calendarPicker];
    // Do any additional setup after loading the view.
}
- (void)backBtn
{
    [self back];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
