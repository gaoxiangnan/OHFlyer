//
//  MineOrderViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MineOrderViewController.h"
#import "MineOrderView.h"
#import "PinjiOrderDetailViewController.h"
#import "TravelOrderDetailViewController.h"
#import "BaojiOrderDetailViewController.h"
#import "CustomOrderDetailViewController.h"

@interface MineOrderViewController ()

@end

@implementation MineOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"我的订单";
    self.navigationController.navigationBar.hidden = NO;
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(onBackBtn)];
    
    MineOrderView *mineOrderView = [[MineOrderView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    mineOrderView.orderBlock = ^(NSInteger index){
        if (index == 0) {
            PinjiOrderDetailViewController *pinjiOrderVC = [[PinjiOrderDetailViewController alloc]init];
            [self.navigationController pushViewController:pinjiOrderVC animated:YES];
        }else if (index == 1){
            TravelOrderDetailViewController *travelDetailVC = [[TravelOrderDetailViewController alloc]init];
            [self.navigationController pushViewController:travelDetailVC animated:YES];
        }else if (index == 2){
            BaojiOrderDetailViewController *baojiDetailVC = [[BaojiOrderDetailViewController alloc]init];
            [self.navigationController pushViewController:baojiDetailVC animated:YES];
        }else{
            CustomOrderDetailViewController *customDetailVC = [[CustomOrderDetailViewController alloc]init];
            [self.navigationController pushViewController:customDetailVC animated:YES];
        }
        
    };
    [self.view addSubview:mineOrderView];
    // Do any additional setup after loading the view.
}
- (void)onBackBtn
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
