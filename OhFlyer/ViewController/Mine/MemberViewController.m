//
//  MemberViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/9.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MemberViewController.h"
#import "MemberView.h"
#import "ExplainViewController.h"
#import "IntegralDetailViewController.h"

@interface MemberViewController ()

@end

@implementation MemberViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"会员中心";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    MemberView *memberView = [[MemberView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64-49)];
    memberView.pricilegeBlock = ^(NSInteger index){
        ExplainViewController *explainVC = [[ExplainViewController alloc]init];
        explainVC.index = index;
        [self.navigationController pushViewController:explainVC animated:YES];
    };
    memberView.gesBlock = ^(TapGesture tapGesture){
        if (tapGesture == integralTap) {
            IntegralDetailViewController *integralVC = [[IntegralDetailViewController alloc]init];
            [self.navigationController pushViewController:integralVC animated:YES];
        }else{
            ExplainViewController *explainVC = [[ExplainViewController alloc]init];
            [self.navigationController pushViewController:explainVC animated:YES];
        }
    };
    [self.view addSubview:memberView];
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
