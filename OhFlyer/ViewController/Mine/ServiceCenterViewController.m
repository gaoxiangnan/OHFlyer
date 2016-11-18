//
//  ServiceCenterViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/11.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ServiceCenterViewController.h"
#import "ServiceCenterView.h"

@interface ServiceCenterViewController ()

@end

@implementation ServiceCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"客服中心";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
     ServiceCenterView *serviceCenterView = [[ServiceCenterView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64)];
    [self.view addSubview:serviceCenterView];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
