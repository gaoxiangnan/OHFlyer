//
//  BaojiOrderViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/1.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiOrderViewController.h"
#import "BaojiOrderView.h"
#import "RemarkViewController.h"

@interface BaojiOrderViewController ()

@end

@implementation BaojiOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单填写";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    __unsafe_unretained typeof(self) weakSelf = self;
    BaojiOrderView *orderView = [[BaojiOrderView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64)];
    orderView.sure = ^(){
        
    };
    orderView.explain = ^(){
        
    };
    orderView.remark = ^(){
        RemarkViewController *remarkVC = [[RemarkViewController alloc]init];
        [weakSelf.navigationController pushViewController:remarkVC animated:YES];
    };
    [self.view addSubview:orderView];
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
