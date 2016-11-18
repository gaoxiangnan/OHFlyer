//
//  CardTypeViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CardTypeViewController.h"
#import "CardTypeView.h"

@interface CardTypeViewController ()<CardTypeViewDelegate>
@property (nonatomic, strong) CardTypeView *cartView;

@end

@implementation CardTypeViewController

#pragma mark -lifeCycle
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"证件类型";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
//    [self rightWithText:@"确定" action:@selector(sureAction)];
    [self InitWithSubViews];
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.cartView];
}

- (CardTypeView *)cartView
{
    if (!_cartView) {
        _cartView = [[CardTypeView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64) selectType:self.selectType];
        _cartView.delegate = self;
    }
    return _cartView;
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)sureAction
{

}

#pragma mark -delegate
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectType = indexPath.row;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeView" object:[NSNumber numberWithInteger:self.selectType]];
    [self.navigationController popViewControllerAnimated:YES];


    
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
