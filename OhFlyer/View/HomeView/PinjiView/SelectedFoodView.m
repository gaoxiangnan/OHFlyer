//
//  SelectedFoodView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/17.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "SelectedFoodView.h"
#import "MD_OrderDetailCell.h"
#import "BottomShadowView.h"
#import "FTSaleProduct.h"
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))


@interface SelectedFoodView ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *_passStr;
}
@property (nonatomic, strong) NSArray *foodArr;
@property (nonatomic, strong) UITableView *foodTable;
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) UILabel *headerLb;

@property (nonatomic, strong) BottomShadowView *sureView;
@property (nonatomic, strong) UIButton *changeBtn;
@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) UILabel *sectionLb;

@property (nonatomic, strong)NSMutableArray *chineseFoodArr;
@property (nonatomic, strong)NSMutableArray *westernFoodArr;
@property (nonatomic, strong)NSMutableArray *foodTypeArr;



@property (nonatomic, strong)NSArray *tableArr;
@end

@implementation SelectedFoodView
- (instancetype)initWithFrame:(CGRect)frame andData:(NSArray *)foodArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kFT_buttonBgColor;
        self.foodArr = foodArr;
        self.chineseFoodArr = [[NSMutableArray alloc]initWithCapacity:0];
        self.westernFoodArr = [[NSMutableArray alloc]initWithCapacity:0];
        
        [self initWithSubViews];
        [self checkOutData];
        [self sureInitString];
        
    }
    return self;
}
- (void)checkOutData
{
    
    
    
    for (FTSaleProduct *model in self.foodArr) {
        if ([model.mealNum intValue] > 0) {
            if ([model.mealType isEqualToString:@"1"]) {
                [self.chineseFoodArr addObject:model];
            }else{
                [self.westernFoodArr addObject:model];
            }
        }
        
    }
    
    
    self.tableArr = [[NSArray alloc]initWithObjects:[self changeData:self.chineseFoodArr],[self changeData:self.westernFoodArr], nil];
    
    [_foodTable reloadData];
    
}


- (NSMutableArray *)changeData:(NSMutableArray *)muArr
{
    self.foodTypeArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict removeAllObjects];
    
    for (FTSaleProduct *model in muArr) {
        [dict setObject:model.mealDType forKey:model.mealDType];
    }
    NSArray *foodTypeArr = [dict allKeys]; //去重
    
    for (int i = 0; i < foodTypeArr.count; i++) {
        NSMutableArray *dishArr = [[NSMutableArray alloc] initWithCapacity:0];
        KeysModel *keyModel = [[KeysModel alloc]init];
        for (FTSaleProduct *model in muArr) {
            if ([model.mealDType isEqualToString:foodTypeArr[i]]) {
                [dishArr addObject:model];
                keyModel.typeKeys = model.mealType;
            }
        }
        keyModel.keys = foodTypeArr[i];
        keyModel.proArr = dishArr;
        
        [self.foodTypeArr addObject:keyModel];
    }
    
    return self.foodTypeArr;
}

 - (void)initWithSubViews
{
    [self addSubview:self.foodTable];
    [_foodTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.equalTo(self);
        make.height.equalTo(@(self.frame.size.height - kScaleFrom_iPhone5s_Desgin(40)));
    }];
    
    [self addSubview:self.sureView];
    [_sureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(-40));
        make.width.equalTo(self);
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(40)));
    }];
    [_sureView addSubview:self.changeBtn];
    [_changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_sureView).offset(kScaleFrom_iPhone5s_Desgin(30));
        make.top.equalTo(_sureView);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/2));
        make.height.equalTo(_sureView);
    }];
    [_sureView addSubview:self.sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_sureView.mas_right);
        make.top.equalTo(_sureView);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(110)));
        make.height.equalTo(_sureView);
    }];
}

- (UIView *)sureView
{
    if (!_sureView) {
        _sureView = [BottomShadowView new];
        _sureView.backgroundColor = [UIColor whiteColor];
    }
    return _sureView;
}
- (UIButton *)changeBtn{
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeBtn.tag = 500001;
        _changeBtn.backgroundColor = [UIColor whiteColor];
        [_changeBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _changeBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_changeBtn setTitle:@"修改餐食" forState:UIControlStateNormal];
        [_changeBtn addTarget:self action:@selector(onTipClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}
- (UIButton *)sureBtn
{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.tag = 500002;
        _sureBtn.backgroundColor = [UIColor orangeColor];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(onTipClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
- (UITableView *)foodTable
{
    if (!_foodTable) {
        _foodTable = [[UITableView alloc]init];
        _foodTable.delegate = self;
        _foodTable.dataSource = self;
        _foodTable.backgroundColor = kFT_buttonBgColor;
        _foodTable.tableFooterView.userInteractionEnabled = YES;
        _foodTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _foodTable;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kScaleFrom_iPhone5s_Desgin(36);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kScaleFrom_iPhone5s_Desgin(36))];
    headView.backgroundColor = kFT_buttonBgColor;
        
    UIImageView *showImage = [UIImageView new];
    showImage.image = [UIImage imageNamed:@"md_cection_line"];
    [headView addSubview:showImage];
    [showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headView);
    }];
    
    _sectionLb = [UILabel new];
    if (section == 0) {
        _sectionLb.text = @"中  餐";
    }else{
        _sectionLb.text = @"西  餐";
    }
    
    _sectionLb.textColor = [UIColor orangeColor];
    _sectionLb.textAlignment = NSTextAlignmentCenter;
    _sectionLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [headView addSubview:_sectionLb];
    [_sectionLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headView);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/4));
    }];
    return headView;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.tableArr[section];//断
    return array.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MD_OrderDetailCell cellHeight:[self.tableArr[indexPath.section] objectAtIndex:indexPath.row]];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifliers = @"MD_OrderDetailCell";
    MD_OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifliers];
    if (!cell) {
        cell = [[MD_OrderDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifliers];
    }
    [cell translateData:[self.tableArr[indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}
- (void)sureInitString
{
    NSMutableArray *addArr = [[NSMutableArray alloc]initWithCapacity:0];
    for (FTSaleProduct *model in self.foodArr) {
        if (model.mealNum > 0) {
            [addArr addObject:[NSString stringWithFormat:@"%@|%@",model.mealId,model.mealNum]];
        }
    }
    
    _passStr = [addArr componentsJoinedByString:@";"];
}
- (void)onTipClickBtn:(UIButton *)sender
{
    if (sender.tag == 500001) {
        if (_changeBlock) {
            _changeBlock();
        }
    }else{
        if (_sureBlock) {
            _sureBlock(_passStr);
        }
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
