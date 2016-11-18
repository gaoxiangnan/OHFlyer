//
//  CustomTripViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/6.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CustomTripViewController.h"
#import "CustomTripView.h"
#import "CustomCalendarViewController.h"

@interface CustomTripViewController ()

@end

@implementation CustomTripViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    CustomTripView *customTripView = [[CustomTripView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    
    customTripView.countryView.backBlock = ^(){
        [self back];
    };
    customTripView.referView.dateBlock = ^(){
        CustomCalendarViewController *calendarVC = [[CustomCalendarViewController alloc]init];
        [self.navigationController pushViewController:calendarVC animated:YES];
    };
    [self.view addSubview:customTripView];
    // Do any additional setup after loading the view from its nib.
}

- (void)onSkipBtn
{
    NSLog(@"跳过----------跳过");
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
