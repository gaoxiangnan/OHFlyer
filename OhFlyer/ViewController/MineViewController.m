//
//  MineViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/16.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MineViewController.h"
#import "MemberViewController.h"
#import "ServiceCenterViewController.h"
#import "MineView.h"
#import "SettingViewController.h"
#import "CTInfoViewController.h"
#import "MessageViewController.h"
#import "CollectViewController.h"
#import "MineOrderViewController.h"
#import "OHLoginViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    __weak MineViewController *mineVC = self;
    MineView *mineView = [[MineView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-49)];
    mineView.titleBlock = ^(NSInteger titleIndex){
        if (titleIndex == 3000) {
            MineOrderViewController *orderVC = [[MineOrderViewController alloc]init];
            [mineVC.navigationController pushViewController:orderVC animated:YES];
        }else if (titleIndex == 3001){
            CollectViewController *collectVC =[[CollectViewController alloc]init];
            [mineVC.navigationController pushViewController:collectVC animated:YES];
        }else{
            MessageViewController *messageVC = [[MessageViewController alloc]init];
            [mineVC.navigationController pushViewController:messageVC animated:YES];
        }
    };
    mineView.centerBlock = ^(NSInteger index){
        if (index == 0) {
            CTInfoViewController *infoVC = [[CTInfoViewController alloc]init];
            [mineVC.navigationController pushViewController:infoVC animated:YES];
        }else if (index == 1){
            MemberViewController *memberVC = [[MemberViewController alloc]init];
            [mineVC.navigationController pushViewController:memberVC animated:YES];
        }else if (index == 2){
            ServiceCenterViewController *serviceVC = [[ServiceCenterViewController alloc]init];
            [mineVC.navigationController pushViewController:serviceVC animated:YES];
        }else if (index == 3){
            SettingViewController *settingVC = [[SettingViewController alloc]init];
            [mineVC.navigationController pushViewController:settingVC animated:YES];
        }
    };
    mineView.loginBlock = ^(){
        OHLoginViewController *loginVC = [[OHLoginViewController alloc]init];
        [mineVC presentViewController:loginVC animated:YES completion:^{
            
        }];
    };
    [self.view addSubview:mineView];
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
