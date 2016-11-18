//
//  CustomCalendarViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/3.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CustomCalendarViewController.h"
#import "CuSZCalendarPicker.h"

@interface CustomCalendarViewController ()

@end

@implementation CustomCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = RGBACOLOR(246, 246, 246, 1);
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    
    CuSZCalendarPicker *calendarPicker = [[CuSZCalendarPicker alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    calendarPicker.calendarBlock = ^(NSString *dateStr){
        [self.navigationController popViewControllerAnimated:YES];
    };
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
