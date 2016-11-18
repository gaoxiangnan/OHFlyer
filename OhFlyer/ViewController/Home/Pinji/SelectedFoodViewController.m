//
//  SelectedFoodViewController.m
//  FlyShare
//
//  Created by 向楠 on 16/5/17.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "SelectedFoodViewController.h"
#import "SelectedFoodView.h"
#import "ChooseFoodViewController.h"
#import "PinjiOrderViewController.h"

@interface SelectedFoodViewController ()
@property (nonatomic, strong) SelectedFoodView *selectedFoodView;
@end

@implementation SelectedFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"已选餐食";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    [self rightWithText:@"添加备注" action:@selector(addMarkBtn)];
    [self initWithSubViews];
}
- (void)initWithSubViews
{
    [self.view addSubview:self.selectedFoodView];
}

- (SelectedFoodView *)selectedFoodView
{
    SelectedFoodViewController *selectedVC = self;
    if (!_selectedFoodView) {   
        _selectedFoodView = [[SelectedFoodView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64) andData:self.foodArr];
        
        _selectedFoodView.sureBlock = ^(NSString *passStr){
            for (UIViewController *temp in selectedVC.navigationController.viewControllers) {
                if ([temp isKindOfClass:[PinjiOrderViewController class]]) {
                    [selectedVC.navigationController popToViewController:temp animated:YES];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"foodParams" object:passStr];
                }
            }
        };
        _selectedFoodView.changeBlock = ^(){
            
            for (UIViewController *temp in selectedVC.navigationController.viewControllers) {
                if ([temp isKindOfClass:[ChooseFoodViewController class]]) {
                    [selectedVC.navigationController popToViewController:temp animated:YES];
                }
            }
            
            
        };
    }
    return _selectedFoodView;
}
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)addMarkBtn
{
    
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
