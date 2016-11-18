//
//  ExplainViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ExplainViewController.h"
#import "ExplainView.h"

@interface ExplainViewController ()
@property (nonatomic, strong) ExplainView *explainView;
@end

@implementation ExplainViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath * selIndex = [NSIndexPath indexPathForRow:self.index inSection:0];
    [_explainView.contentTab selectRowAtIndexPath:selIndex animated:YES scrollPosition:UITableViewScrollPositionTop];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    _explainView = [[ExplainView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    __weak ExplainViewController *vc = self;
    _explainView.myBlock = ^(){
        vc.navigationController.navigationBar.hidden = NO;
        [vc.navigationController popViewControllerAnimated:YES];
    };
    [self.view addSubview:_explainView];
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
