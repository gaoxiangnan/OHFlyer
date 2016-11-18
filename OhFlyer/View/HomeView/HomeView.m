//
//  HomeView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "HomeView.h"
#import "WTImageScroll.h"
#import "HomeTableViewCell.h"
#import "HomeActiveView.h"
#import "UIView+DrawLine.h"

@interface HomeView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *navBarView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIView *imageScorll;
@property (nonatomic, strong) UIView *pinView;

@property (nonatomic, strong) UIView *baoView;
@property (nonatomic, strong) UITableView *homeTableView;

@end

@implementation HomeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.navBarView];
    [_navBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(64));
    }];
    
    
    
    [self addSubview:self.homeTableView];
    [_homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_navBarView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-113));
    }];
    
    
}
- (UIView *)navBarView
{
    if (!_navBarView) {
        _navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 64)];
        _navBarView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *logoImg = [UIImageView new];
        logoImg.image = [UIImage imageNamed:@"OHFLYER"];
        [_navBarView addSubview:logoImg];
        [logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_navBarView);
            make.top.equalTo(_navBarView).offset(28);
        }];
        
    }
    return _navBarView;
}

- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 305)];
        _headerView.backgroundColor = RGBCOLOR(246, 246, 246);
        
        [_headerView addSubview:self.imageScorll];
        [_imageScorll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headerView);
            make.top.equalTo(_headerView);
            make.width.equalTo(@(kDeviceWidth));
            make.height.equalTo(@(180));
        }];
        
        [_headerView addSubview:self.pinView];
        [_pinView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headerView);
            make.top.equalTo(_imageScorll.mas_bottom);
            make.width.equalTo(@(kDeviceWidth/2));
            make.height.equalTo(@(88));
        }];
        
        
        
        UIImageView *pinjiImage = [UIImageView new];
        pinjiImage.image = [UIImage imageNamed:@"pinji_image.png"];
        [_pinView addSubview:pinjiImage];
        [pinjiImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pinView).offset(kScaleFrom_iPhone5s_Desgin(28));
            make.centerY.equalTo(_pinView);
        }];
        
        
        UILabel *pinjiTitle = [UILabel new];
        pinjiTitle.text = @"拼机";
        pinjiTitle.textColor = RGBCOLOR(233, 71, 9);
        pinjiTitle.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_pinView addSubview:pinjiTitle];
        [pinjiTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(pinjiImage.mas_right).offset(15);
            make.top.equalTo(pinjiImage);
        }];
        
        UILabel *pinjiCon = [UILabel new];
        pinjiCon.text = @"尝鲜公务机";
        pinjiCon.textColor = RGBACOLOR(0, 0, 0,0.5);
        pinjiCon.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        [_pinView addSubview:pinjiCon];
        [pinjiCon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(pinjiTitle);
            make.top.equalTo(pinjiTitle.mas_bottom).offset(4);
        }];
        
        
        UIImageView *shuLine = [UIImageView new];
        shuLine.image = [UIImage imageNamed:@"home_line"];
        [_pinView addSubview:shuLine];
        [shuLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pinView.mas_right).offset(-1);
            make.centerY.equalTo(_pinView);
            make.width.equalTo(@(1));
            make.height.equalTo(@(50));
        }];
        [_headerView addSubview:self.baoView];
        [_baoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pinView.mas_right);
            make.top.equalTo(_pinView);
            make.width.equalTo(_pinView.mas_width);
            make.height.equalTo(_pinView.mas_height);
        }];
        
        
        UIImageView *baojiImage = [UIImageView new];
        baojiImage.image = [UIImage imageNamed:@"baoji_image"];
        [_baoView addSubview:baojiImage];
        [baojiImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_baoView).offset(kScaleFrom_iPhone5s_Desgin(28));
            make.centerY.equalTo(_baoView);
        }];
        UILabel *baojiTitle = [UILabel new];
        baojiTitle.text = @"包机";
        baojiTitle.textColor = RGBCOLOR(233, 71, 9);
        baojiTitle.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_baoView addSubview:baojiTitle];
        [baojiTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(baojiImage.mas_right).offset(15);
            make.top.equalTo(baojiImage);
        }];
        
        UILabel *baojiCon = [UILabel new];
        baojiCon.text = @"便捷无压力";
        baojiCon.textColor = RGBACOLOR(0, 0, 0,0.5);
        baojiCon.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        [_baoView addSubview:baojiCon];
        [baojiCon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(baojiTitle);
            make.top.equalTo(baojiTitle.mas_bottom).offset(4);
        }];
        
        
        UIView *titleView = [UIView new];
        titleView.backgroundColor = [UIColor whiteColor];
        [_headerView addSubview:titleView];
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headerView);
            make.top.equalTo(_pinView.mas_bottom).offset(10);
            make.width.equalTo(@(kDeviceWidth));
            make.height.equalTo(@(30));
        }];
        
        UILabel *titleLb = [UILabel new];
        titleLb.text = @"热门专题";
        titleLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        [titleView addSubview:titleLb];
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleView).offset(20);
            make.top.equalTo(titleView).offset(10);
        }];
    }
    return _headerView;
}

- (UIView *)footerView
{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 238)];
        _footerView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = @"精彩活动";
        titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        [_footerView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_footerView).offset(10);
            make.top.equalTo(_footerView).offset(15);
        }];
        
        UIScrollView *footScr = [UIScrollView new];
        footScr.backgroundColor = [UIColor whiteColor];
        footScr.contentSize = CGSizeMake(270*5+10, 200);
        [_footerView addSubview:footScr];
        [footScr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(_footerView);
            make.top.equalTo(titleLabel.mas_bottom).offset(2);
            make.height.equalTo(@(200));
        }];
        
        for (int i = 0; i < 5; i ++) {
            HomeActiveView *activeView = [[HomeActiveView alloc]initWithFrame:CGRectMake(0, 0, 270, 190)];
            activeView.tag = 3000+i;
            UITapGestureRecognizer *activeGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(activeGes:)];
            [activeView addGestureRecognizer:activeGes];
            [footScr addSubview:activeView];
            [activeView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(footScr).offset(270*i);
                make.top.equalTo(footScr).offset(5);
                make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(270)));
                make.height.equalTo(@(190));
            }];
        }
        
        
        
        
        
        
    }
    return _footerView;
}
- (UIView *)imageScorll
{
    NSArray *array = [NSArray arrayWithObjects:@"http://imgstore.cdn.sogou.com/app/a/11220002/14544_pc.jpg",@"http://img4.bbs.szhome.com/UploadFiles/Images/2009/06/30/0630154313327.jpg", nil];
    if (!_imageScorll) {
        /*网络图片*/
        _imageScorll = [WTImageScroll ShowNetWorkImageScrollWithFream:CGRectMake(0, 20, kDeviceWidth, 180) andImageArray:array andBtnClick:^(NSInteger tagValue) {
            if (_activityBlock) {
                _activityBlock();
            }
        }];
    }
    return _imageScorll;
}
- (UIView *)pinView
{
    if (!_pinView) {
        _pinView = [UIView new];
        _pinView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *pinTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapClient:)];
        [_pinView addGestureRecognizer:pinTap];
    }
    return _pinView;
}
- (UIView *)baoView
{
    if (!_baoView) {
        _baoView = [UIView new];
        _baoView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *baoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapClient:)];
        [_baoView addGestureRecognizer:baoTap];
    }
    return _baoView;
}
- (UITableView *)homeTableView
{
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kSViewWidth, kSViewHeight) style:UITableViewStylePlain];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _homeTableView.tableHeaderView = self.headerView;
        _homeTableView.tableFooterView = self.footerView;
        _homeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            //下拉刷新
            NSLog(@"下---我刷新啦");
        }];
        _homeTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            NSLog(@"上---我刷新啦");
        }];
    }
    return _homeTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect r = [@"和赛车有个约会 | 第63届格兰披治赛车尊享之旅" boundingRectWithSize:CGSizeMake(kFT_scheduleBgViewWidth - kScaleFrom_iPhone5s_Desgin(80),10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular]} context:nil];
    return 230.0 +r.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"HomeTableViewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)onTapClient:(UIGestureRecognizer *)ges
{
    if (_airBlock) {
        if (ges.view == _pinView) {
           _airBlock(Pinji);
        }else{
            _airBlock(Baoji);

        }
    }
}
- (void)activeGes:(UIGestureRecognizer *)ges
{
    NSLog(@"%ld",ges.view.tag-3000);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
