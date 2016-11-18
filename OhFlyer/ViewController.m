//
//  ViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/4.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ViewController.h"
#import "OHNetwork.h"
#import "UIImage+Color.h"
#import "OHNetWorkManage.h"
#import "HomeView.h"

#import "PinjiViewController.h"
#import "BaojiViewController.h"
#import "ActivityViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor purpleColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:246.0 / 255.0 green:246.0 / 255.0 blue:246.0 / 255.0 alpha:0.95]] forBarMetrics:UIBarMetricsDefault];
//    [self setNavigationBarLineIsHidden:YES];
//    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.hidden = YES;
    
    
    HomeView *homeView = [[HomeView alloc]initWithFrame:self.view.frame];
    homeView.tabbarHeight = self.tabBarController.tabBar.mj_h;
    homeView.activityBlock = ^(){
        ActivityViewController *activityVC = [[ActivityViewController alloc]init];
        [self.navigationController pushViewController:activityVC animated:YES];
    };
    homeView.airBlock = ^(AirPlane airPlane){
        if (airPlane == Pinji) {
            self.hidesBottomBarWhenPushed = YES;
            PinjiViewController *pinjiVC = [[PinjiViewController alloc]init];
            [self.navigationController pushViewController:pinjiVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }else{
            self.hidesBottomBarWhenPushed = YES;
            BaojiViewController *baojiVC = [[BaojiViewController alloc]init];
            [self.navigationController pushViewController:baojiVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
    };
    [self.view addSubview:homeView];
    
//    [[OHNetWorkManage sharedManager] requestWithParams:@{@"id":@"420984198704207896"} dataWithPath:@"idservice/id" networkMethod:Get andBlock:^(id data, NSError *error) {
//        NSLog(@"%@",data);
//    }];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"---=-=-=-=---%@",self.tabBarController.view.mas_height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
