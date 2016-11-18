//
//  PinjiOrderDetailViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/7.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "PinjiOrderDetailViewController.h"
#import "MD_OrderDetailView.h"
#import "TuigaiViewController.h"

@interface PinjiOrderDetailViewController ()

@end

@implementation PinjiOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单详情";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    [self rightWithImage:[UIImage imageNamed:@"order_detail_phone"] action:@selector(rightBtn)];
    
    MD_OrderDetailView *mdOrderDetailView = [[MD_OrderDetailView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    mdOrderDetailView.tuigaiBlock = ^(){
        
        TuigaiViewController *tuigaiVC = [[TuigaiViewController alloc]init];
        tuigaiVC.view.backgroundColor = [UIColor clearColor];
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
            
            tuigaiVC.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }else{
            
            self.modalPresentationStyle=UIModalPresentationCurrentContext;
            
        }
        [self presentViewController:tuigaiVC animated:YES completion:nil];
    };
    [self.view addSubview:mdOrderDetailView];
    
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
