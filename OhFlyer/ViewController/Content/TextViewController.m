//
//  TextViewController.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/22.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TextViewController.h"
#define contenSize 736.0  //两个scrollView的contentSize大小
#define dragStrength 40.0 //拖拽强度
#import "LoadMoreView.h"
#import "FlightTableViewCell.h"
#import "TripArrangeTableViewCell.h"

@interface TextViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int banerCurImg;
    NSArray * imagesUrlArr;
    UIView * loadMoreView;
}
@property(nonatomic,strong)UIScrollView * mainScrollView;
@property(nonatomic, strong) UIImageView *showImg;
@property (nonatomic, strong) UIView *productNameView;
@property (nonatomic, strong) UILabel *productName;
@property (nonatomic, strong) UIImageView *startImg;
@property (nonatomic, strong) UILabel *showStartCity;

@property (nonatomic, strong) UIView *startDateView;
@property (nonatomic, strong) UILabel *showdatePriceLb;
@property (nonatomic, strong) UILabel *dateLb;
@property (nonatomic, strong) UILabel *priceLb;
@property (nonatomic, strong) UIButton *calendarBtn;

@property (nonatomic, strong) UITableView *flightTableView;
@property (nonatomic, strong) UIView *tableHeaderView;

//@property(nonatomic,strong)UIScrollView * secScrollView;
@property(nonatomic,strong)SecondPageTopBar * topBar;
@property(nonatomic,strong)BuyBotomView*botomView;
@property(nonatomic,strong)UIView * NavBarView;
@property(nonatomic,strong)SDCycleScrollView * banerView;
@property(nonatomic,strong)UILabel * secPageHeaderLabel;
@property(nonatomic,strong)UIButton * backToTopBtn;

@property(nonatomic,strong)UILabel * banerIndictor;

@property (nonatomic, strong) UIView *productKeyView;
@property (nonatomic, strong) UILabel *airplane;
@property (nonatomic, strong) UILabel *hotelType;
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

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品详情";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    self.navigationController.navigationBarHidden = NO;
    
    banerCurImg=1;
    
    [self setFirstPageView];
    
//    [self addBotomView];
    
}
- (void)backBtn
{
    [self back];
}
-(UIScrollView*)mainScrollView{
    if (_mainScrollView == nil){
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.backgroundColor = [UIColor lightGrayColor];
        _mainScrollView.delegate = self;
        _mainScrollView.frame = CGRectMake(0.0, 0.0, Screen_Width, Screen_Height-BottomH-BottomH);
        _mainScrollView.pagingEnabled = NO;
        [_mainScrollView setClipsToBounds:NO];
        _mainScrollView.showsVerticalScrollIndicator = YES;
        _mainScrollView.tag =100;
        
    }
    return _mainScrollView;
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
//-(UIButton*)backToTopBtn{
//    if (_backToTopBtn==nil) {
//        _backToTopBtn=[[UIButton alloc]initWithFrame:CGRectMake(Screen_Width-15-40, Screen_Height-BottomH-20-40, 40, 40)];
//        [_backToTopBtn setImage:[UIImage imageNamed:@"srp_scroll_2_top_btn@2x"] forState:UIControlStateNormal];
//        [_backToTopBtn addTarget:self action:@selector(backToTopView) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _backToTopBtn;
//}
-(void)setFirstPageView{
    [self.view addSubview:self.mainScrollView];
    self.mainScrollView.contentSize=CGSizeMake(0, contenSize);
    
    //banner图
    [self.mainScrollView addSubview:self.showImg];
    [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mainScrollView);
        make.top.equalTo(self.mainScrollView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(200));
    }];
    
    [self.mainScrollView addSubview:self.productNameView];
    [_productNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_showImg);
        make.top.equalTo(_showImg.mas_bottom);
        make.height.equalTo(@(75));
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
        make.left.equalTo(_startImg.mas_right);
        make.bottom.equalTo(_startImg);
    }];
    
    
    [self.mainScrollView addSubview:self.startDateView];
    [_startDateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_productNameView);
        make.top.equalTo(_productNameView.mas_bottom).offset(10);
        make.height.equalTo(@(50));
    }];
    [_startDateView addSubview:self.showdatePriceLb];
    [_showdatePriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_productName);
        make.centerY.equalTo(_startDateView);
    }];
    [_startDateView addSubview:self.dateLb];
    [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showdatePriceLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(120));
        make.centerY.equalTo(_startDateView);
    }];
    [_startDateView addSubview:self.priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_dateLb.mas_right).offset(10);
        make.centerY.equalTo(_startDateView);
    }];
    [_startDateView addSubview:self.calendarBtn];
    [_calendarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLb.mas_right).offset(30);
        make.centerY.equalTo(_startDateView);
    }];
    
    
    [self.mainScrollView addSubview:self.flightTableView];
    [_flightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.mainScrollView);
        make.top.equalTo(_startDateView.mas_bottom).offset(10);
        make.height.equalTo(@(220));
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
    [_productKeyView addSubview:self.hotelType];
    [_hotelType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_airplane);
        make.top.equalTo(_airplane.mas_bottom).offset(5);
    }];
    [_productKeyView addSubview:self.showProduct];
    [_showProduct mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotelType);
        make.top.equalTo(_hotelType.mas_bottom).offset(5);
    }];
    [_productKeyView addSubview:self.productKeyLb];
    [_productKeyLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showProduct);
        make.width.equalTo(@(kDeviceWidth - 40));
        make.top.equalTo(_showProduct.mas_bottom);
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
- (UIImageView *)showImg
{
    if (!_showImg) {
        _showImg = [UIImageView new];
        [_showImg sd_setImageWithURL:[NSURL URLWithString:@"http://img4.bbs.szhome.com/UploadFiles/Images/2009/06/30/0630154313327.jpg"] placeholderImage:nil];
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
        _productName.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
    }
    return _productName;
}
- (UIImageView *)startImg
{
    if (!_startImg) {
        _startImg = [UIImageView new];
        _startImg.image = [UIImage imageNamed:@"zhongcan_light"];
    }
    return _startImg;
}
- (UILabel *)showStartCity
{
    if (!_showStartCity) {
        _showStartCity = [UILabel new];
        _showStartCity.text = @"北京出发";
        _showStartCity.textAlignment = NSTextAlignmentLeft;
        _showStartCity.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _showStartCity;
}


- (UIView *)startDateView
{
    if (!_startDateView) {
        _startDateView = [UIView new];
        _startDateView.backgroundColor = [UIColor whiteColor];
    }
    return _startDateView;
}
- (UILabel *)showdatePriceLb
{
    if (!_showdatePriceLb) {
        _showdatePriceLb = [UILabel new];
        _showdatePriceLb.text = @"出发日期/价格";
        _showdatePriceLb.textAlignment = NSTextAlignmentLeft;
        _showdatePriceLb.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _showdatePriceLb;
}
- (UILabel *)dateLb
{
    if (!_dateLb) {
        _dateLb = [UILabel new];
        _dateLb.text = @"9-20";
        _dateLb.textAlignment = NSTextAlignmentLeft;
        _dateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _dateLb;
}
- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.text = @"￥56780";
        _priceLb.textColor = [UIColor redColor];
        _priceLb.textAlignment = NSTextAlignmentLeft;
        _priceLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _priceLb;
}
- (UIButton *)calendarBtn
{
    if (!_calendarBtn) {
        _calendarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_calendarBtn setBackgroundImage:[UIImage imageNamed:@"myOrder"] forState:UIControlStateNormal];
        [_calendarBtn addTarget:self action:@selector(onSelectCalendarBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _calendarBtn;
}

- (UIView *)productKeyView
{
    if (!_productKeyView) {
        _productKeyView = [UIView new];
        _productKeyView.backgroundColor = [UIColor whiteColor];
    }
    return _productKeyView;
}
- (UILabel *)airplane
{
    if (!_airplane) {
        _airplane = [UILabel new];
        _airplane.text = @"飞机类型：公务机出行";
        _airplane.textAlignment = NSTextAlignmentLeft;
        _airplane.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _airplane;
}
- (UILabel *)hotelType
{
    if (!_hotelType) {
        _hotelType = [UILabel new];
        _hotelType.text = @"酒店类型：五星豪华酒店";
        _hotelType.textAlignment = NSTextAlignmentLeft;
        _hotelType.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _hotelType;
}
- (UILabel *)showProduct
{
    if (!_showProduct) {
        _showProduct = [UILabel new];
        _showProduct.text = @"产品亮点";
        _showProduct.textAlignment = NSTextAlignmentLeft;
        _showProduct.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
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
        _productKeyLb.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _productKeyLb;
}
- (UITableView *)flightTableView
{
    if (!_flightTableView) {
        _flightTableView = [[UITableView alloc]init];
        _flightTableView.backgroundColor = [UIColor greenColor];
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
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 50)];
        UILabel *flightLb = [UILabel new];
        flightLb.textColor = [UIColor redColor];
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
        _tripTableView.backgroundColor = [UIColor greenColor];
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
        tripLb.textColor = [UIColor redColor];
        tripLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
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
        return 85;
    }else{
        return 240;
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
 *  添加底部的购买 加入购物车 收藏等模块
 */
-(void)addBotomView{
    _botomView=[BuyBotomView botomViewWithFrame:CGRectMake(0, Screen_Height-BottomH-NaviBarH, Screen_Width, BottomH) withDelegate:self];
    [self.view addSubview:_botomView];
    [self.view bringSubviewToFront:_botomView];
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


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//        if(scrollView.contentOffset.y<0){
//            scrollView.contentOffset = CGPointMake(0, 0);//限制不能下拉
//        }
        if(scrollView.contentOffset.y>=0){
            //上拖的时候改变导航栏背部的颜色
            CGFloat  fir_maxContentOffSet_Y=self.mainScrollView.contentSize.height-self.mainScrollView.frame.size.height;
            CGFloat  scal=scrollView.contentOffset.y/fir_maxContentOffSet_Y;
            self.NavBarView.backgroundColor=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:scal];
        }
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat mininumContentset_Y = self.mainScrollView.contentSize.height-Screen_Height+BottomH +dragStrength;
    
    
    // 此时第一屏滑到底部 可调滑动手势强度
    CGFloat  maxContentOffSet_Y=-dragStrength;
    NSLog(@"%f %f",scrollView.contentOffset.y,maxContentOffSet_Y);
    [self.view addSubview:self.backToTopBtn];
            //然后懒加载第二屏
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        if(scrollView.contentOffset.y>mininumContentset_Y)
        {
            _mainScrollView.frame = CGRectMake(0.0, -570, Screen_Width, Screen_Height-BottomH-BottomH+590);
            scrollView.contentSize = CGSizeMake(0, 2000);
            
            [self.view addSubview:self.topBar];
            [_topBar mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.width.equalTo(self.view);
                make.top.equalTo(self.view);
                make.height.equalTo(@(TopTabBarH));
            }];
            [scrollView setContentOffset:CGPointMake(0, 1000)];
            scrollView.bouncesZoom = NO;
        }
        
        if (scrollView.contentOffset.y < -dragStrength) {
            [self.topBar removeFromSuperview];
            _mainScrollView.frame = CGRectMake(0.0, 0, Screen_Width, Screen_Height-BottomH-BottomH);
            scrollView.contentSize = CGSizeMake(0, 1000);
            [scrollView setContentOffset:CGPointMake(0, 0)];
            
            
            [self.mainScrollView addSubview:self.topBar];
            [_topBar mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.width.equalTo(self.mainScrollView);
                make.top.equalTo(_flightTableView.mas_bottom).offset(10);
                make.height.equalTo(@(TopTabBarH));
            }];
        }
        
    } completion:^(BOOL finished) {
    }];
    
    
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
    
//    if (index == 0) {
//        [_secScrollView setContentOffset:CGPointMake(0, 0)];
//    }else if (index == 1){
//        [_secScrollView setContentOffset:CGPointMake(0, 160)];
//    }else{
//        [_secScrollView setContentOffset:CGPointMake(0, 730)];
//    }
    
}
#pragma mark---导航栏按钮的事件
-(void)navBarBtnAction:(UIButton*)sender{
    if (sender.tag==1) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)onSelectCalendarBtn
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onMoreBtn
{
    
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
