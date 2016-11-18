//
//  ProductDetailViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/18.
//  Copyright © 2016年 向楠. All rights reserved.
//
#define contenSize 736.0  //两个scrollView的contentSize大小
#define dragStrength 20.0 //拖拽强度


#import "ProductDetailViewController.h"
#import "LoadMoreView.h"
#import "WTImageScroll.h"
#import "FlightTableViewCell.h"
#import "TripArrangeTableViewCell.h"
#import "OHTravelCalendarViewController.h"
#import "FindProductViewController.h"

@interface ProductDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int banerCurImg;
    NSArray * imagesUrlArr;
    UIView * loadMoreView;
    NSString *_string;
}


@property(nonatomic,strong)UIScrollView * mainScrollView;
@property(nonatomic, strong) UIView *showImg;
@property (nonatomic, strong) UIView *productNameView;
@property (nonatomic, strong) UILabel *productName;
@property (nonatomic, strong) UIImageView *startImg;
@property (nonatomic, strong) UILabel *showStartCity;

@property (nonatomic, strong) UIView *startDateView;
@property (nonatomic, strong) UILabel *showdatePriceLb;
@property (nonatomic, strong) UILabel *dateLb;
@property (nonatomic, strong) UILabel *priceLb;
@property (nonatomic, strong) UIImageView *calendarImg;

@property (nonatomic, strong) UITableView *flightTableView;
@property (nonatomic, strong) UIView *tableHeaderView;

@property(nonatomic,strong)UIScrollView * secScrollView;
@property(nonatomic,strong)SecondPageTopBar * topBar;

@property(nonatomic,strong)UIView *botomView;
@property (nonatomic, strong) UIButton *serviceBtn;
@property (nonatomic, strong) UIButton *nextBtn;




@property(nonatomic,strong)UIView * NavBarView;
@property(nonatomic,strong)SDCycleScrollView * banerView;
@property(nonatomic,strong)UILabel * secPageHeaderLabel;
@property(nonatomic,strong)UIButton * backToTopBtn;

@property(nonatomic,strong)UILabel * banerIndictor;

@property (nonatomic, strong) UIView *productKeyView;
@property (nonatomic, strong) UIImageView *airplaneImg;
@property (nonatomic, strong) UILabel *airplane;
@property (nonatomic, strong) UIImageView *hotelImg;
@property (nonatomic, strong) UILabel *hotelType;
@property (nonatomic, strong) UIImageView *productImg;
@property (nonatomic, strong) UILabel *showProduct;
@property (nonatomic, strong) UILabel *productKeyLb;

@property (nonatomic, strong) UITableView *tripTableView;
@property (nonatomic, strong) UIView *tripHeaderView;
@property (nonatomic, strong) UIView *tripFooterView;


@property (nonatomic, strong) UIView *bookView;
@property (nonatomic, strong) UILabel *showBook;
@property (nonatomic, strong) UILabel *showDetail;
@property (nonatomic, strong) UILabel *detailLb;
@property (nonatomic, strong) UILabel *showPoint;
@property (nonatomic, strong) UILabel *pointLb;

@end

@implementation ProductDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品详情";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    self.navigationController.navigationBarHidden = NO;
    _string = @"酒店早餐后取驱车前往曼雅拉湖-她依偎在雄伟壮观的东非大裂谷悬崖之下，海明威曾赞叹曼雅拉湖是“我见过的非洲最可爱的地方”。今天她仍然是一颗风景秀丽";
    banerCurImg=1;
    
    [self setFirstPageView];
    
    
}
- (void)backBtn
{
    [self back];
}
- (UIView *)botomView
{
    if (!_botomView) {
        _botomView = [UIView new];
        _botomView.backgroundColor = RGBCOLOR(239, 239, 239);
    }
    return _botomView;
}
- (UIButton *)serviceBtn
{
    if (!_serviceBtn) {
        _serviceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_serviceBtn setBackgroundImage:[UIImage imageNamed:@"service_pro"] forState:UIControlStateNormal];
        [_serviceBtn addTarget:self action:@selector(onServiceBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _serviceBtn;
}
- (UIButton *)nextBtn
{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.backgroundColor = RGBCOLOR(233, 71, 9);
        _nextBtn.layer.cornerRadius = 3;
        _nextBtn.layer.masksToBounds = YES;
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(onNextBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}
-(UIScrollView*)mainScrollView{
    if (_mainScrollView == nil){
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.backgroundColor = RGBCOLOR(246, 246, 246);
        _mainScrollView.delegate = self;
        _mainScrollView.frame = CGRectMake(0.0, 0.0, Screen_Width, Screen_Height-BottomH-BottomH);
        _mainScrollView.pagingEnabled = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.tag =100;
        
    }
    return _mainScrollView;
}
-(UIScrollView*)secScrollView{
    if (_secScrollView==nil) {
        _secScrollView=[[UIScrollView alloc]init];
        _secScrollView.backgroundColor = RGBCOLOR(246, 246, 246);
        _secScrollView.frame=CGRectMake(0, Screen_Height-BottomH-BottomH, Screen_Width, Screen_Height-BottomH-TopTabBarH);
        _secScrollView.delegate=self;
        _secScrollView.pagingEnabled=NO;
        _secScrollView.showsVerticalScrollIndicator=NO;
        _secScrollView.tag=200;
        self.secScrollView.contentSize=CGSizeMake(0, 1000);
        
    }
    return _secScrollView;
}
-(UILabel*)secPageHeaderLabel{
    if (_secPageHeaderLabel==nil) {
        _secPageHeaderLabel=[[UILabel alloc]init];
        _secPageHeaderLabel.frame=CGRectMake(0, TopTabBarH+8, Screen_Width, 21);
        _secPageHeaderLabel.textColor=[UIColor blackColor];
        _secPageHeaderLabel.font=[UIFont systemFontOfSize:12];
        _secPageHeaderLabel.alpha=0;
        _secPageHeaderLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _secPageHeaderLabel;
}
-(UIButton*)backToTopBtn{
    if (_backToTopBtn==nil) {
        _backToTopBtn=[[UIButton alloc]initWithFrame:CGRectMake(Screen_Width-15-40, Screen_Height-BottomH-20-40, 40, 40)];
        [_backToTopBtn setImage:[UIImage imageNamed:@"srp_scroll_2_top_btn@2x"] forState:UIControlStateNormal];
        [_backToTopBtn addTarget:self action:@selector(backToTopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backToTopBtn;
}
-(void)setFirstPageView{
    [self.view addSubview:self.mainScrollView];
    [self.view addSubview:self.secScrollView];
    self.mainScrollView.contentSize=CGSizeMake(0, contenSize);
    
    
    [self.view addSubview:self.botomView];
    [_botomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(55));
    }];
    
    [_botomView addSubview:self.serviceBtn];
    [_serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_botomView).offset(30);
        make.centerY.equalTo(_botomView);
        make.width.height.equalTo(@(24));
    }];
    [_botomView addSubview:self.nextBtn];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_botomView.mas_right).offset(-20);
        make.centerY.equalTo(_botomView);
        make.width.equalTo(@(140));
        make.height.equalTo(@(40));
    }];
    //banner图
    [self.mainScrollView addSubview:self.showImg];
    [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mainScrollView);
        make.top.equalTo(self.mainScrollView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(180));
    }];
    
    [self.mainScrollView addSubview:self.productNameView];
    [_productNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showImg);
        make.width.equalTo(@(kDeviceWidth));
        make.top.equalTo(_showImg.mas_bottom);
        make.height.equalTo(@(65));
    }];
    [_productNameView addSubview:self.productName];
    [_productName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_productNameView).offset(10);
    }];
    [_productNameView addSubview:self.startImg];
    [_startImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_productName);
        make.top.equalTo(_productName.mas_bottom).offset(10);
    }];
    [ _productNameView addSubview:self.showStartCity];
    [_showStartCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startImg.mas_right).offset(5);
        make.bottom.equalTo(_startImg);
    }];
    
    
    [self.mainScrollView addSubview:self.startDateView];
    [_startDateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_productNameView);
        make.top.equalTo(_productNameView.mas_bottom).offset(10);
        make.height.equalTo(@(45));
    }];
    [_startDateView addSubview:self.showdatePriceLb];
    [_showdatePriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_productName);
        make.centerY.equalTo(_startDateView);
    }];
    
    [_startDateView addSubview:self.calendarImg];
    [_calendarImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startDateView.mas_right).offset(-40);
        make.centerY.equalTo(_startDateView);
    }];
    [_startDateView addSubview:self.priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_calendarImg.mas_left).offset(-10);
        make.centerY.equalTo(_startDateView);
    }];
    [_startDateView addSubview:self.dateLb];
    [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_priceLb.mas_left).offset(kScaleFrom_iPhone5s_Desgin(-8));
        make.centerY.equalTo(_startDateView);
    }];
    
    
    
    
    
    [self.mainScrollView addSubview:self.flightTableView];
    [_flightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.mainScrollView);
        make.top.equalTo(_startDateView.mas_bottom).offset(10);
        make.height.equalTo(@(190));
    }];
    
    [self.mainScrollView addSubview:self.topBar];
    [_topBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.mainScrollView);
        make.top.equalTo(_flightTableView.mas_bottom).offset(10);
        make.height.equalTo(@(TopTabBarH));
    }];
    
    [self.mainScrollView addSubview:self.productKeyView];
    [_productKeyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_mainScrollView);
        make.top.equalTo(_flightTableView.mas_bottom).offset(54);
        make.height.equalTo(@(150));
    }];
    
    
    [_productKeyView addSubview:self.airplane];
    [_airplane mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_productKeyView).offset(20);
    }];
    [_productKeyView addSubview:self.airplaneImg];
    [_airplaneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airplane).offset(-10);
        make.centerY.equalTo(_airplane);
    }];
    [_productKeyView addSubview:self.hotelType];
    [_hotelType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airplane);
        make.top.equalTo(_airplane.mas_bottom).offset(5);
    }];
    [_productKeyView addSubview:self.hotelImg];
    [_hotelImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotelType).offset(-10);
        make.centerY.equalTo(_hotelType);
    }];
    [_productKeyView addSubview:self.showProduct];
    [_showProduct mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotelType);
        make.top.equalTo(_hotelType.mas_bottom).offset(5);
    }];
    [_productKeyView addSubview:self.productImg];
    [_productImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showProduct).offset(-10);
        make.centerY.equalTo(_showProduct);
    }];
    [_productKeyView addSubview:self.productKeyLb];
    [_productKeyLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showProduct);
        make.width.equalTo(@(kDeviceWidth - 40));
        make.top.equalTo(_showProduct.mas_bottom).offset(5);
    }];
    
    [self.mainScrollView addSubview:self.tripTableView];
    [_tripTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.mainScrollView);
        make.top.equalTo(_productKeyView.mas_bottom).offset(10);
        make.height.equalTo(@(560));
    }];
    
    [self.mainScrollView addSubview:self.bookView];
    [_bookView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.mainScrollView);
        make.top.equalTo(_tripTableView.mas_bottom).offset(10);
        make.height.equalTo(@(200));
    }];
    [_bookView addSubview:self.showBook];
    [_showBook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bookView).offset(15);
        make.top.equalTo(_bookView).offset(10);
    }];
    [_bookView addSubview:self.showPoint];
    [_showPoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showBook);
        make.top.equalTo(_showBook.mas_bottom).offset(5);
    }];
    [_bookView addSubview:self.pointLb];
    [_pointLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPoint);
        make.top.equalTo(_showPoint.mas_bottom).offset(5);
        make.width.equalTo(@(kDeviceWidth - 30));
    }];
    [_bookView addSubview:self.showDetail];
    [_showDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pointLb);
        make.top.equalTo(_pointLb.mas_bottom).offset(5);
    }];
    [_bookView addSubview:self.detailLb];
    [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_pointLb);
        make.top.equalTo(_showDetail.mas_bottom).offset(5);
    }];
    //加载更多
    loadMoreView=[LoadMoreView view];
    loadMoreView.alpha = 0;
    loadMoreView.frame=CGRectMake(0, contenSize-BottomH, Screen_Width, BottomH);
    [self.mainScrollView addSubview:loadMoreView];
    
}
- (UIView *)showImg
{
    NSArray *array = [NSArray arrayWithObjects:@"http://imgstore.cdn.sogou.com/app/a/11220002/14544_pc.jpg",@"http://img4.bbs.szhome.com/UploadFiles/Images/2009/06/30/0630154313327.jpg", nil];
    if (!_showImg) {
        /*网络图片*/
        _showImg = [WTImageScroll ShowNetWorkImageScrollWithFream:CGRectMake(0, 20, kDeviceWidth, 180) andImageArray:array andBtnClick:nil];
    }
    return _showImg;
}
- (UIView *)productNameView
{
    if (!_productNameView) {
        _productNameView = [UIView new];
        _productNameView.backgroundColor = [UIColor whiteColor];
    }
    return _productNameView;
}
- (UILabel *)productName
{
    if (!_productName) {
        _productName = [UILabel new];
        _productName.text = @"马尔代夫班度士岛Bandos land4晚自助游";
        _productName.textAlignment = NSTextAlignmentLeft;
        _productName.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _productName;
}
- (UIImageView *)startImg
{
    if (!_startImg) {
        _startImg = [UIImageView new];
        _startImg.image = [UIImage imageNamed:@"setout_pro"];
    }
    return _startImg;
}
- (UILabel *)showStartCity
{
    if (!_showStartCity) {
        _showStartCity = [UILabel new];
        _showStartCity.text = @"北京出发";
        _showStartCity.textColor = [UIColor blackColor];
        _showStartCity.textAlignment = NSTextAlignmentLeft;
        _showStartCity.font = [UIFont systemFontOfSize:10 weight:UIFontWeightLight];
    }
    return _showStartCity;
}


- (UIView *)startDateView
{
    if (!_startDateView) {
        _startDateView = [UIView new];
        _startDateView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *calendarTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onCalendarGes)];
        [_startDateView addGestureRecognizer:calendarTap];
    }
    return _startDateView;
}
- (UILabel *)showdatePriceLb
{
    if (!_showdatePriceLb) {
        _showdatePriceLb = [UILabel new];
        _showdatePriceLb.text = @"出发日期/价格";
        _showdatePriceLb.textAlignment = NSTextAlignmentLeft;
        _showdatePriceLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _showdatePriceLb;
}
- (UILabel *)dateLb
{
    if (!_dateLb) {
        _dateLb = [UILabel new];
        _dateLb.text = @"2016/09/12";
        _dateLb.textAlignment = NSTextAlignmentLeft;
        _dateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _dateLb;
}
- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.text = @"￥56870/人";
        _priceLb.textColor = RGBCOLOR(233, 71, 9);
        _priceLb.textAlignment = NSTextAlignmentLeft;
        _priceLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _priceLb;
}
- (UIImageView *)calendarImg
{
    if (!_calendarImg) {
        _calendarImg = [UIImageView new];
        _calendarImg.image = [UIImage imageNamed:@"calender_pro"];
    }
    return _calendarImg;
}

- (UIView *)productKeyView
{
    if (!_productKeyView) {
        _productKeyView = [UIView new];
        _productKeyView.backgroundColor = [UIColor whiteColor];
    }
    return _productKeyView;
}
- (UIImageView *)airplaneImg
{
    if (!_airplaneImg) {
        _airplaneImg = [UIImageView new];
        _airplaneImg.image = [UIImage imageNamed:@"show_hot"];
    }
    return _airplaneImg;
}
- (UILabel *)airplane
{
    if (!_airplane) {
        _airplane = [UILabel new];
        _airplane.text = @"飞机类型：公务机出行";
        _airplane.textAlignment = NSTextAlignmentLeft;
        _airplane.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _airplane;
}
- (UIImageView *)hotelImg
{
    if (!_hotelImg) {
        _hotelImg = [UIImageView new];
        _hotelImg.image = [UIImage imageNamed:@"show_hot"];
    }
    return _hotelImg;
}
- (UILabel *)hotelType
{
    if (!_hotelType) {
        _hotelType = [UILabel new];
        _hotelType.text = @"酒店类型：五星豪华酒店";
        _hotelType.textAlignment = NSTextAlignmentLeft;
        _hotelType.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _hotelType;
}
- (UIImageView *)productImg
{
    if (!_productImg) {
        _productImg = [UIImageView new];
        _productImg.image = [UIImage imageNamed:@"show_hot"];
    }
    return _productImg;
}
- (UILabel *)showProduct
{
    if (!_showProduct) {
        _showProduct = [UILabel new];
        _showProduct.text = @"产品亮点";
        _showProduct.textAlignment = NSTextAlignmentLeft;
        _showProduct.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _showProduct;
}
- (UILabel *)productKeyLb
{
    if (!_productKeyLb) {
        _productKeyLb = [UILabel new];
        _productKeyLb.text = @"快艇珊瑚岛出海，爱大家圣诞节里卡接收到了空间埃里克森建档立卡急死了肯德基了卡机速度快了就爱看两居室的考拉姐克里斯蒂金坷垃江苏旷达卡里就速度快拉上的垃圾死定了卡机速度快拉上的";
//        _productKeyLb.lineBreakMode = NSLineBreakByWordWrapping;
        _productKeyLb.numberOfLines = 0;
        
        _productKeyLb.textAlignment = NSTextAlignmentLeft;
        _productKeyLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _productKeyLb;
}
- (UITableView *)flightTableView
{
    if (!_flightTableView) {
        _flightTableView = [[UITableView alloc]init];
        _flightTableView.delegate = self;
        _flightTableView.dataSource = self;
        _flightTableView.scrollEnabled = NO;
        _flightTableView.hidden = NO;
        _flightTableView.tableHeaderView = self.tableHeaderView;
        _flightTableView.tableFooterView.userInteractionEnabled = YES;
        _flightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _flightTableView;
}
- (UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
        UILabel *flightLb = [UILabel new];
        flightLb.textColor = RGBCOLOR(233, 71, 9);
        flightLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        flightLb.textAlignment = NSTextAlignmentLeft;
        flightLb.text = @"参考航班";
        [_tableHeaderView addSubview:flightLb];
        [flightLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tableHeaderView).offset(10);
            make.centerY.equalTo(_tableHeaderView);
        }];
        
    }
    return _tableHeaderView;
}
- (UITableView *)tripTableView
{
    if (!_tripTableView) {
        _tripTableView = [[UITableView alloc]init];
        _tripTableView.delegate = self;
        _tripTableView.dataSource = self;
        _tripTableView.scrollEnabled = NO;
        _tripTableView.hidden = NO;
        _tripTableView.tableFooterView = self.tripFooterView;
        _tripTableView.tableHeaderView = self.tripHeaderView;
        _tripTableView.tableFooterView.userInteractionEnabled = YES;
        _tripTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tripTableView;
}
- (UIView *)bookView
{
    if (!_bookView) {
        _bookView = [UIView new];
        _bookView.backgroundColor = [UIColor whiteColor];
    }
    return _bookView;
}
- (UILabel *)showBook
{
    if (!_showBook) {
        _showBook = [UILabel new];
        _showBook.text = @"预订须知";
        _showBook.textAlignment = NSTextAlignmentLeft;
        _showBook.font = [UIFont systemFontOfSize:15 weight:UIFontWeightThin];
    }
    return _showBook;
}
- (UILabel *)showDetail
{
    if (!_showDetail) {
        _showDetail = [UILabel new];
        _showDetail.text = @"活动说明";
        _showDetail.textAlignment = NSTextAlignmentLeft;
        _showDetail.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _showDetail;
}
- (UILabel *)detailLb
{
    if (!_detailLb) {
        _detailLb = [UILabel new];
        _detailLb.text = @"如您被法院列为失信被执行人名单，您可能无法正常出行，您可自报名前自行核实，避免不必要损失";
        _detailLb.textAlignment = NSTextAlignmentLeft;
        _detailLb.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _detailLb;
}
- (UILabel *)showPoint
{
    if (!_showPoint) {
        _showPoint = [UILabel new];
        _showPoint.text = @"温馨提示";
        _showPoint.textAlignment = NSTextAlignmentLeft;
        _showPoint.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _showPoint;
}
- (UILabel *)pointLb
{
    if (!_pointLb) {
        _pointLb = [UILabel new];
        _pointLb.numberOfLines = 0;
        _pointLb.text = @"欧洲领馆在通常情况下，最晚会在出行前一个工作日，返还团队旅游者的护照等原件给旅行社，届时才能准确获知签证效果。";
        _pointLb.textAlignment = NSTextAlignmentLeft;
        _pointLb.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _pointLb;
}


- (UIView *)tripHeaderView
{
    if (!_tripHeaderView) {
        _tripHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
        UILabel *tripLb = [UILabel new];
        tripLb.textColor = [UIColor blackColor];
        tripLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        tripLb.textAlignment = NSTextAlignmentLeft;
        tripLb.text = @"行程安排";
        [_tripHeaderView addSubview:tripLb];
        [tripLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tripHeaderView).offset(10);
            make.centerY.equalTo(_tripHeaderView);
        }];
        
    }
    return _tripHeaderView;
}
- (UIView *)tripFooterView
{
    if (!_tripFooterView) {
        _tripFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
        UIImageView *tripImg = [UIImageView new];
        tripImg.image = [UIImage imageNamed:@"tabbar_icon_bar_highlight"];
        [_tripFooterView addSubview:tripImg];
        [tripImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tripFooterView).offset(10);
            make.centerY.equalTo(_tripFooterView);
        }];
        
        UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_icon_bar_highlight"] forState:UIControlStateNormal];
        [arrowBtn addTarget:self action:@selector(onMoreBtn) forControlEvents:UIControlEventTouchUpInside];
        [_tripFooterView addSubview:arrowBtn];
        [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_tripFooterView).offset(30);
            make.centerY.equalTo(_tripFooterView);
        }];
    }
    return _tripFooterView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _flightTableView) {
        return 2;
    }else{
        return 2;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _flightTableView) {
        return 75;
    }else{
        CGRect r = [_string boundingRectWithSize:CGSizeMake(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40),10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f]} context:nil];
        return (240+r.size.height);
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"FlightTableViewCell";
    static NSString *identifyy = @"TripArrangeTableViewCell";
    if (tableView == _flightTableView) {
        FlightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[FlightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
    }else{
        TripArrangeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifyy];
        if (!cell) {
            cell = [[TripArrangeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifyy];
        }
        return cell;
    }
    
}
/**
 添加导航栏背后的View
 */
-(void)addNavBarView{
    UIView* view = [[UIView alloc] init];
    self.NavBarView = view;
    view.frame = CGRectMake(0, 0, Screen_Width, NaviBarH);
    [self.view addSubview:view];
    
    UIView * lineView=[[UIView alloc]initWithFrame:CGRectMake(0, NaviBarH-0.5, Screen_Width, 0.5)];
    lineView.backgroundColor=[UIColor blackColor];
    [self.NavBarView addSubview:lineView];
    
    UIButton * backBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 32, 25, 25)];
    [backBtn setImage:[UIImage imageNamed:@"lf_arrow_left@2x"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(navBarBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.layer.cornerRadius=25/2;
    backBtn.backgroundColor=[UIColor lightGrayColor];
    [self.NavBarView addSubview:backBtn];
    backBtn.tag=1;
    
}

/**
 *  第二屏顶部的三个模块
 *
 *  @return 懒加载
 */
-(SecondPageTopBar*)topBar{
    if (_topBar==nil) {
        _topBar=[[SecondPageTopBar alloc]initWithArray:@[@"产品两点",@"行程安排",@"预订须知"]];
        _topBar.backgroundColor = [UIColor whiteColor];
        _topBar.frame=CGRectMake(0, 0, Screen_Width, TopTabBarH);
        _topBar.delegate=self;
    }
    return _topBar;
}

#pragma mark--UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.tag == 100){
        if(scrollView.contentOffset.y<0){
            scrollView.contentOffset = CGPointMake(0, 0);//限制不能下拉
        }
        if(scrollView.contentOffset.y>=0){
            //上拖的时候改变导航栏背部的颜色
            CGFloat  fir_maxContentOffSet_Y=self.mainScrollView.contentSize.height-self.mainScrollView.frame.size.height;
            CGFloat  scal=scrollView.contentOffset.y/fir_maxContentOffSet_Y;
            self.NavBarView.backgroundColor=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:scal];
        }
    }
    if (scrollView.tag==200) {
        //在0-60之间 懒加载子控件，并且随拖动的幅度改变子控件的标题和alpha
        CGFloat  mininumContenOffSet_Y=0;
        CGFloat  maxContentOffSet_Y=-dragStrength;
        self.secPageHeaderLabel.alpha=scrollView.contentOffset.y/maxContentOffSet_Y;
        loadMoreView.alpha = scrollView.contentOffset.y/maxContentOffSet_Y;
        if (scrollView.contentOffset.y>maxContentOffSet_Y&&scrollView.contentOffset.y<mininumContenOffSet_Y) {
            self.secPageHeaderLabel.text=@"下拉，回到宝贝详情";
            [self.view addSubview:self.secPageHeaderLabel];
        }
        if(scrollView.contentOffset.y<maxContentOffSet_Y){
            self.secPageHeaderLabel.text=@"释放，回到宝贝详情";
        }
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.tag==100) {
        CGFloat mininumContentset_Y=self.mainScrollView.contentSize.height-Screen_Height+BottomH +dragStrength;
        if(scrollView.contentOffset.y>mininumContentset_Y){
            //此时第一屏滑到底部 可调滑动手势强度
            self.topBar.hidden=NO;
            [self.topBar removeFromSuperview];
//            [self.view bringSubviewToFront:self.botomView];
            self.backToTopBtn.hidden=NO;
            [self.view addSubview:self.backToTopBtn];
            //然后懒加载第二屏
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                [self.view addSubview:self.topBar];
                [_topBar mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.secScrollView);
                    make.bottom.equalTo(_secScrollView.mas_top);
                    make.height.equalTo(@(TopTabBarH));
                }];
                
                self.mainScrollView.frame=CGRectMake(0, -contenSize, Screen_Width, Screen_Height-BottomH-BottomH);
                self.secScrollView.frame=CGRectMake(0, TopTabBarH, Screen_Width, Screen_Height-BottomH-TopTabBarH);

                self.secScrollView.contentSize = CGSizeMake(0, 1000);
                
                [self.secScrollView addSubview:self.productKeyView];
                [_productKeyView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(_secScrollView);
                    make.top.equalTo(_secScrollView);
                    make.height.equalTo(@(150));
                }];
                
                [self.secScrollView addSubview:self.tripTableView];
                [_tripTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.secScrollView);
                    make.top.equalTo(_productKeyView.mas_bottom).offset(10);
                    make.height.equalTo(@(560));
                }];
                
                [self.secScrollView addSubview:self.bookView];
                [_bookView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.secScrollView);
                    make.top.equalTo(_tripTableView.mas_bottom).offset(10);
                    make.height.equalTo(@(200));
                }];
                
            } completion:^(BOOL finished) {
            }];
        }
    }
    if (scrollView.tag==200) {
        CGFloat  maxContentOffSet_Y=-dragStrength;
        if (scrollView.contentOffset.y<maxContentOffSet_Y) {
            [self.topBar removeFromSuperview];
            self.backToTopBtn.hidden=YES;
//            [self.view bringSubviewToFront:self.botomView];
            
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.secPageHeaderLabel.alpha=0;
                [self.mainScrollView addSubview:self.topBar];
                [_topBar mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.mainScrollView);
                    make.top.equalTo(_flightTableView.mas_bottom).offset(10);
                    make.height.equalTo(@(TopTabBarH));
                }];
                self.secScrollView.frame=CGRectMake(0, Screen_Height+TopTabBarH, Screen_Width, Screen_Height-BottomH-TopTabBarH);
                self.mainScrollView.frame=CGRectMake(0, 0, Screen_Width, Screen_Height-BottomH-BottomH);
                
                [self.mainScrollView addSubview:self.productKeyView];
                [_productKeyView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(_mainScrollView);
                    make.top.equalTo(_flightTableView.mas_bottom).offset(54);
                    make.height.equalTo(@(150));
                }];
                
                [self.mainScrollView addSubview:self.tripTableView];
                [_tripTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.mainScrollView);
                    make.top.equalTo(_productKeyView.mas_bottom).offset(10);
                    make.height.equalTo(@(560));
                }];
                [self.mainScrollView addSubview:self.bookView];
                [_bookView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.mainScrollView);
                    make.top.equalTo(_tripTableView.mas_bottom).offset(10);
                    make.height.equalTo(@(200));
                }];
                
                [self.mainScrollView bringSubviewToFront:loadMoreView];
            } completion:^(BOOL finished) {
                self.topBar.hidden=NO;
            }];
        }
    }
}
#pragma mark---banner图的滚动回调
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    self.banerIndictor.text=[NSString stringWithFormat:@"%ld/%lu",index+1,imagesUrlArr.count];
}
#pragma mark---底部按钮
-(void)clickedBotomViewBtnWithBtnTag:(NSInteger)btnTag{
    DebugLog(@"底部的第%ld个",btnTag);
}
#pragma mark---第二页顶部按钮
-(void)tabBar:(SecondPageTopBar *)tabBar didSelectIndex:(NSInteger)index
{
    for (UIView *view in _mainScrollView.subviews) {
        if ([view isKindOfClass:[_topBar class]]) {
            NSLog(@"呵呵哈哈哈");
            //此时第一屏滑到底部 可调滑动手势强度
            self.topBar.hidden=NO;
            [self.topBar removeFromSuperview];
            //            [self.view bringSubviewToFront:self.botomView];
            self.backToTopBtn.hidden=NO;
            [self.view addSubview:self.backToTopBtn];
            //然后懒加载第二屏
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                [self.view addSubview:self.topBar];
                [_topBar mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.secScrollView);
                    make.bottom.equalTo(_secScrollView.mas_top);
                    make.height.equalTo(@(TopTabBarH));
                }];
                
                self.mainScrollView.frame=CGRectMake(0, -contenSize, Screen_Width, Screen_Height-BottomH-BottomH);
                self.secScrollView.frame=CGRectMake(0, TopTabBarH, Screen_Width, Screen_Height-BottomH-TopTabBarH);
                
                self.secScrollView.contentSize = CGSizeMake(0, 1000);
                
                [self.secScrollView addSubview:self.productKeyView];
                [_productKeyView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(_secScrollView);
                    make.top.equalTo(_secScrollView);
                    make.height.equalTo(@(150));
                }];
                
                [self.secScrollView addSubview:self.tripTableView];
                [_tripTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.secScrollView);
                    make.top.equalTo(_productKeyView.mas_bottom).offset(10);
                    make.height.equalTo(@(560));
                }];
                
                [self.secScrollView addSubview:self.bookView];
                [_bookView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.width.equalTo(self.secScrollView);
                    make.top.equalTo(_tripTableView.mas_bottom).offset(10);
                    make.height.equalTo(@(200));
                }];
                
            } completion:^(BOOL finished) {
            }];
        
        }
    }
    
    if (index == 0) {
        [_secScrollView setContentOffset:CGPointMake(0, 0)];
    }else if (index == 1){
        [_secScrollView setContentOffset:CGPointMake(0, 160)];
    }else{
        [_secScrollView setContentOffset:CGPointMake(0, 730)];
    }
    
}
#pragma mark---导航栏按钮的事件
-(void)navBarBtnAction:(UIButton*)sender{
    if (sender.tag==1) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}
#pragma mark---滚动到顶部
-(void)backToTopView{
    self.backToTopBtn.hidden=YES;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.topBar.frame=CGRectMake(0, Screen_Height, Screen_Width, TopTabBarH);
        self.secScrollView.frame=CGRectMake(0, Screen_Height+TopTabBarH, Screen_Width, Screen_Height-BottomH-TopTabBarH);
        self.mainScrollView.contentOffset=CGPointMake(0, 0);
        self.mainScrollView.frame=CGRectMake(0, 0, Screen_Width, Screen_Height-BottomH-BottomH);
        self.secPageHeaderLabel.alpha=0;
    } completion:^(BOOL finished) {
        self.topBar.hidden=NO;
    }];
}
- (void)onCalendarGes
{
    OHTravelCalendarViewController *calendarVC = [[OHTravelCalendarViewController alloc]init];
    [self.navigationController pushViewController:calendarVC animated:YES];
    NSLog(@"我点了日期");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onMoreBtn
{
    
}
- (void)onServiceBtn
{
    
}
- (void)onNextBtn
{
    FindProductViewController *findVC = [[FindProductViewController alloc]init];
    [self.navigationController pushViewController:findVC animated:YES];
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
