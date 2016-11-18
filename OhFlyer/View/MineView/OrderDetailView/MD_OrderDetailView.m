//
//  MD_OrderDetailView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/9.
//  Copyright © 2016年 Vutumn. All rights reserved.
//  “拼机”

#import "MD_OrderDetailView.h"
#import "BottomShadowView.h"
#import "UC_OrderDetailCell.h"
#import "MD_OrderDetailCell.h"
#import "MD_BaoxiaoCell.h"
#import "NSObject+Common.h"
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
#define kFT_scheduleBgViewMarginLeft kScaleFrom_iPhone5s_Desgin(20)
#define kFT_scheduleBgViewMarginLeft kScaleFrom_iPhone5s_Desgin(20)
#define kFT_scheduleBgViewMarginTop kScaleFrom_iPhone5s_Desgin(20)
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define kFT_scheduleMoreWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))
#define CT_OrderTableCellHeight kScaleFrom_iPhone5s_Desgin(110)
#define HeightForCell           85

//rightArrow
static const CGFloat FSCTIS0RightArrMarginRight = 20.0;


@interface MD_OrderDetailView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger aa;
    
    CGFloat _scrollViewHeight;
    
    BOOL BB;
    BOOL CC;
    int CBA;
    int ABC;
}
@property (nonatomic, strong) BottomShadowView *zhiFuView;
@property (nonatomic, strong) UILabel *moneyLb;
@property (nonatomic, strong) UIButton *payBtn;

@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIView *bgOneView;
@property (nonatomic, strong) UIView *bgThreeView;

@property (nonatomic, strong) BottomShadowView *headView;
@property (nonatomic, strong) UILabel *orderStateLabel;
@property (nonatomic, strong) UILabel *orderNoLb;
@property (nonatomic, strong) UILabel *allMoneyLb;
@property (nonatomic, strong) UILabel *depositLb;


@property (nonatomic, strong) UIView *tripMessageView;
@property (nonatomic, strong) UIImageView *airPic;
@property (nonatomic, strong) UILabel *airTypeLb;

@property (nonatomic, strong) UILabel *startTime;
@property (nonatomic, strong) UILabel *startPlace;
@property (nonatomic, strong) UILabel *arriveTime;
@property (nonatomic, strong) UILabel *arrivePlace;

@property (nonatomic, strong) UIImageView *showTime;
@property (nonatomic, strong) UILabel *timeNum;
@property (nonatomic, strong) UIView *lineTime;
@property (nonatomic, strong) UIImageView *showSeat;
@property (nonatomic, strong) UILabel *seatNum;
@property (nonatomic, strong) UIView *lineSeat;
@property (nonatomic, strong) UIImageView *showPerson;
@property (nonatomic, strong) UILabel *personNum;

@property (nonatomic, strong) UIView *shuomingView;
@property (nonatomic, strong) UILabel *shuomingLb;
@property (nonatomic, strong) UIImageView *shuomingArrow;

@property (nonatomic, strong) UITableView *passengerTable;
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) UILabel *headerLb;

@property (nonatomic, strong) UIView *lineTwo;
@property (nonatomic, strong) UIView *lineOne;
@property (nonatomic, strong) UILabel *showPersonLb;
@property (nonatomic, strong) UILabel *personLb;

@property (nonatomic, strong) UILabel *phoneStateLb;
@property (nonatomic, strong) UILabel *phoneLb;
@property (nonatomic, strong) UILabel *mailStateLb;
@property (nonatomic, strong) UILabel *mailLb;

@property (nonatomic, strong) UITableView *canshiTableView;
@property (nonatomic, strong) UIView *canshiHeaderView;
@property (nonatomic, strong) UIView *remarkTapView;
@property (nonatomic, strong) UILabel *sectionLb;



@property (nonatomic, strong) UITableView *baoxiaoTableView;
@property (nonatomic, strong) UIView *baoxiaoHeaderView;


@property (nonatomic, strong) UIView *bgFiveView;
@property (nonatomic, strong) UIView *jifenView;
@property (nonatomic, strong) UIView *lineJifen;
@property (nonatomic, strong) UILabel *integralStateLb;
@property (nonatomic, strong) UILabel *integralLb;

@property (nonatomic, strong) FTSaleProduct *proModel;
@property (nonatomic, strong) NSArray *persons;

@property (nonatomic, strong) NSArray *mealData;
@property (nonatomic, strong) NSMutableArray *chineseFoodArr;
@property (nonatomic, strong) NSMutableArray *westernFoodArr;
@property (nonatomic, strong) NSMutableArray *foodTypeArr;
@property (nonatomic, strong) NSArray *tableArr;

@property (nonatomic, strong) UILabel *remarkLabel;
@property (nonatomic, strong) UILabel *remarkContentLb;

//发票相关
@property (nonatomic, strong) NSString *invoiceHeader;
@property (nonatomic, strong) NSString *invoiceType;
@property (nonatomic, strong) NSString *invoiceAddress;



@end
@implementation MD_OrderDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kFT_buttonBgColor;
        aa = 0;
        BB = YES;
        CC =YES;
        CBA = 0;
        ABC = 0;
        self.chineseFoodArr = [[NSMutableArray alloc]initWithCapacity:0];
        self.westernFoodArr = [[NSMutableArray alloc]initWithCapacity:0];
        _scrollViewHeight = kScaleFrom_iPhone5s_Desgin(40);
        [self initWithSubviews];
    }
    return self;
}

- (void)initWithSubviews
{
    [self addSubview:self.bgScrollView];
    _bgScrollView.contentSize = CGSizeMake(kDeviceWidth,1000);
    
    
    [_bgScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-64));
    }];
    
    [_bgScrollView addSubview:self.zhiFuView];
    [_zhiFuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.bottom.equalTo(_bgScrollView.mas_bottom);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(40));
    }];
    
    [_zhiFuView addSubview:self.payBtn];
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_zhiFuView);
    }];
    
//第一个view
    [_bgScrollView addSubview:self.bgOneView];
    [_bgOneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(208));
    }];
    

    [_bgOneView addSubview:self.headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgOneView);
        make.top.equalTo(_bgOneView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(76));
    }];
    
    [_headView addSubview:self.orderStateLabel];
    [_orderStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headView).offset(20);
        make.top.equalTo(_headView).offset(13);
    }];
    [_headView addSubview:self.orderNoLb];
    [_orderNoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_orderStateLabel);
        make.top.equalTo(_orderStateLabel.mas_bottom).offset(7);
    }];
    [_headView addSubview:self.allMoneyLb];
    [_allMoneyLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headView.mas_right).offset(-20);
        make.centerY.equalTo(_orderStateLabel);
    }];
    [_headView addSubview:self.depositLb];
    [_depositLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_allMoneyLb);
        make.top.equalTo(_orderNoLb);
    }];
    
    
    [_bgScrollView addSubview:self.tripMessageView];
    [_tripMessageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_headView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(132));
    }];
    
    [_tripMessageView addSubview:self.airPic];
    [_airPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_tripMessageView);
        make.top.equalTo(_tripMessageView).offset(30);
    }];
    [_tripMessageView addSubview:self.airTypeLb];
    [_airTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_tripMessageView);
        make.top.equalTo(_airPic.mas_bottom).offset(13);
    }];
    
    
    [_tripMessageView addSubview:self.startTime];
    [_startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_airPic.mas_left).offset(kScaleFrom_iPhone5s_Desgin(-42));
        make.top.equalTo(_tripMessageView).offset(15);
    }];
    [_tripMessageView addSubview:self.startPlace];
    [_startPlace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_startTime.mas_right);
        make.centerY.equalTo(_airTypeLb);
    }];
    
    [_tripMessageView addSubview:self.arriveTime];
    [_arriveTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airPic.mas_right).offset(kScaleFrom_iPhone5s_Desgin(42));
        make.top.equalTo(_startTime);
    }];
    [_tripMessageView addSubview:self.arrivePlace];
    [_arrivePlace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_arriveTime);
        make.top.equalTo(_startPlace);
    }];
    
    [_tripMessageView addSubview:self.showTime];
    [_showTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tripMessageView).offset(kScaleFrom_iPhone5s_Desgin(27));
        make.bottom.equalTo(_tripMessageView.mas_bottom).offset(-15);
    }];
    [_tripMessageView addSubview:self.timeNum];
    [_timeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTime.mas_right).offset(3);
        make.centerY.equalTo(_showTime);
    }];
    [_tripMessageView addSubview:self.lineTime];
    [_lineTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tripMessageView).offset(kDeviceWidth/3);
        make.centerY.equalTo(_showTime);
        make.width.equalTo(@(0.5));
        make.height.equalTo(@(15));
    }];
    
    [_tripMessageView addSubview:self.showSeat];
    [_showSeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineTime).offset(kScaleFrom_iPhone5s_Desgin(23));
        make.centerY.equalTo(_showTime);
    }];
    [_tripMessageView addSubview:self.seatNum];
    [_seatNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showSeat.mas_right).offset(3);
        make.centerY.equalTo(_showSeat);
    }];
    [_tripMessageView addSubview:self.lineSeat];
    [_lineSeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineTime).offset(kDeviceWidth/3);;
        make.centerY.equalTo(_lineTime);
        make.width.equalTo(@(0.5));
        make.height.equalTo(@(15));
    }];
    
    [_tripMessageView addSubview:self.showPerson];
    [_showPerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineSeat).offset(15);
        make.centerY.equalTo(_seatNum);
    }];
    [_tripMessageView addSubview:self.personNum];
    [_personNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPerson.mas_right).offset(3);
        make.centerY.equalTo(_showPerson);
    }];

//退改签View
    
    [_bgScrollView addSubview:self.shuomingView];
    [_shuomingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgOneView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
     }];
    
    [_shuomingView addSubview:self.shuomingLb];
    [_shuomingLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shuomingView).offset(20);
        make.centerY.equalTo(_shuomingView);
    }];
    [_shuomingView addSubview:self.shuomingArrow];
    [_shuomingArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_shuomingView.mas_right).offset(-20);
        make.centerY.equalTo(_shuomingView);
    }];
    
//第二个View
    [_bgScrollView addSubview:self.passengerTable];
    [_passengerTable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_shuomingView.mas_bottom).offset(10);;
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
//第四个View
    
    [_bgScrollView addSubview:self.canshiTableView];
    [_canshiTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_passengerTable.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
//第三个View
    [_bgScrollView addSubview:self.bgThreeView];
    [_bgThreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_canshiTableView.mas_bottom).offset(10);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(135));
    }];
    [_bgThreeView addSubview:self.lineOne];
    [_lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgThreeView);
        make.top.equalTo(@(45));
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_bgThreeView addSubview:self.lineTwo];
    [_lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgThreeView);
        make.top.equalTo(@(90));
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    [_bgThreeView addSubview:self.showPersonLb];
    [_showPersonLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgThreeView).offset(20);
        make.top.equalTo(_lineOne.mas_top).offset(-30);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgThreeView addSubview:self.personLb];
    [_personLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPersonLb.mas_right).offset(20);
        make.top.equalTo(_showPersonLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    
    
    
    [_bgThreeView addSubview:self.phoneStateLb];
    [_phoneStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgThreeView).offset(20);
        make.top.equalTo(_lineOne.mas_bottom).offset(12);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgThreeView addSubview:self.phoneLb];
    [_phoneLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneStateLb.mas_right).offset(20);
        make.top.equalTo(_phoneStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    [_bgThreeView addSubview:self.mailStateLb];
    [_mailStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgThreeView).offset(20);
        make.top.equalTo(_lineTwo.mas_bottom).offset(10);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3));
    }];
    [_bgThreeView addSubview:self.mailLb];
    [_mailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mailStateLb.mas_right).offset(20);
        make.top.equalTo(_mailStateLb);
        make.width.equalTo(@(kFT_scheduleBgViewWidth/3*2));
    }];
    
    
    

    
//第五个View
    
    [_bgScrollView addSubview:self.baoxiaoTableView];
    [_baoxiaoTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgThreeView.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
//积分
    [_bgScrollView addSubview:self.bgFiveView];
    [_bgFiveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_baoxiaoTableView.mas_bottom).offset(10);
        make.width.equalTo(_bgScrollView);
        make.height.equalTo(@(45));
    }];
    [_bgFiveView addSubview:self.integralStateLb];
    [_integralStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgFiveView).offset(20);
        make.centerY.equalTo(_bgFiveView);
    }];
    
    [_bgScrollView addSubview:self.jifenView];
    [_jifenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgFiveView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(45));
    }];
    [_jifenView addSubview:self.lineJifen];
    [_lineJifen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jifenView);
        make.top.equalTo(_jifenView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    [_jifenView addSubview:self.integralLb];
    [_integralLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jifenView).offset(20);
        make.centerY.equalTo(_jifenView);
    }];
}
- (NSInteger)initDataNum:(NSMutableArray *)arr
{
    NSMutableArray *countArr = [[NSMutableArray alloc]initWithCapacity:0];
    for (KeysModel *keyModel in arr) {
        [countArr addObject:[NSString stringWithFormat:@"%lu",keyModel.proArr.count]];
    }
    NSInteger sum1 = [[countArr valueForKeyPath:@"@sum.floatValue"] integerValue];
    return sum1;
}

- (void)changgeMealData:(NSArray *)mealData//区分中西餐
{
    for (FTSaleProduct *model in mealData) {
        if ([model.mealType isEqualToString:@"1"]) {
            [self.chineseFoodArr addObject:model];
        }else{
            [self.westernFoodArr addObject:model];
        }
        
    }
    
    
    self.tableArr = [[NSArray alloc]initWithObjects:[self changeData:self.chineseFoodArr],[self changeData:self.westernFoodArr], nil];
    [_canshiTableView reloadData];
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

- (UIView *)zhiFuView
{
    if (!_zhiFuView) {
        _zhiFuView = [BottomShadowView new];
        _zhiFuView.backgroundColor = [UIColor whiteColor];
    }
    return _zhiFuView;
}
- (UILabel *)moneyLb{
    if (!_moneyLb) {
        _moneyLb = [UILabel new];
        
        _moneyLb.textColor = [UIColor orangeColor];
        _moneyLb.textAlignment = NSTextAlignmentLeft;
        _moneyLb.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
        
    }
    return _moneyLb;
}
- (UIButton *)payBtn
{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBtn.backgroundColor = RGBCOLOR(233, 71, 9);
        _payBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_payBtn setTitle:@"去支付" forState:UIControlStateNormal];
        [_payBtn addTarget:self action:@selector(onPayMoneyBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payBtn;
}
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        _bgScrollView.backgroundColor = kFT_buttonBgColor;
    }
    return _bgScrollView;
}

- (UIView *)bgOneView
{
    if (!_bgOneView) {
        _bgOneView = [UIView new];
        _bgOneView.backgroundColor = [UIColor whiteColor];
    }
    return _bgOneView;
}

- (UIView *)bgThreeView{
    if (!_bgThreeView) {
        _bgThreeView = [UIView new];
        _bgThreeView.backgroundColor = [UIColor whiteColor];
    }
    return _bgThreeView;
}

- (UIView *)remarkTapView{
    if (!_remarkTapView) {
        _remarkTapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kScaleFrom_iPhone5s_Desgin(80))];
        _remarkTapView.backgroundColor = kFT_buttonBgColor;
        UIView *remark = [[UIView alloc] initWithFrame:CGRectMake(16, 8, kDeviceWidth - 32, kScaleFrom_iPhone5s_Desgin(60))];
        remark.backgroundColor = [UIColor whiteColor];
        
        [remark addSubview:self.remarkLabel];
        [_remarkLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(remark).offset(10);
            make.top.equalTo(remark).offset(10);
            make.width.equalTo(@(kFT_scheduleBgViewWidth));
        }];
        
        [remark addSubview:self.remarkContentLb];
        [_remarkContentLb mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(remark).offset(10);
            make.top.equalTo(remark).offset(30);
            make.width.equalTo(@(kFT_scheduleBgViewWidth));
        }];
        [_remarkTapView addSubview:remark];
        
    }
    return _remarkTapView;
}
- (UILabel *)remarkLabel
{
    if (!_remarkLabel) {
        _remarkLabel = [UILabel new];
        _remarkLabel.text = @"餐食备注";
        _remarkLabel.textColor = [UIColor grayColor];
        _remarkLabel.textAlignment = NSTextAlignmentLeft;
        _remarkLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _remarkLabel;
}
- (UILabel *)remarkContentLb
{
    if (!_remarkContentLb) {
        _remarkContentLb = [UILabel new];
        _remarkContentLb.textColor = [UIColor grayColor];
        _remarkContentLb.numberOfLines = 0;
        _remarkContentLb.textAlignment = NSTextAlignmentLeft;
        _remarkContentLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _remarkContentLb;
}


- (UIView *)headView{
    if (!_headView) {
        _headView = [BottomShadowView new];
        _headView.backgroundColor = kFT_buttonBgColor;
    }
    return _headView;
}
- (UILabel *)orderStateLabel{
    if (!_orderStateLabel) {
        _orderStateLabel = [UILabel new];
        _orderStateLabel.text = @"代付款";
        _orderStateLabel.textColor = RGBCOLOR(233, 71, 9);
        _orderStateLabel.textAlignment = NSTextAlignmentLeft;
        _orderStateLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        
    }
    return _orderStateLabel;
}
- (UILabel *)orderNoLb{
    if (!_orderNoLb) {
        _orderNoLb = [UILabel new];
        _orderNoLb.text = @"订单编号 2620689723875";
        _orderNoLb.textColor = [UIColor grayColor];
        _orderNoLb.textAlignment = NSTextAlignmentLeft;
        _orderNoLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _orderNoLb;
}
- (UILabel *)allMoneyLb
{
    if (!_allMoneyLb) {
        _allMoneyLb = [UILabel new];
        _allMoneyLb.text = @"¥88000";
        _allMoneyLb.textColor = RGBCOLOR(233, 71, 9);
        _allMoneyLb.textAlignment = NSTextAlignmentLeft;
        _allMoneyLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _allMoneyLb;
}
- (UILabel *)depositLb{
    if (!_depositLb) {
        _depositLb = [UILabel new];
        _depositLb.text = @"已付定金¥20000";
        _depositLb.textColor = [UIColor grayColor];
        _depositLb.textAlignment = NSTextAlignmentRight;
        _depositLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _depositLb;
}





- (UIView *)tripMessageView
{
    if (!_tripMessageView) {
        _tripMessageView = [UIView new];
        _tripMessageView.backgroundColor = [UIColor whiteColor];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setBounds:_tripMessageView.bounds];
        [shapeLayer setPosition:_tripMessageView.center];
        [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
        
        // 设置虚线颜色为blackColor
        [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
        [shapeLayer setStrokeColor:[[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0f] CGColor]];
        
        // 3.0f设置虚线的宽度
        [shapeLayer setLineWidth:0.5f];
        [shapeLayer setLineJoin:kCALineJoinRound];
        
        // 3=线的宽度 1=每条线的间距
        [shapeLayer setLineDashPattern:
         [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
          [NSNumber numberWithInt:3],nil]];
        
        // Setup the path
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 90);
        CGPathAddLineToPoint(path, NULL, kDeviceWidth,90);
        
        [shapeLayer setPath:path];
        CGPathRelease(path);
        
        // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
        [[_tripMessageView layer] addSublayer:shapeLayer];
    }
    return _tripMessageView;
}
- (UIImageView *)airPic
{
    if (!_airPic) {
        _airPic = [UIImageView new];
        _airPic.image = [UIImage imageNamed:@"order_detail_air"];
    }
    return _airPic;
}
- (UILabel *)airTypeLb
{
    if (!_airTypeLb) {
        _airTypeLb = [UILabel new];
        _airTypeLb.text = @"08-23  星期四";
        _airTypeLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _airTypeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _airTypeLb.textAlignment = NSTextAlignmentLeft;
    }
    return _airTypeLb;
}

- (UILabel *)startTime
{
    if (!_startTime) {
        _startTime = [UILabel new];
        _startTime.text = @"06:40";
        _startTime.textColor = RGBACOLOR(0, 0, 0, 1);
        _startTime.font = [UIFont systemFontOfSize:26 weight:UIFontWeightSemibold];
        _startTime.textAlignment = NSTextAlignmentLeft;
    }
    return _startTime;
}
- (UILabel *)startPlace
{
    if (!_startPlace) {
        _startPlace = [UILabel new];
        _startPlace.text = @"北京南苑机场";
        _startPlace.textColor = RGBACOLOR(0, 0, 0, 1);
        _startPlace.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _startPlace.textAlignment = NSTextAlignmentLeft;
    }
    return _startPlace;
}

- (UILabel *)arriveTime
{
    if (!_arriveTime) {
        _arriveTime = [UILabel new];
        _arriveTime.text = @"06:40";
        _arriveTime.textColor = RGBACOLOR(0, 0, 0, 1);
        _arriveTime.font = [UIFont systemFontOfSize:26 weight:UIFontWeightSemibold];
        _arriveTime.textAlignment = NSTextAlignmentLeft;
    }
    return _arriveTime;
}
- (UILabel *)arrivePlace
{
    if (!_arrivePlace) {
        _arrivePlace = [UILabel new];
        _arrivePlace.text = @"浦东国际机场";
        _arrivePlace.textColor = RGBACOLOR(0, 0, 0, 1);
        _arrivePlace.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _arrivePlace.textAlignment = NSTextAlignmentLeft;
    }
    return _arrivePlace;
}
- (UIImageView *)showTime
{
    if (!_showTime) {
        _showTime = [UIImageView new];
        _showTime.image = [UIImage imageNamed:@"show_airTtpe"];
    }
    return _showTime;
}
- (UILabel *)timeNum
{
    if (!_timeNum) {
        _timeNum = [UILabel new];
        _timeNum.text = @"湾流G650";
        _timeNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _timeNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _timeNum.textAlignment = NSTextAlignmentLeft;
    }
    return _timeNum;
}
- (UIView *)lineTime
{
    if (!_lineTime) {
        _lineTime = [UIView new];
        _lineTime.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    }
    return _lineTime;
}
- (UIImageView *)showSeat
{
    if (!_showSeat) {
        _showSeat = [UIImageView new];
        _showSeat.image = [UIImage imageNamed:@"show_time"];
    }
    return _showSeat;
}
- (UILabel *)seatNum
{
    if (!_seatNum) {
        _seatNum = [UILabel new];
        _seatNum.text = @"6H20m";
        _seatNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _seatNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _seatNum.textAlignment = NSTextAlignmentLeft;
    }
    return _seatNum;
}
- (UIView *)lineSeat
{
    if (!_lineSeat) {
        _lineSeat = [UIView new];
        _lineSeat.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    }
    return _lineSeat;
}
- (UIImageView *)showPerson
{
    if (!_showPerson) {
        _showPerson = [UIImageView new];
        _showPerson.image = [UIImage imageNamed:@"set_order"];
    }
    return _showPerson;
}
- (UILabel *)personNum
{
    if (!_personNum) {
        _personNum = [UILabel new];
        _personNum.text = @"剩余10个座位";
        _personNum.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _personNum.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _personNum.textAlignment = NSTextAlignmentLeft;
    }
    return _personNum;
}

- (UIView *)shuomingView
{
    if (!_shuomingView) {
        _shuomingView = [UIView new];
        _shuomingView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *shuoming = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onShuomingGes)];
        [_shuomingView addGestureRecognizer:shuoming];
    }
    return _shuomingView;
}
- (UILabel *)shuomingLb
{
    if (!_shuomingLb) {
        _shuomingLb = [UILabel new];
        _shuomingLb.text = @"退改签说明";
        _shuomingLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        
    }
    return _shuomingLb;
}
- (UIImageView *)shuomingArrow
{
    if (!_shuomingArrow) {
        _shuomingArrow = [UIImageView new];
        _shuomingArrow.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _shuomingArrow;
}





//乘客信息tableview
- (UITableView *)passengerTable{
    if (!_passengerTable) {
        _passengerTable = [[UITableView alloc]init];
        _passengerTable.delegate = self;
        _passengerTable.dataSource = self;
        _passengerTable.scrollEnabled = NO;
        _passengerTable.tableHeaderView = self.tableHeaderView;
        _passengerTable.tableFooterView.userInteractionEnabled = YES;
        _passengerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _passengerTable;
}
- (UIView *)tableHeaderView{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        _tableHeaderView.backgroundColor = [UIColor whiteColor];
        
        UILabel *headerLb = [UILabel new];
        headerLb.text = @"乘客信息";
        headerLb.textColor = [UIColor blackColor];
        headerLb.textAlignment = NSTextAlignmentLeft;
        headerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        [_tableHeaderView addSubview:headerLb];
        [headerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tableHeaderView).offset(kScaleFrom_iPhone5s_Desgin(20));
            make.centerY.equalTo(_tableHeaderView);
        }];
        
        UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_bottom"] forState:UIControlStateNormal];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_top"] forState:UIControlStateSelected];
        [arrowBtn addTarget:self action:@selector(onTaoMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_tableHeaderView addSubview:arrowBtn];
        [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_tableHeaderView.mas_right);
            make.top.equalTo(_tableHeaderView);
            make.width.equalTo(@(50));
            make.height.equalTo(@(45));
        }];
        
    }
    return _tableHeaderView;
}
//餐食信息
- (UITableView *)canshiTableView{
    if (!_canshiTableView) {
        _canshiTableView = [[UITableView alloc]init];
        _canshiTableView.backgroundColor = kFT_buttonBgColor;
        _canshiTableView.delegate = self;
        _canshiTableView.dataSource = self;
        _canshiTableView.scrollEnabled = NO;
        _canshiTableView.tableHeaderView = self.canshiHeaderView;
        _canshiTableView.tableFooterView = self.remarkTapView;
        _canshiTableView.tableFooterView.userInteractionEnabled = YES;
        _canshiTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _canshiTableView;
}
- (UIView *)canshiHeaderView
{
    if (!_canshiHeaderView) {
        _canshiHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        _canshiHeaderView.backgroundColor = [UIColor whiteColor];
        
        UILabel *headerLb = [UILabel new];
        headerLb.text = @"餐食信息";
        headerLb.textColor = [UIColor blackColor];
        headerLb.textAlignment = NSTextAlignmentLeft;
        headerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        [_canshiHeaderView addSubview:headerLb];
        [headerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_canshiHeaderView).offset(kScaleFrom_iPhone5s_Desgin(20));
            make.centerY.equalTo(_canshiHeaderView);
        }];
        
        UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_bottom"] forState:UIControlStateNormal];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_top"] forState:UIControlStateSelected];
        [arrowBtn addTarget:self action:@selector(onTaoMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_canshiHeaderView addSubview:arrowBtn];
        [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_canshiHeaderView.mas_right);
            make.top.equalTo(_canshiHeaderView);
            make.width.equalTo(@(50));
            make.height.equalTo(@(45));
        }];
        
    }
    return _canshiHeaderView;
}
//报销信息
- (UITableView *)baoxiaoTableView{
    if (!_baoxiaoTableView) {
        _baoxiaoTableView = [[UITableView alloc]init];
        _baoxiaoTableView.delegate = self;
        _baoxiaoTableView.dataSource = self;
        _baoxiaoTableView.tableHeaderView = self.baoxiaoHeaderView;
        _baoxiaoTableView.tableFooterView.userInteractionEnabled = YES;
        _baoxiaoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _baoxiaoTableView;
}
- (UIView *)baoxiaoHeaderView{
    if (!_baoxiaoHeaderView) {
        _baoxiaoHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
        _baoxiaoHeaderView.backgroundColor = [UIColor whiteColor];
        
        UILabel *headerLb = [UILabel new];
        headerLb.text = @"报销／购买凭证";
        headerLb.textColor = [UIColor blackColor];
        headerLb.textAlignment = NSTextAlignmentLeft;
        headerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        [_baoxiaoHeaderView addSubview:headerLb];
        [headerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_baoxiaoHeaderView).offset(kScaleFrom_iPhone5s_Desgin(20));
            make.centerY.equalTo(_baoxiaoHeaderView);
        }];
        
        UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_bottom"] forState:UIControlStateNormal];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_top"] forState:UIControlStateSelected];
        [arrowBtn addTarget:self action:@selector(onTaoMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_baoxiaoHeaderView addSubview:arrowBtn];
        [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_baoxiaoHeaderView.mas_right);
            make.top.equalTo(_baoxiaoHeaderView);
            make.width.equalTo(@(50));
            make.height.equalTo(@(45));
        }];
        
    }
    return _baoxiaoHeaderView;
}



- (UIView *)lineOne
{
    if (!_lineOne) {
        _lineOne = [UIView new];
        _lineOne.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _lineOne;
}
- (UIView *)lineTwo
{
    if (!_lineTwo) {
        _lineTwo = [UIView new];
        _lineTwo.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _lineTwo;
}
- (UILabel *)showPersonLb{
    if (!_showPersonLb) {
        _showPersonLb = [UILabel new];
        _showPersonLb.text = @"联系人";
        _showPersonLb.textColor = [UIColor blackColor];
        _showPersonLb.textAlignment = NSTextAlignmentLeft;
        _showPersonLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _showPersonLb;
}
- (UILabel *)personLb{
    if (!_personLb) {
        _personLb = [UILabel new];
        _personLb.text = @"张孝正";
        _personLb.textColor = [UIColor blackColor];
        _personLb.textAlignment = NSTextAlignmentLeft;
        _personLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _personLb;
}
- (UILabel *)phoneStateLb{
    if (!_phoneStateLb) {
        _phoneStateLb = [UILabel new];
        _phoneStateLb.text = @"联系手机";
        _phoneStateLb.textColor = [UIColor blackColor];
        _phoneStateLb.textAlignment = NSTextAlignmentLeft;
        _phoneStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _phoneStateLb;
}
- (UILabel *)phoneLb{
    if (!_phoneLb) {
        _phoneLb = [UILabel new];
        _phoneLb.text = @"18210238706";
        _phoneLb.textColor = [UIColor blackColor];
        _phoneLb.textAlignment = NSTextAlignmentLeft;
        _phoneLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _phoneLb;
}
- (UILabel *)mailStateLb{
    if (!_mailStateLb) {
        _mailStateLb = [UILabel new];
        _mailStateLb.text = @"联系邮箱";
        _mailStateLb.textColor = [UIColor blackColor];
        _mailStateLb.textAlignment = NSTextAlignmentLeft;
        _mailStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _mailStateLb;
}
- (UILabel *)mailLb{
    if (!_mailLb) {
        _mailLb = [UILabel new];
        _mailLb.text = @"478212400@qq.com";
        _mailLb.textColor = [UIColor blackColor];
        _mailLb.textAlignment = NSTextAlignmentLeft;
        _mailLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _mailLb;
}
- (UIView *)bgFiveView{
    if (!_bgFiveView) {
        _bgFiveView = [UIView new];
        _bgFiveView.backgroundColor = [UIColor whiteColor];
    }
    return _bgFiveView;
}
- (UIView *)jifenView
{
    if (!_jifenView) {
        _jifenView = [UIView new];
        _jifenView.backgroundColor = [UIColor whiteColor];
    }
    return _jifenView;
}
- (UIView *)lineJifen{
    if (!_lineJifen) {
        _lineJifen = [UIView new];
        _lineJifen.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _lineJifen;
}
- (UILabel *)integralStateLb
{
    if (!_integralStateLb) {
        _integralStateLb = [UILabel new];
        _integralStateLb.text = @"使用积分";
        _integralStateLb.textColor = [UIColor blackColor];
        _integralStateLb.textAlignment = NSTextAlignmentLeft;
        _integralStateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _integralStateLb;
}
- (UILabel *)integralLb
{
    if (!_integralLb) {
        _integralLb = [UILabel new];
        _integralLb.text = @"使用500积分抵用500元";
        _integralLb.textColor = [UIColor blackColor];
        _integralLb.textAlignment = NSTextAlignmentLeft;
        _integralLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _integralLb;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _passengerTable) {
        return aa;
    }else if (tableView == _baoxiaoTableView){
        return 3;
    }else{
        NSArray *array = self.tableArr[section];//断
        return array.count;;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _passengerTable) {
        return 70;
    }else if (tableView == _baoxiaoTableView){
        if (indexPath.row == 0) {
            return  [MD_BaoxiaoCell cellHeight:@"飞享者（北京）科技有限公司"] +20;
        }else if (indexPath.row == 1){
            return [MD_BaoxiaoCell cellHeight:@"快递"] + 20;
        }else{
            return [MD_BaoxiaoCell cellHeight:@"李校长    15892391234\n北京市朝阳区望京soho塔1-C座-1912"] + 20;
        }
    }else{
        return [MD_OrderDetailCell cellHeight:[self.tableArr[indexPath.section] objectAtIndex:indexPath.row]];
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView == _passengerTable) {
        return 1;
    }else if (tableView == _baoxiaoTableView){
        return 1;
    }else{
        return self.tableArr.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _passengerTable) {
        return 0;
    }else if (tableView == _baoxiaoTableView){
        return 0;
    }else{
        return kScaleFrom_iPhone5s_Desgin(36);
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == _passengerTable) {
        return nil;
    }
    else if (tableView == _baoxiaoTableView){
        return nil;
    }else{
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _passengerTable) {
        static NSString *identiflier = @"UC_OrderDetailCell";
        UC_OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identiflier];
        if (!cell) {
            cell = [[UC_OrderDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiflier];
        }
        [cell translateData:self.persons[indexPath.row]];
        
        return cell;
    }else if (tableView == _baoxiaoTableView){
        static NSString *identifliers = @"MD_BaoxiaoCell";
        MD_BaoxiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifliers];
        if (!cell) {
            cell = [[MD_BaoxiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifliers];
        }
        if (indexPath.row == 0) {
            cell.stateLb.text = @"发票抬头";
            cell.contentsLb.text = @"飞享者（北京）科技有限公司";
        }else if (indexPath.row == 1){
            cell.stateLb.text = @"配送方式";
            cell.contentsLb.text = @"快递";
        }else{
            cell.stateLb.text = @"配送地址";
            cell.contentsLb.text = @"李校长    15892391234\n北京市朝阳区望京soho塔1-C座-1912";
        }
        return cell;
    }else{
        static NSString *identifliers = @"MD_OrderDetailCell";
        MD_OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifliers];
        if (!cell) {
            cell = [[MD_OrderDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifliers];
        }
        [cell translateData:[self.tableArr[indexPath.section] objectAtIndex:indexPath.row]];
        return cell;
    }
    
}

- (void)onTaoMoreBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        aa = self.persons.count;
    }else{
        if (self.persons.count >=2) {
            aa = 1;
        }
    }
    [_passengerTable reloadData];
    [self initWithSubviews];
}
- (void)onTapGesture:(UITapGestureRecognizer *)sender
{
    
    CBA += 1;
    if (CBA %2 == 1) {
            _canshiTableView.hidden = NO;
            BB = NO;
    }else{
            _canshiTableView.hidden = YES;
            BB = YES;
    }
    [self initWithSubviews];
}
- (void)onTapGestures:(UITapGestureRecognizer *)sender
{
    
    ABC += 1;
    if (ABC %2 == 1) {
            _baoxiaoTableView.hidden = NO;
            CC = NO;
    }else{
            _baoxiaoTableView.hidden = YES;
            CC = YES;
    }
    [self initWithSubviews];
}
- (void)onPayMoneyBtn
{
    if (_myBlock) {
        _myBlock();
    }
}
- (void)onShuomingGes
{
    if (_tuigaiBlock) {
        _tuigaiBlock();
    }
    NSLog(@"退改签说明   ");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
