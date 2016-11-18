//
//  FoodSelectView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/12.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "FoodSelectView.h"
#import "HMSegmentedControl.h"
#import "UIView+DrawLine.h"
#import "BottomShadowView.h"
#import "FoodSelectCell.h"
#import "MenuSelectCell.h"
#import "UIView+Common.h"
#import "RecommendFoodViewController.h"
#import "KeysModel.h"

#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)

@interface FoodSelectView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _indexRow;
    NSMutableArray *_sumArr;
}
@property (nonatomic, assign) FoodSelectType foodType;

@property (nonatomic, strong)FTSaleProduct *model;
@property (nonatomic, assign)NSInteger passengerCount;
@property (nonatomic, strong)NSMutableArray *chineseFoodArr;
@property (nonatomic, strong)NSMutableArray *westernFoodArr;
@property (nonatomic, strong)NSMutableArray *foodTypeArr;
@property (nonatomic, strong)NSMutableArray *foodArr;
@property (nonatomic, strong)NSArray *foodDetailArr;


@property (nonatomic, strong) HMSegmentedControl *mySegmentControl;
@property (nonatomic, strong) BottomShadowView *stateView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *recommendBtn;
@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) UITableView *foodTableView;
@property (nonatomic, strong) UITableView *menuTableView;

@property (nonatomic, strong) NSString *numFoodStr;
@property (nonatomic, strong) NSDictionary *typeCHDic;
@property (nonatomic, strong) NSDictionary *typeWTDic;
@property (nonatomic, strong) NSString *mealDTypeString;



@end

@implementation FoodSelectView
- (instancetype)initWithFrame:(CGRect)frame andProductModel:(FTSaleProduct *)model andPassengerCount:(NSInteger)count
{
    self = [super initWithFrame:frame];
    if (self) {
        self.passengerCount = count;
        self.chineseFoodArr = [[NSMutableArray alloc]initWithCapacity:0];
        self.westernFoodArr = [[NSMutableArray alloc]initWithCapacity:0];
//        self.foodDetailArr = [[NSMut/bleArray alloc]initWithCapacity:0];
        self.foodTypeArr = [[NSMutableArray alloc]initWithCapacity:0];
        _sumArr = [[NSMutableArray alloc]initWithCapacity:0];
        self.foodType = ChineseFood;
        self.model = model;
        self.numFoodStr = @"0";
        _indexRow = 0;
        self.typeCHDic = [[NSDictionary alloc]init];
        self.typeWTDic = [[NSDictionary alloc]init];
        [self selectFoodData];
        [self initWithSubViews];
    }
    return self;
}
- (void)selectFoodData //区分数据 中餐放到中餐的数组中，西餐放到西餐是数组中
{
    NSArray *foodArr = self.model.mealData;
    for (FTSaleProduct *model in foodArr) {
        model.mealNum = @"0";
        if ([model.mealType isEqualToString:@"1"]) {
            [self.chineseFoodArr addObject:model];
        }else{
            [self.westernFoodArr addObject:model];
        }
    }
    self.foodArr = self.chineseFoodArr;//默认中餐
    
    
    [self refreshInitialize];
}

- (void)initWithSubViews
{
    [self addSubview:self.mySegmentControl];
    
    [self addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_mySegmentControl.mas_bottom);
        make.width.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
    [self addSubview:self.stateView];
    [_stateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(-40));
        make.width.equalTo(self);
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(40)));
    }];
    [_stateView addSubview:self.recommendBtn];
    [_recommendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_stateView);
        make.width.equalTo(@(kDeviceWidth/2));
        make.height.equalTo(_stateView);
    }];
    [_stateView addSubview:self.sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_recommendBtn.mas_right);
        make.top.equalTo(_stateView);
        make.width.equalTo(@(kDeviceWidth/2));
        make.height.equalTo(_stateView);
        
    }];
    [self addSubview:self.menuTableView];
    [_menuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_mySegmentControl.mas_bottom).offset(1);
        make.bottom.equalTo(_stateView.mas_top);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(70)));
    }];
    [self addSubview:self.foodTableView];
    [_foodTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_menuTableView.mas_right);
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(70)));
        make.top.equalTo(_menuTableView).offset(1);
        make.height.equalTo(_menuTableView);
    }];
}
- (HMSegmentedControl *)mySegmentControl
{
    NSArray *imageArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"zhongcan_gray"],[UIImage imageNamed:@"xican_gray"], nil];
    NSArray *imageArrSelectArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"zhongcan_light"],[UIImage imageNamed:@"xican_light"], nil];
    
    if (!_mySegmentControl) {
        _mySegmentControl = [[HMSegmentedControl alloc] initWithSectionImages:imageArr sectionSelectedImages:imageArrSelectArr titlesForSections:@[@"西餐", @"中餐"]];
        _mySegmentControl.selectedSegmentIndex = 1;
        _mySegmentControl.selectionStyle = HMSegmentedControlTypeTextImages;
        _mySegmentControl.selectedTextColor = kOrangeColor;
        _mySegmentControl.frame = CGRectMake(0, 0, kDeviceWidth, kScaleFrom_iPhone5s_Desgin(37));
        _mySegmentControl.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _mySegmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _mySegmentControl.selectionIndicatorHeight = 2.0f;
        _mySegmentControl.selectionIndicatorColor = kOrangeColor;
        _mySegmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _mySegmentControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
        _mySegmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        [self.mySegmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//        [_mySegmentControl addLineUp:NO andDown:YES];
        
    }
    return _mySegmentControl;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}
- (BottomShadowView *)stateView{
    if (!_stateView) {
        _stateView = [BottomShadowView new];
        _stateView.backgroundColor = [UIColor whiteColor];
    }
    return _stateView;
}
- (UIButton *)recommendBtn{
    if (!_recommendBtn) {
        _recommendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _recommendBtn.tag = 40001;
        _recommendBtn.backgroundColor = [UIColor whiteColor];
        _recommendBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_recommendBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_recommendBtn setTitle:@"一键推荐" forState:UIControlStateNormal];
        [_recommendBtn addTarget:self action:@selector(onChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recommendBtn;
}
- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.tag = 40002;
        _sureBtn.backgroundColor = [UIColor orangeColor];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(onChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

- (UITableView *)foodTableView{
    if (!_foodTableView) {
        _foodTableView = [[UITableView alloc]init];
        _foodTableView.delegate = self;
        _foodTableView.dataSource = self;
        _foodTableView.tableFooterView.userInteractionEnabled = YES;
        _foodTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _foodTableView;
}
- (UITableView *)menuTableView{
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc]init];
        _menuTableView.backgroundColor = kFT_buttonBgColor;
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.tableFooterView.userInteractionEnabled = YES;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _menuTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _menuTableView) {
        return self.foodTypeArr.count;
    }else{
        return self.foodDetailArr.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _menuTableView) {
        return 70;
    }else{
        return 93;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"MenuSelectCell";
    MenuSelectCell *cell1 = [tableView dequeueReusableCellWithIdentifier:identify];
    
    static NSString *identiflys = @"FoodSelectCell";
    FoodSelectCell *cell2 = [tableView dequeueReusableCellWithIdentifier:identiflys];
    if (tableView == _menuTableView) {
        
        if (!cell1) {
            cell1 = [[MenuSelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        
        
        
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        [cell1 translateDataType:self.foodType passengerCount:self.passengerCount  andData:self.foodTypeArr[indexPath.row]];
        
        NSIndexPath *first = [NSIndexPath indexPathForRow:_indexRow inSection:0];
        [_menuTableView selectRowAtIndexPath:first animated:YES scrollPosition:UITableViewScrollPositionNone];
        return cell1;
    }else{
        if (!cell2)
        {
            cell2 = [[FoodSelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiflys];
            cell2.myBlock = ^(FTSaleProduct *num){
                NSIndexPath *indexPath = [_menuTableView indexPathForSelectedRow];
                UITableViewCell *cell = [_menuTableView cellForRowAtIndexPath:indexPath];
                [cell addBadgeTip:num.mealNum withCenterPosition:CGPointMake(kScaleFrom_iPhone5s_Desgin(60), 24)];//圆圈的数字
                [[NSNotificationCenter defaultCenter]postNotificationName:@"checkOutAllLimit" object:self.model];
                [_menuTableView reloadData];                
            };
        }
        [cell2 translateData:self.foodDetailArr[indexPath.row] passengerCount:self.passengerCount mealDType:self.mealDTypeString];
        [cell2 translateAllData:self.model mealDType:self.mealDTypeString];
        
        return cell2;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _menuTableView) {
        KeysModel *keys = self.foodTypeArr[indexPath.row];
        self.foodDetailArr = keys.proArr;
        self.mealDTypeString = keys.keys;
        _indexRow = indexPath.row;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"checkOutAllLimit" object:self.model];
        [_foodTableView reloadData];
    }
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
    _indexRow = 0;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"checkOutAllLimit" object:self.model];
    
    if (segmentedControl.selectedSegmentIndex == 1 ) {
    
        self.foodType = ChineseFood;
        self.foodArr = self.chineseFoodArr;
    }else{
        self.foodType = WesternFood;
        self.foodArr = self.westernFoodArr;
    }
    [self refreshInitialize];
}
- (void)refreshInitialize//当餐食类型选择后 加载具体餐食
{
    //给menuTableView 数据
    [self.foodTypeArr removeAllObjects];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (FTSaleProduct *model in self.foodArr) {
        [dict setObject:model.mealDType forKey:model.mealDType];
    }
    NSArray *foodTypeArr = [dict allKeys];
    
    for (int i = 0; i < foodTypeArr.count; i++) {
        NSMutableArray *dishArr = [[NSMutableArray alloc] initWithCapacity:0];
        KeysModel *keyModel = [[KeysModel alloc]init];
        for (FTSaleProduct *model in self.foodArr) {
            if ([model.mealDType isEqualToString:foodTypeArr[i]]) {
                [dishArr addObject:model];
            }
        }
        keyModel.keys = foodTypeArr[i];
        keyModel.proArr = dishArr;
        [self.foodTypeArr addObject:keyModel];
    }
    
//给foodTableview 数据
    KeysModel *key = self.foodTypeArr[0];
    self.foodDetailArr = key.proArr;
    self.mealDTypeString = key.keys;
    
    [_menuTableView reloadData];
    [_foodTableView reloadData];
}
- (void)onChangeBtn:(UIButton *)sender
{
    if (sender.tag == 40001) {
        for (FTSaleProduct *model in self.model.mealData) {
            model.mealNum = @"0";
        }
        for (int i = 0; i < self.foodTypeArr.count; i ++) {
            KeysModel *keysModel = self.foodTypeArr[i];
            FTSaleProduct *model = keysModel.proArr[0];
            model.mealNum = [NSString stringWithFormat:@"%lu",self.passengerCount];
        }
        if (_recommendBlock) {
            _recommendBlock([NSArray arrayWithArray:self.foodArr],self.foodType);
        }
    }else{
        if (_sureBlock) {
            _sureBlock(self.model.mealData);
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
