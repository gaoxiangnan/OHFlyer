//
//  RecommendFoodViewController.m
//  FlyShare
//
//  Created by 向楠 on 16/5/13.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "RecommendFoodViewController.h"
#import "SelectedFoodViewController.h"
#import "RecommendFoodView.h"

@interface RecommendFoodViewController ()

@property (nonatomic, strong) RecommendFoodView *recommendView;
@property (nonatomic, strong) NSArray *foodArr;
@property (nonatomic, assign) FoodSelectType type;
@end

@implementation RecommendFoodViewController
- (instancetype)initWithFoodType:(FoodSelectType)type andDataArr:(NSArray *)foodArr
{
    if (self) {
        self.foodArr = foodArr;
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一件推荐";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    
    [self initWithSubViews];
    // Do any additional setup after loading the view.
}
- (void)initWithSubViews
{
    [self.view addSubview:self.recommendView];
}
- (RecommendFoodView *)recommendView
{
    __weak RecommendFoodViewController *recommendVC = self;
    if (!_recommendView) {
        _recommendView = [[RecommendFoodView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64) FoodType:self.type andData:self.foodArr];;
        _recommendView.pushNextViewBlock = ^(NSArray *foodNumArr){
            SelectedFoodViewController *selectedVC = [[SelectedFoodViewController alloc]init];
            selectedVC.foodArr = foodNumArr;
            [recommendVC.navigationController pushViewController:selectedVC animated:NO];
        };
    }
    return _recommendView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:NO];
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
