//
//  IntegralDetailViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "IntegralDetailViewController.h"
#import "IntegralDetailView.h"
#import "ShowIntegralViewController.h"
#import "AppDelegate.h"

@interface IntegralDetailViewController ()

@end

@implementation IntegralDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    __weak IntegralDetailViewController *VC = self;
    IntegralDetailView *integralView = [[IntegralDetailView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    integralView.explainBlock = ^(){
        ShowIntegralViewController *controller = [[ShowIntegralViewController alloc]init];
        controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            controller.providesPresentationContextTransitionStyle = YES;
            controller.definesPresentationContext = YES;
            controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [VC presentViewController:controller animated:YES completion:nil];
        } else {
            VC.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
            [VC presentViewController:controller animated:NO completion:nil];
            VC.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        
    };
    integralView.myBlock = ^(){
        VC.navigationController.navigationBar.hidden = NO;
        [VC.navigationController popViewControllerAnimated:YES];
    };
    [self.view addSubview:integralView];
    // Do any additional setup after loading the view from its nib.
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
