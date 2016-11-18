
//
//  ChooseFoodViewController.m
//  FlyShare
//
//  Created by zzxcc on 16/1/25.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "ChooseFoodViewController.h"
#import "FoodSelectView.h"
#import "RecommendFoodViewController.h"
#import "SelectedFoodViewController.h"

@interface ChooseFoodViewController ()
@property (nonatomic, strong) FoodSelectView *foodSelectView;
@property (nonatomic, strong) FTSaleProduct *productModel;
@property (nonatomic, assign) NSInteger passengerCount;

@end

@implementation ChooseFoodViewController

- (instancetype)initWithProductModel:(FTSaleProduct *)productModel andPassengerCount:(NSInteger)count
{
    self = [super init];
    if (self) {
        self.productModel = productModel;
        self.passengerCount = count;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    for (FTSaleProduct *model in self.productModel.mealData) {
        model.mealNum = @"0";
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择餐食";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];

    [self initWithSubViews];
}

#pragma mark -UI
- (void)initWithSubViews
{
    [self.view addSubview:self.foodSelectView];
}

- (FoodSelectView *)foodSelectView
{
    __weak ChooseFoodViewController *chooseVC = self;
    if (!_foodSelectView) {
        _foodSelectView = [[FoodSelectView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)  andProductModel:self.productModel andPassengerCount:self.passengerCount];
        
        _foodSelectView.recommendBlock = ^(NSArray *foodArr,FoodSelectType type){
            RecommendFoodViewController *recommendVC = [[RecommendFoodViewController alloc]initWithFoodType:type andDataArr:foodArr];
            [chooseVC.navigationController pushViewController:recommendVC animated:NO];
        };
        _foodSelectView.sureBlock = ^(NSArray *allFoodArr){
            SelectedFoodViewController *selectedVC = [[SelectedFoodViewController alloc]init];
            selectedVC.foodArr = allFoodArr;
            [chooseVC.navigationController pushViewController:selectedVC animated:NO];
        };
    }
    return _foodSelectView;
}
#pragma mark -delegate
- (void)sureActionWithParams:(NSString *)str
{
//    [self back];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushActionWithSelectIndex:(NSInteger)index andText:(NSString *)str
{
    
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
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
