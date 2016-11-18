//
//  BaojiDetailViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/31.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiDetailViewController.h"
#import "BaojiOrderViewController.h"
#import "BaojiDetailView.h"

@interface BaojiDetailViewController ()

@end

@implementation BaojiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"北京-上海";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    BaojiDetailView *detailView = [[BaojiDetailView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64)];
    detailView.myBlock = ^(){
        BaojiOrderViewController *orderVC = [[BaojiOrderViewController alloc]init];
        [self.navigationController pushViewController:orderVC animated:YES];
    };
    [self.view addSubview:detailView];
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
