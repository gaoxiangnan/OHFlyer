//
//  RemarkViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/24.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "RemarkViewController.h"

@interface RemarkViewController ()<UITextViewDelegate>

@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加备注";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(onBackClick)];
    [self rightWithText:@"确定" action:@selector(onSureClieck)];
    
    UITextView *remark = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, kDeviceWidth, kDeviceHeight-64)];
    remark.delegate = self;
    [self.view addSubview:remark];
    // Do any additional setup after loading the view.
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:REMARKCONTENT object:textView.text];
    return YES;
}
- (void)onBackClick
{
    [self back];
}
- (void)onSureClieck
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
