//
//  TripCountrySelectView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/8.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TripCountrySelectView.h"
#import "BottomShadowView.h"
#import "CustomTripTableViewCell.h"
#import "CountryTableViewCell.h"
#import "CustomCityTableCell.h"

#define GAPWIDTH kScaleFrom_iPhone5s_Desgin(20)
#define BTNWIDTH kScaleFrom_iPhone5s_Desgin(62)
#define BTNHEIGHT kScaleFrom_iPhone5s_Desgin(25)
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)

@interface TripCountrySelectView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *bgStepView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *resetBtn;
@property (nonatomic, strong) UIButton *destination;
@property (nonatomic, strong) UIButton *tripReference;
@property (nonatomic, strong) UIButton *submitDemand;

@property (nonatomic, strong) UIImageView *lineOne;
@property (nonatomic, strong) UIImageView *lineTwo;


@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) UITableView *countryTableView;
@property (nonatomic, strong) UITableView *cityTableView;
@property (nonatomic, strong) UIView *lineTable;

@property (nonatomic, strong) UIButton *nextBtn;
@end

@implementation TripCountrySelectView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    
    [self addSubview:self.bgStepView];
    [_bgStepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(132));
    }];
    
    [_bgStepView addSubview:self.backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgStepView).offset(20);
        make.top.equalTo(_bgStepView).offset(28);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
    [_bgStepView addSubview:self.resetBtn];
    [_resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgStepView.mas_right).offset(-20);
        make.top.equalTo(_backBtn);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
    
    [_bgStepView addSubview:self.destination];
    [_destination mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgStepView).offset(30);
        make.top.equalTo(_bgStepView).offset(68);
        make.width.equalTo(@(35));
        make.height.equalTo(@(44));
    }];
    
    [_bgStepView addSubview:self.tripReference];
    [_tripReference mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgStepView);
        make.top.equalTo(_destination);
        make.width.equalTo(@(48));
        make.height.equalTo(@(44));
    }];
    
    [_bgStepView addSubview:self.submitDemand];
    [_submitDemand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgStepView.mas_right).offset(-30);
        make.top.equalTo(_tripReference);
        make.width.equalTo(@(48));
        make.height.equalTo(@(42));
    }];
    
    [_bgStepView addSubview:self.lineOne];
    [_lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_destination.mas_right).offset(kScaleFrom_iPhone5s_Desgin(30));
        make.right.equalTo(_tripReference.mas_left).offset(kScaleFrom_iPhone5s_Desgin(-30));
        make.centerY.equalTo(_destination);
        make.height.equalTo(@(1));
    }];
    
    [_bgStepView addSubview:self.lineTwo];
    [_lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tripReference.mas_right).offset(kScaleFrom_iPhone5s_Desgin(25));
        make.right.equalTo(_submitDemand.mas_left).offset(kScaleFrom_iPhone5s_Desgin(-25));
        make.centerY.equalTo(_tripReference);
        make.height.equalTo(@(1));
    }];
    
    
    
    
    
    
    
    
    
    
    
    [self addSubview:self.menuTableView];
    [_menuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_bgStepView.mas_bottom);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(70)));
        make.bottom.equalTo(self.mas_bottom).offset(-100);
    }];
    [self addSubview:self.countryTableView];
    [_countryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_menuTableView.mas_right);
        make.top.equalTo(_menuTableView);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(115)));
        make.height.equalTo(_menuTableView);
    }];
    
    [self addSubview:self.lineTable];
    [_lineTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_countryTableView.mas_right);
        make.top.equalTo(_menuTableView);
        make.width.equalTo(@(1));
        make.height.equalTo(_countryTableView);
    }];
    
    [self addSubview:self.cityTableView];
    [_cityTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_countryTableView.mas_right).offset(1);
        make.top.equalTo(_menuTableView);
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(185)));
        make.bottom.equalTo(_menuTableView);
    }];
    
    [self addSubview:self.nextBtn];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(44);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(287)));
        make.top.equalTo(_menuTableView.mas_bottom).offset(40);
        make.height.equalTo(@(40));
    }];
    
}

- (UIView *)bgStepView
{
    if (!_bgStepView) {
        _bgStepView = [UIView new];
        _bgStepView.backgroundColor = RGBCOLOR(246, 246, 246);
    }
    return _bgStepView;
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"custom_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UIButton *)resetBtn
{
    if (!_resetBtn) {
        _resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resetBtn setTitle:@"跳过" forState:UIControlStateNormal];
        [_resetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _resetBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        [_resetBtn addTarget:self action:@selector(onResetBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resetBtn;
}
- (UIButton *)destination
{
    if (!_destination) {
        _destination = [UIButton buttonWithType:UIButtonTypeCustom];
        [_destination setBackgroundImage:[UIImage imageNamed:@"custom_address"] forState:UIControlStateNormal];
    }
    return _destination;
}
- (UIButton *)tripReference
{
    if (!_tripReference) {
        _tripReference = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tripReference setBackgroundImage:[UIImage imageNamed:@"custom_trip_nomal"] forState:UIControlStateNormal];
    }
    return _tripReference;
}
- (UIButton *)submitDemand
{
    if (!_submitDemand) {
        _submitDemand = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitDemand setBackgroundImage:[UIImage imageNamed:@"custom_submit_nomal"] forState:UIControlStateNormal];
    }
    return _submitDemand;
}
- (UIImageView *)lineOne
{
    if (!_lineOne) {
        _lineOne = [UIImageView new];
        _lineOne.image = [UIImage imageNamed:@"custom_xuline"];
    }
    return _lineOne;
}
- (UIImageView *)lineTwo
{
    if (!_lineTwo) {
        _lineTwo = [UIImageView new];
        _lineTwo.image = [UIImage imageNamed:@"custom_xuline"];
    }
    return _lineTwo;
}


- (void)onBackBtn
{
    if (_backBlock) {
        _backBlock();
    }
}
- (void)onResetBtn
{
    
}

- (UITableView *)menuTableView
{
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] init];
        _menuTableView.backgroundColor = kFT_buttonBgColor;
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _menuTableView;
}

- (UITableView *)countryTableView
{
    if (!_countryTableView) {
        _countryTableView = [[UITableView alloc] init];
        _countryTableView.backgroundColor = [UIColor whiteColor];
        _countryTableView.delegate = self;
        _countryTableView.dataSource = self;
        _countryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _countryTableView;
}
- (UITableView *)cityTableView
{
    if (!_cityTableView) {
        _cityTableView = [[UITableView alloc] init];
        _cityTableView.backgroundColor = [UIColor whiteColor];
        _cityTableView.delegate = self;
        _cityTableView.dataSource = self;
        _cityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _cityTableView;
}
- (UIView *)lineTable
{
    if (!_lineTable) {
        _lineTable = [UIView new];
        _lineTable.backgroundColor = RGBACOLOR(246, 246, 246, 0.5);
    }
    return _lineTable;
}
- (UIButton *)nextBtn
{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.layer.cornerRadius = 20;
        _nextBtn.backgroundColor = RGBCOLOR(233, 71, 9);
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(attentionsAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _menuTableView) {
        return 50;
    }else{
        return 40;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"CustomTripTableViewCell";
    static NSString *identifier = @"CountryTableViewCell";
    static NSString *identifiery = @"CustomCityTableCell";
    if (tableView == _menuTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell=[[CustomTripTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        return cell;
    }else if (tableView == _countryTableView){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[CountryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiery];
        if (!cell) {
            cell=[[CustomCityTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiery];
        }
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _menuTableView) {
        
    }else if (tableView == _countryTableView){
        
    }else{
        
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        
//        CustomCityTableCell *cell= (CustomCityTableCell*)[tableView cellForRowAtIndexPath:indexPath];
//        
//        NSUInteger row = [indexPath row];
//        NSMutableDictionary *dic = [contacts objectAtIndex:row];
//        if ([[dic objectForKey:@"checked"] isEqualToString:@"NO"]) {
//            [dic setObject:@"YES" forKey:@"checked"];
//            [cell setChecked:YES];
//        }else{
//            [dic setObject:@"NO" forKey:@"checked"];
//            [cell setChecked:NO];
//        }
        
//        CustomCityTableCell *cell = (CustomCityTableCell *)[tableView cellForRowAtIndexPath:indexPath];
//        cell.nameLb.textColor = RGBCOLOR(233, 71, 9);
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _menuTableView) {
        
    }else if (tableView == _countryTableView){
        
    }else{
        CustomCityTableCell *cell = (CustomCityTableCell *)[tableView cellForRowAtIndexPath:indexPath];
        cell.nameLb.textColor = RGBCOLOR(0, 0, 0);
    }
}
- (void)attentionsAction
{
    if (_nextBlock) {
        _nextBlock();
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
