
//
//  RecommendFoodView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/17.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "RecommendFoodView.h"
#import "RecommendCell.h"
#import "BottomShadowView.h"
#import "FTSaleProduct.h"
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
@interface RecommendFoodView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *recomFoodTable;
@property (nonatomic, strong) NSMutableArray *foodNumArr;
@property (nonatomic, strong) NSArray *foodArr;
@property (nonatomic, assign) FoodSelectType type;
@property (nonatomic, strong) BottomShadowView *sureView;
@property (nonatomic, strong) UIButton *sureBtn;

@end

@implementation RecommendFoodView

- (instancetype)initWithFrame:(CGRect)frame FoodType:(FoodSelectType)type andData:(NSArray *)foodArr;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kFT_buttonBgColor;
        self.foodNumArr = [[NSMutableArray alloc]initWithCapacity:0];
        self.foodArr = foodArr;
        self.type = type;
        [self updataFoodData];
        [self initWithSubViews];
    }
    return self;
}
- (void)updataFoodData
{
    for (int i = 0; i < self.foodArr.count; i++) {
        FTSaleProduct *model = self.foodArr[i];
        if ([model.mealNum intValue] > 0) {
            [self.foodNumArr addObject:model];
        }
    }
    [_recomFoodTable reloadData];
}
- (void)initWithSubViews
{
    [self addSubview:self.sureView];
    [_sureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(-40));
        make.width.equalTo(self);
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(40)));
    }];
    [_sureView addSubview:self.sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_sureView.mas_right);
        make.top.equalTo(_sureView);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(110)));
        make.height.equalTo(_sureView);
    }];
    
    [self addSubview:self.recomFoodTable];
    [_recomFoodTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@(self.frame.size.height - kScaleFrom_iPhone5s_Desgin(40)));
    }];
}
- (UITableView *)recomFoodTable{
    if (!_recomFoodTable) {
        _recomFoodTable = [[UITableView alloc]init];
        _recomFoodTable.backgroundColor = kFT_buttonBgColor;
        _recomFoodTable.delegate = self;
        _recomFoodTable.dataSource = self;
        _recomFoodTable.tableFooterView.userInteractionEnabled = YES;
        _recomFoodTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _recomFoodTable;
}
- (UIView *)sureView
{
    if (!_sureView) {
        _sureView = [BottomShadowView new];
        _sureView.backgroundColor = [UIColor whiteColor];
    }
    return _sureView;
}
- (UIButton *)sureBtn
{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.backgroundColor = [UIColor orangeColor];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_sureBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(onTipClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodNumArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kScaleFrom_iPhone5s_Desgin(90);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"RecommendCell";
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[RecommendCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    [cell translateFoodType:self.type Data:self.foodNumArr[indexPath.row]];
    return cell;
}
- (void)onTipClickBtn:(UIButton *)sender
{
    if (_pushNextViewBlock) {
        (_pushNextViewBlock)([NSArray arrayWithArray:self.foodNumArr]);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
