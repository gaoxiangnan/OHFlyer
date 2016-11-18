//
//  BaojiViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/19.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiViewController.h"
#import "BaojiDetailViewController.h"
#import "BaojiView.h"
#import "OHCalendarViewController.h"

@interface BaojiViewController ()

@end

@implementation BaojiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = RGBACOLOR(246, 246, 246, 1);
    self.title = @"包机";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    __unsafe_unretained typeof(self) weakSelf = self;
    BaojiView *baojiView = [[BaojiView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    baojiView.tripView.dateBlock = ^(){
        OHCalendarViewController *calendarVC = [[OHCalendarViewController alloc]init];
        [weakSelf.navigationController pushViewController:calendarVC animated:YES];
    };
    baojiView.tripView.searchBlock = ^(){
        BaojiDetailViewController *baojiDetailVC = [[BaojiDetailViewController alloc]init];
        [weakSelf.navigationController pushViewController:baojiDetailVC animated:YES];
    };
    [self.view addSubview:baojiView];
    // Do any additional setup after loading the view from its nib.
}
- (void)backBtn
{
    [self back];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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
