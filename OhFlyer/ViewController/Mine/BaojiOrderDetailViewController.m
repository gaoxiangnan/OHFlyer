//
//  BaojiOrderDetailViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/9.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiOrderDetailViewController.h"
#import "CT_OrderDetailView.h"

@interface BaojiOrderDetailViewController ()

@end

@implementation BaojiOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    [self rightWithImage:[UIImage imageNamed:@"order_detail_phone"] action:@selector(rightBtn)];
    
    CT_OrderDetailView *ctOrderDetailView = [[CT_OrderDetailView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    [self.view addSubview:ctOrderDetailView];
    // Do any additional setup after loading the view.
}
- (void)backBtn
{
    [self back];
}
- (void)rightBtn
{
    
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
