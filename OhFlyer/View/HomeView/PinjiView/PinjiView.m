//
//  PinjiView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/23.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "PinjiView.h"
#import "PinjiTableViewCell.h"
#import "UIImage+Color.h"
#import "GXNAleartView.h"


#define GAPWIDTH kScaleFrom_iPhone5s_Desgin(12)
#define BTNWIDTH kScaleFrom_iPhone5s_Desgin(60)
#define BTNHEIGHT 40
@interface PinjiView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *showImg;
@property (nonatomic, strong) UITableView *pinTableView;
@property (nonatomic, strong) UIImageView *hotCityImg;
@property (nonatomic, strong) UILabel *hotCityLb;
@property (nonatomic, strong) UIView *hotCityView;
@property (nonatomic, strong) UIView *hotBtnView;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, assign) int hotBtnCount;

@property (nonatomic, strong) UIButton *currentBtn;

//@property (nonatomic, strong) UILabel *chName;
//@property (nonatomic, strong) UILabel *enName;


@end

@implementation PinjiView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBCOLOR(246, 246, 246);
        _hotBtnCount = 5;
        self.hotCityArr = [NSArray arrayWithObjects:@"北京",@"上海",@"大连",@"天津",@"深圳",@"广州",@"成都",@"三亚",@"拉萨",@"青岛",@"黑龙江",@"大理", nil];
        self.hotCityEnArr = [NSArray arrayWithObjects:@"Beijing",@"Shanghai",@"Dalian",@"Tianjin",@"Shenzhen",@"Guangzhou",@"Chengdu",@"Sanya",@"Lasa",@"Qingdao",@"Heilongjiang",@"Dali", nil];
        [self InitWithSubViews];
        
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.showImg];
    [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(180));
    }];
    
    [self addSubview:self.hotCityView];
    [_hotCityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_showImg.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(108));
    }];
    
    [_hotCityView addSubview:self.hotBtnView];
    [_hotBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotCityView);
        make.top.equalTo(_hotCityView).offset(40);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(52));
    }];
    
    [_hotCityView addSubview:self.hotCityImg];
    [_hotCityImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotCityView).offset(10);
        make.top.equalTo(_hotCityView).offset(15);
    }];
    
    [_hotCityView addSubview:self.hotCityLb];
    [_hotCityLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotCityImg.mas_right).offset(10);
        make.centerY.equalTo(_hotCityImg);
    }];
    
    
    [_hotCityView addSubview:self.moreBtn];
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_hotCityView.mas_right).offset(-10);
        make.top.equalTo(_hotCityLb);
        make.width.equalTo(@(50));
        make.height.equalTo(_hotCityLb);
    }];
    
    [self createHotCityView];
    
    [self addSubview:self.pinTableView];
    [_pinTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_hotCityView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (UIImageView *)showImg
{
    if (!_showImg) {
        _showImg = [UIImageView new];
        [_showImg sd_setImageWithURL:[NSURL URLWithString:@"http://img4.bbs.szhome.com/UploadFiles/Images/2009/06/30/0630154313327.jpg"] placeholderImage:[UIImage imageNamed:@"haner_placeholder"]];
    }
    return _showImg;
}
- (UIView *)hotCityView
{
    if (!_hotCityView) {
        _hotCityView = [UIView new];
        _hotCityView.backgroundColor = [UIColor whiteColor];
    }
    return _hotCityView;
}
- (UIView *)hotBtnView
{
    if (!_hotBtnView) {
        _hotBtnView = [UIView new];
        _hotBtnView.backgroundColor = [UIColor clearColor];
    }
    return _hotBtnView;

}
- (UIImageView *)hotCityImg
{
    if (!_hotCityImg) {
        _hotCityImg = [UIImageView new];
        _hotCityImg.image = [UIImage imageNamed:@"hotCityImg_pinji"];
    }
    return _hotCityImg;
}
- (UILabel *)hotCityLb
{
    if (!_hotCityLb) {
        _hotCityLb = [UILabel new];
        _hotCityLb.text = @"热门城市";
        _hotCityLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _hotCityLb.textAlignment = NSTextAlignmentLeft;
    }
    return _hotCityLb;
}
- (UIButton *)moreBtn
{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreBtn.backgroundColor = [UIColor greenColor];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitle:@"收起" forState:UIControlStateSelected];
        [_moreBtn addTarget:self action:@selector(onMoreBtnClient:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}
- (UITableView *)pinTableView
{
    if (!_pinTableView) {
        _pinTableView = [[UITableView alloc]init];
        _pinTableView.delegate = self;
        _pinTableView.dataSource = self;
        _pinTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _pinTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            
//        }];
//        _pinTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
//        }];
    }
    return _pinTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"PinjiTableViewCell";
    PinjiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[PinjiTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_orderBlock) {
        _orderBlock();
    }
}

- (void)onMoreBtnClient:(UIButton *)sender
{
    [GXNAleartView GXNAleartWithView:self message:@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
}
- (void)createHotCityView
{
//    [_hotBtnView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i < _hotBtnCount; i++) {
        UIButton *hotCityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            _currentBtn = hotCityBtn;
        }
        [hotCityBtn setBackgroundImage:[UIImage createImageWithColor:RGBACOLOR(0, 0, 0, 0.05)] forState:UIControlStateNormal];
        [hotCityBtn setBackgroundImage:[UIImage createImageWithColor:RGBCOLOR(233, 71, 9)] forState:UIControlStateSelected];
        hotCityBtn.layer.cornerRadius = 3;
        hotCityBtn.layer.masksToBounds = YES;
        [hotCityBtn addTarget:self action:@selector(onSelectHotCityBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_hotBtnView addSubview:hotCityBtn];
        
        [hotCityBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_hotBtnView).offset(kScaleFrom_iPhone5s_Desgin(13) +GAPWIDTH*(i%5) + BTNWIDTH*(i%5));
            make.top.equalTo(_hotBtnView).offset(8);
            make.width.equalTo(@(BTNWIDTH));
            make.height.equalTo(@(BTNHEIGHT));
        }];
        
        UILabel * chName = [UILabel new];
        chName.text = [_hotCityArr objectAtIndex:i];
        chName.tag = 100;
        chName.textAlignment = NSTextAlignmentCenter;
        chName.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        [hotCityBtn addSubview:chName];
        [chName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(hotCityBtn);
            make.centerY.equalTo(hotCityBtn).offset(-7);
        }];
        UILabel * enName = [UILabel new];
        enName.text = [_hotCityEnArr objectAtIndex:i];
        enName.tag = 101;
        enName.textAlignment = NSTextAlignmentCenter;
        enName.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        [hotCityBtn addSubview:enName];
        [enName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(hotCityBtn);
            make.centerY.equalTo(hotCityBtn).offset(7);
        }];
        if (hotCityBtn.selected) {
            chName.textColor = [UIColor whiteColor];
            enName.textColor = chName.textColor;
        }
        if(!hotCityBtn.selected){
            chName.textColor = RGBACOLOR(0, 0, 0, 0.7);
            enName.textColor = chName.textColor;
        }
        
    }
    
    _currentBtn.selected = YES;
    for (int i=0 ; i < _currentBtn.subviews.count; i ++) {
        
        if ([[_currentBtn.subviews objectAtIndex:i] isKindOfClass:[UILabel class]]) {
            UILabel *label = [_currentBtn.subviews objectAtIndex:i];
            if (_currentBtn.selected) {
                label.textColor = [UIColor whiteColor];
            }else{
                label.textColor = RGBACOLOR(0, 0, 0, 0.7);
            }
            
            
        }
    }
}
- (void)onSelectHotCityBtn:(UIButton *)sender
{
    if (sender != _currentBtn) {
        if(_currentBtn){
            [self changeBtnStatus:NO withBtn:_currentBtn];
        }
        [self changeBtnStatus:YES withBtn:sender];
        
    }
    _currentBtn = sender;
    
}

-(void)changeBtnStatus:(BOOL)selected withBtn:(UIButton *)sender{
    UILabel * chName = [sender viewWithTag:100];
    UILabel * enName = [sender viewWithTag:101];
    sender.selected = selected;
    chName.textColor = (selected)?[UIColor whiteColor]:RGBACOLOR(0, 0, 0, 0.7);
    enName.textColor = chName.textColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
