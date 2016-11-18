//
//  JourneyReferView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/8.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "JourneyReferView.h"
#import "ThemeCollectionViewCell.h"
#import "UIView+DrawLine.h"
#import "NumSelectView.h"
#import "UIView+RGSize.h"
typedef enum {
    selectDatePick = 0,
    selectNumPick,
}SelectPicker;
@interface JourneyReferView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic, strong) UIView *bgStepView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *resetBtn;
@property (nonatomic, strong) UIButton *destination;
@property (nonatomic, strong) UIButton *tripReference;
@property (nonatomic, strong) UIButton *submitDemand;

@property (nonatomic, strong) UIImageView *lineOne;
@property (nonatomic, strong) UIImageView *lineTwo;







@property (nonatomic, assign) SelectPicker selectPicker;

@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIView *bgThemeView;
@property (nonatomic, strong) UILabel *showThemeLb;
@property (nonatomic, strong) UIView *themeLine;
@property (strong, nonatomic) UICollectionView *collectionView;

@property (nonatomic, strong) UIView *dateView;
@property (nonatomic, strong) UILabel *showDateLb;
@property (nonatomic, strong) UILabel *dateLb;
@property (nonatomic, strong) UIImageView *dateImg;

@property (nonatomic, strong) UIView *cityView;
@property (nonatomic, strong) UILabel *showCityLb;
@property (nonatomic, strong) UILabel *startCityLb;
@property (nonatomic, strong) UIImageView *arrowImg;

@property (nonatomic, strong) UIView *daysView;
@property (nonatomic, strong) UILabel *showDaysLb;
@property (nonatomic, strong) UIView *daysLine;
@property (nonatomic, strong) NumSelectView *daysSelectView;

@property (nonatomic, strong) UIView *personView;
@property (nonatomic, strong) UIView *personLine;
@property (nonatomic, strong) UILabel *showPerson;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *showPersonLb;
@property (nonatomic, strong) UILabel *numPerson;
@property (nonatomic, strong) UILabel *showBaby;
@property (nonatomic, strong) UILabel *numBabyLb;

@property (nonatomic, strong) UIView *contentLine;

@property (nonatomic, strong) UIView *bgPickerView;

@property (nonatomic, strong) UIPickerView *cityPick;

@property (nonatomic, strong) UIView *bgCityPickerView;

@property (strong, nonatomic) UIView *maskView;

@property (nonatomic, strong) NSArray *personArr;
@property (nonatomic, strong) NSArray *shengArr;
@property (nonatomic, strong) NSArray *shiArr;
@property (nonatomic, strong) NSArray *cityArr;





@property (nonatomic, strong) UIButton *nextBtn;

//@property (nonatomic, strong) UILabel *



@end
@implementation JourneyReferView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.personArr = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
        self.shengArr = [NSArray arrayWithObjects:@"广东",@"北京", nil];
        self.shiArr = [NSArray arrayWithObjects:@"梅州",@"清远", nil];
        self.cityArr = [NSArray arrayWithObjects:@"梅县",@"海淀", nil];
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
        make.left.equalTo(_bgStepView).offset(10);
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
    
    
    
    
    
    
    
    self.maskView = [[UIView alloc] initWithFrame:kScreen_Frame];
    self.maskView.backgroundColor = [UIColor blackColor];
    self.maskView.alpha = 0;
    [self.maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideMyPicker)]];
    
    
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_bgStepView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-132));
    }];
    
    [_bgScrollView addSubview:self.bgThemeView];
    [_bgThemeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_bgScrollView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(230));
    }];
    [_bgThemeView addSubview:self.showThemeLb];
    [_showThemeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgThemeView);
        make.top.equalTo(_bgThemeView).offset(20);
    }];
    [_bgThemeView addSubview:self.themeLine];
    [_themeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_showThemeLb);
        make.top.equalTo(_showThemeLb.mas_bottom).offset(2);
        make.width.equalTo(@(30));
        make.height.equalTo(@(1));
    }];
    
    [_bgThemeView addSubview:self.collectionView];
    
    [_bgScrollView addSubview:self.dateView];
    [_dateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgThemeView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_dateView addSubview:self.showDateLb];
    [_showDateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_dateView).offset(20);
        make.centerY.equalTo(_dateView);
    }];
    [_dateView addSubview:self.dateLb];
    [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showDateLb.mas_right).offset(30);
        make.top.equalTo(_showDateLb);
    }];
    [_dateView addSubview:self.dateImg];
    [_dateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_dateView.mas_right).offset(-20);
        make.centerY.equalTo(_dateView);
    }];
    
    
    
    [_bgScrollView addSubview:self.cityView];
    [_cityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_dateView.mas_bottom).offset(1);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(40)));
    }];
    [_cityView addSubview:self.showCityLb];
    [_showCityLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_cityView).offset(20);
        make.centerY.equalTo(_cityView);
    }];
    [_cityView addSubview:self.startCityLb];
    [_startCityLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showCityLb.mas_right).offset(30);
        make.top.equalTo(_showCityLb);
    }];
    [_cityView addSubview:self.arrowImg];
    [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_cityView.mas_right).offset(-20);
        make.centerY.equalTo(_cityView);
    }];
    
    
    
    [_bgScrollView addSubview:self.daysView];
    [_daysView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_cityView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(100)));
    }];
    [_daysView addSubview:self.showDaysLb];
    [_showDaysLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_daysView);
        make.top.equalTo(_daysView).offset(20);
    }];
    [_bgScrollView addSubview:self.daysLine];
    [_daysLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_showDaysLb);
        make.top.equalTo(_showDaysLb.mas_bottom).offset(2);
        make.width.equalTo(@(30));
        make.height.equalTo(@(1));
    }];
    
    [_daysView addSubview:self.daysSelectView];
    [_daysSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_daysView).offset(20);
        make.top.equalTo(_daysView).offset(50);
        make.width.equalTo(@(kDeviceWidth-40));
        make.height.equalTo(@(50));
    }];
    
    [_bgScrollView addSubview:self.personView];
    [_personView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_daysView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(100)));
    }];
    [_personView addSubview:self.showPerson];
    [_showPerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_personView);
        make.top.equalTo(_personView).offset(20);
    }];
    [_bgScrollView addSubview:self.personLine];
    [_personLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_showPerson);
        make.top.equalTo(_showPerson.mas_bottom).offset(2);
        make.width.equalTo(@(30));
        make.height.equalTo(@(1));
    }];
    [_personView addSubview:self.contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_personView).offset(20);
        make.top.equalTo(_personLine).offset(15);
        make.width.equalTo(@(kDeviceWidth-40));
        make.height.equalTo(@(66));
    }];
    [_contentView addSubview:self.showPersonLb];
    [_showPersonLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentView).offset(kScaleFrom_iPhone5s_Desgin(70));
        make.centerY.equalTo(_contentView).offset(-10);
    }];
    [_contentView addSubview:self.numPerson];
    [_numPerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_showPersonLb);
        make.top.equalTo(_showPersonLb.mas_bottom).offset(8);
    }];
    [_contentView addSubview:self.showBaby];
    [_showBaby mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_showPersonLb);
        make.right.equalTo(_contentView.mas_right).offset(-kScaleFrom_iPhone5s_Desgin(70));
    }];
    [_contentView addSubview:self.numBabyLb];
    [_numBabyLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_showBaby);
        make.top.equalTo(_numPerson);
    }];
    [_contentView addSubview:self.contentLine];
    [_contentLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_contentView);
        make.width.equalTo(@(1));
        make.height.equalTo(@(30));
    }];
    
    
    
    [_bgScrollView addSubview:self.nextBtn];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView).offset(44);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(287)));
        make.top.equalTo(_personView.mas_bottom).offset(40);
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
        [_backBtn setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UIButton *)resetBtn
{
    if (!_resetBtn) {
        _resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
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
        [_tripReference setBackgroundImage:[UIImage imageNamed:@"custom_trip_selecting"] forState:UIControlStateNormal];
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
    if (_journeyBack) {
        _journeyBack();
    }
}









- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [UIScrollView new];
        _bgScrollView.delegate = self;
        _bgScrollView.backgroundColor = [UIColor whiteColor];
        _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, 630);
    }
    return _bgScrollView;
}
- (UIView *)bgThemeView
{
    if (!_bgThemeView) {
        _bgThemeView = [UIView new];
        _bgThemeView.backgroundColor = [UIColor whiteColor];
    }
    return _bgThemeView;
}
- (UILabel *)showThemeLb
{
    if (!_showThemeLb) {
        _showThemeLb = [UILabel new];
        _showThemeLb.text = @"出行主题";
        _showThemeLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _showThemeLb;
}
- (UIView *)themeLine
{
    if (!_themeLine) {
        _themeLine = [UIView new];
        _themeLine.backgroundColor = RGBACOLOR(233, 71, 9, 1);
    }
    return _themeLine;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 30, kDeviceWidth, 210) collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        _collectionView.allowsMultipleSelection = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        //注册Cell，必须要有
        [_collectionView registerClass:[ThemeCollectionViewCell class] forCellWithReuseIdentifier:@"ThemeCollectionViewCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    }
    return _collectionView;
}
- (UIView *)dateView
{
    if (!_dateView) {
        _dateView = [UIView new];
        _dateView.backgroundColor = [UIColor whiteColor];
        [_dateView addLineUp:YES andDown:YES andColor:RGBCOLOR(239, 239, 239)];
        UITapGestureRecognizer *dateTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapDateGesture:)];
        [_dateView addGestureRecognizer:dateTap];
        
    }
    return _dateView;
}
- (UILabel *)showDateLb
{
    if (!_showDateLb) {
        _showDateLb = [UILabel new];
        _showDateLb.textColor = [UIColor blackColor];
        _showDateLb.text = @"出发日期";
        _showDateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _showDateLb;
}
- (UILabel *)dateLb
{
    if (!_dateLb) {
        _dateLb = [UILabel new];
        _dateLb.textColor = RGBCOLOR(233, 71, 9);
        _dateLb.text = @"2016-09-24";
        _dateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _dateLb;
}
- (UIImageView *)dateImg
{
    if (!_dateImg) {
        _dateImg = [UIImageView new];
        _dateImg.image = [UIImage imageNamed:@"calender_pro"];
    }
    return _dateImg;
}
- (UIView *)cityView
{
    if (!_cityView) {
        _cityView = [UIView new];
        _cityView.backgroundColor = [UIColor whiteColor];
        [_cityView addLineUp:NO andDown:YES andColor:RGBCOLOR(239, 239, 239)];
        UITapGestureRecognizer *dateTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapDateGesture:)];
        [_cityView addGestureRecognizer:dateTap];
    }
    return _cityView;
}
- (UILabel *)showCityLb
{
    if (!_showCityLb) {
        _showCityLb = [UILabel new];
        _showCityLb.textColor = [UIColor blackColor];
        _showCityLb.text = @"出发城市";
        _showCityLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _showCityLb;
}
- (UILabel *)startCityLb
{
    if (!_startCityLb) {
        _startCityLb = [UILabel new];
        _startCityLb.textColor = RGBCOLOR(233, 71, 9);
        _startCityLb.text = @"广东省 东莞市";
        _startCityLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _startCityLb;
}
- (UIImageView *)arrowImg
{
    if (!_arrowImg) {
        _arrowImg = [UIImageView new];
        _arrowImg.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _arrowImg;
}
- (UIView *)daysView
{
    if (!_daysView) {
        _daysView = [UIView new];
        [_daysView addLineUp:YES andDown:NO andColor:RGBCOLOR(239, 239, 239)];
        _daysView.backgroundColor = [UIColor whiteColor];
        
    }
    return _daysView;
}
- (UILabel *)showDaysLb
{
    if (!_showDaysLb) {
        _showDaysLb = [UILabel new];
        _showDaysLb.textColor = [UIColor blackColor];
        _showDaysLb.text = @"出行天数";
        _showDaysLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _showDaysLb;
}
- (UIView *)daysLine
{
    if (!_daysLine) {
        _daysLine = [UIView new];
        _daysLine.backgroundColor = RGBACOLOR(233, 71, 9, 1);
    }
    return _daysLine;
}
- (NumSelectView *)daysSelectView
{
    if (!_daysSelectView) {
        _daysSelectView = [[NumSelectView alloc] initWithFrame:CGRectMake(20, 60, kDeviceWidth-40, 50)];
    }
    return _daysSelectView;
}
- (UIView *)personView
{
    if (!_personView) {
        _personView = [UIView new];
        _personView.backgroundColor = [UIColor whiteColor];
    }
    return _personView;
}
- (UILabel *)showPerson
{
    if (!_showPerson) {
        _showPerson = [UILabel new];
        _showPerson.textColor = [UIColor blackColor];
        _showPerson.text = @"出行人数";
        _showPerson.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _showPerson;
}
- (UIView *)personLine
{
    if (!_personLine) {
        _personLine = [UIView new];
        _personLine.backgroundColor = RGBACOLOR(233, 71, 9, 1);
    }
    return _personLine;
}
- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = RGBCOLOR(246, 246, 246);
        
        UIButton *personBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        personBtn.frame = CGRectMake(0, 0, (kDeviceWidth-40)/2, 66);
        [personBtn addTarget:self action:@selector(onSelectPersonBtn) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:personBtn];
        
        UIButton *babyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        babyBtn.frame = CGRectMake((kDeviceWidth-40)/2, 0, (kDeviceWidth-40)/2, 66);
        [babyBtn addTarget:self action:@selector(onSelectBabyBtn) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:personBtn];
    }
    return _contentView;
}
- (UILabel *)showPersonLb
{
    if (!_showPersonLb) {
        _showPersonLb = [UILabel new];
        _showPersonLb.textColor = [UIColor blackColor];
        _showPersonLb.text = @"成人";
        _showPersonLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _showPersonLb;
}
- (UILabel *)numPerson
{
    if (!_numPerson) {
        _numPerson = [UILabel new];
        _numPerson.textColor = RGBCOLOR(233, 71, 9);
        _numPerson.text = @"3人";
        _numPerson.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _numPerson;
}
- (UIView *)contentLine
{
    if (!_contentLine) {
        _contentLine = [UIView new];
        _contentLine.backgroundColor = RGBACOLOR(0, 0, 0, 0.1);
    }
    return _contentLine;
}
- (UILabel *)showBaby
{
    if (!_showBaby) {
        _showBaby = [UILabel new];
        _showBaby.textColor = [UIColor blackColor];
        _showBaby.text = @"儿童";
        _showBaby.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _showBaby;
}
- (UILabel *)numBabyLb
{
    if (!_numBabyLb) {
        _numBabyLb = [UILabel new];
        _numBabyLb.textColor = RGBCOLOR(233, 71, 9);
        _numBabyLb.text = @"3人";
        _numBabyLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _numBabyLb;
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
- (UIView *)bgPickerView
{
    if (!_bgPickerView) {
        _bgPickerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 260)];
        _bgPickerView.backgroundColor = [UIColor whiteColor];
        
        UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 39)];
        bgV.backgroundColor = [UIColor blackColor];
        [_bgPickerView addSubview:bgV];
        
        UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [cancleBtn addTarget:self action:@selector(onCancleBtn) forControlEvents:UIControlEventTouchUpInside];
        [bgV addSubview:cancleBtn];
        [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgV).offset(20);
            make.centerY.equalTo(bgV);
            make.width.equalTo(@(50));
            make.height.equalTo(@(39));
        }];
        
        UIButton *sureCityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureCityBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureCityBtn setTitleColor:RGBCOLOR(233, 71, 9) forState:UIControlStateNormal];
        sureCityBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [sureCityBtn addTarget:self action:@selector(onSureCityBtn) forControlEvents:UIControlEventTouchUpInside];
        [bgV addSubview:sureCityBtn];
        [sureCityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgV.mas_right).offset(-20);
            make.centerY.equalTo(bgV);
            make.width.equalTo(@(50));
            make.height.equalTo(@(39));
        }];
        
        UILabel *pickerLb = [[UILabel alloc]initWithFrame:CGRectMake(kScaleFrom_iPhone5s_Desgin(80), 0, 160, 39)];
        pickerLb.text = @"选择出发城市";
        pickerLb.textAlignment = NSTextAlignmentCenter;
        pickerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        pickerLb.textColor = [UIColor whiteColor];
        [bgV addSubview:pickerLb];
        [pickerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(bgV);
        }];
        
        self.cityPick = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 218)];
        self.cityPick.delegate = self;
        self.cityPick.dataSource = self;
        self.cityPick.showsSelectionIndicator = YES;
        [_bgPickerView addSubview:self.cityPick];
        
    }
    return _bgPickerView;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ThemeCollectionViewCell";
    ThemeCollectionViewCell * cell = (ThemeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell sizeToFit];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kScaleFrom_iPhone5s_Desgin(60), kScaleFrom_iPhone5s_Desgin(80));
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeCollectionViewCell * cell = (ThemeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selectImg.hidden = NO;
    cell.nameLb.textColor = RGBCOLOR(233, 71, 9);
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    NSLog(@"item======%ld",(long)indexPath.item);
    NSLog(@"row=======%ld",(long)indexPath.row);
    NSLog(@"section===%ld",(long)indexPath.section);
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeCollectionViewCell * cell = (ThemeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selectImg.hidden = YES;
    cell.nameLb.textColor = RGBCOLOR(0, 0, 0);
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


//Picker
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.selectPicker == selectNumPick) {
        return 1;
    }else{
        return 3;
    }
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.selectPicker == selectNumPick) {
        return _personArr.count;
    }else{
        if (component == 0) {
            return self.shengArr.count;
        } else if (component == 1) {
            return self.shiArr.count;
        } else {
            return self.cityArr.count;
        }
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.selectPicker == selectNumPick) {
        return [_personArr objectAtIndex:row];
    }else{
        if (component == 0) {
            return [self.shengArr objectAtIndex:row];
        } else if (component == 1) {
            return [self.shiArr objectAtIndex:row];
        } else {
            return [self.cityArr objectAtIndex:row];
        }
    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (self.selectPicker == selectNumPick) {
        return kDeviceWidth;
    }else{
        return kDeviceWidth/3;
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.selectPicker == selectNumPick) {
        
    }else{
        
    }
}
- (void)onTapDateGesture:(UIGestureRecognizer *)ges
{
    if (ges.view == _cityView) {
        self.selectPicker = selectDatePick;
        [self showPick];
    }else{
        if (_dateBlock) {
            _dateBlock();
        }
        
    }
    
}
- (void)attentionsAction
{
    if (_nextBlock) {
        _nextBlock();
    }
}
- (void)hideMyPicker
{
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0;
        _bgPickerView.tops = self.heights;
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [_bgPickerView removeFromSuperview];
    }];
}
- (void)onSelectPersonBtn
{
    self.selectPicker = selectNumPick;
    [self showPick];
}
- (void)showPick
{
    [self.cityPick reloadAllComponents];

    [self addSubview:self.maskView];
    [self addSubview:self.bgPickerView];
    
    self.maskView.alpha = 0;
    self.bgPickerView.tops = self.heights;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0.3;
        [_bgPickerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(@(kDeviceWidth));
            make.height.equalTo(@(260));
        }];
    }];
}
- (void)onSelectBabyBtn
{
    NSLog(@"nany");
}
- (void)onCancleBtn
{
    
}
- (void)onResetBtn
{
    
}
- (void)onSureCityBtn
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
