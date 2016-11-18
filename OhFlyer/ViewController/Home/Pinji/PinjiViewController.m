//
//  PinjiViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/19.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "PinjiViewController.h"
#import "PinjiOrderViewController.h"
#import "PinjiView.h"

@interface PinjiViewController ()

@end

@implementation PinjiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"拼机";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    PinjiView *pinjiView = [[PinjiView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    pinjiView.orderBlock = ^(){
        PinjiOrderViewController *orderVC = [[PinjiOrderViewController alloc]init];
        [self.navigationController pushViewController:orderVC animated:YES];
    };
    [self.view addSubview:pinjiView];
    
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
