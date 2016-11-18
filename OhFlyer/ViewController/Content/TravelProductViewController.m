//
//  TravelProductViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/27.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TravelProductViewController.h"
#import "TravelProductView.h"
#import "ProductDetailViewController.h"

@interface TravelProductViewController ()

@end

@implementation TravelProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"旅行产品";
    self.navigationController.navigationBar.hidden = NO;
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    TravelProductView *travelView = [[TravelProductView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64)];
    travelView.listBlock = ^(NSInteger index){
        ProductDetailViewController *detailVC = [[ProductDetailViewController alloc]init];
        [self.navigationController pushViewController:detailVC animated:YES];
    };
    [self.view addSubview:travelView];
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
