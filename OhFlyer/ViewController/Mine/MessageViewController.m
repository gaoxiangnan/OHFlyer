//
//  MessageViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/16.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageView.h"
#import "MessageEditViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"我的消息";
    self.navigationController.navigationBar.hidden = NO;
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(onBackBtn)];
    [self rightWithText:@"编辑" textColor:[UIColor blackColor] action:@selector(onChangeBtn)];
    
    MessageView *messageView = [[MessageView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64)];
    [self.view addSubview:messageView];
    // Do any additional setup after loading the view from its nib.
}
- (void)onBackBtn
{
    [self back];
}
- (void)onChangeBtn
{
    MessageEditViewController *vc = [[MessageEditViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
