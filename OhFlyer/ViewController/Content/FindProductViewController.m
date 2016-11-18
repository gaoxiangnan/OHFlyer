//
//  FindProductViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/12.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "FindProductViewController.h"
#import "FindProductView.h"

@interface FindProductViewController ()

@end

@implementation FindProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单填写";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    FindProductView *findVC = [[FindProductView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64)];
    [self.view addSubview:findVC];
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
