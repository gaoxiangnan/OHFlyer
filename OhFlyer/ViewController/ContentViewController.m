//
//  ContentViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/16.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ContentViewController.h"
#import "CustomTripViewController.h"
#import "ProductDetailViewController.h"
#import "ContentView.h"
#import "TextViewController.h"
#import "TravelProductViewController.h"
@interface ContentViewController ()

@end

@implementation ContentViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    ContentView *contentView = [[ContentView alloc]initWithFrame:self.view.frame];
    contentView.myBlock = ^(){
        CustomTripViewController *cTripVC = [[CustomTripViewController alloc]init];
        [self.navigationController pushViewController:cTripVC animated:NO];
    };
    contentView.findBlock = ^(){
        CATransition *transition = [CATransition animation];
        transition.duration = 0.4f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromTop;
        transition.delegate = self;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        TravelProductViewController *travelVC = [[TravelProductViewController alloc]init];
        [self.navigationController pushViewController:travelVC animated:NO];
    };
    [self.view addSubview:contentView];
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
