//
//  CollectViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/16.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectView.h"

@interface CollectViewController ()

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"收藏";
    self.navigationController.navigationBar.hidden = NO;
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(onBackBtn)];
    
    CollectView *collect = [[CollectView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    [self.view addSubview:collect];
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
