//
//  PinjiOrderViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/24.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "PinjiOrderViewController.h"
#import "PinjiOrderView.h"
#import "ChooseFoodViewController.h"

@interface PinjiOrderViewController ()

@end

@implementation PinjiOrderViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"北京-上海";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    __weak PinjiOrderViewController *pinjiVC = self;
    PinjiOrderView *pinjiOrderView = [[PinjiOrderView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    pinjiOrderView.canshiBlock = ^(){
        ChooseFoodViewController *chooseVC = [[ChooseFoodViewController alloc]init];
        [pinjiVC.navigationController pushViewController:chooseVC animated:YES];
    };
    
    [self.view addSubview:pinjiOrderView];
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
