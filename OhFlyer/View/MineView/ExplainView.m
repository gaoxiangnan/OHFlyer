//
//  ExplainView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ExplainView.h"
#import "ExplainTableViewCell.h"


@interface ExplainView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    CGFloat _oldOffset;
}
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *backBtn;


@end

@implementation ExplainView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        [self InitWithSubViews];
        _oldOffset = 0.0f;
        NSIndexPath * selIndex = [NSIndexPath indexPathForRow:self.index inSection:0];
        [_contentTab selectRowAtIndexPath:selIndex animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.headerView];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(80)));
    }];
    
    [self addSubview:self.contentTab];
    [_contentTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.height.equalTo(self);
    }];
    
    [self addSubview:self.backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-kScaleFrom_iPhone5s_Desgin(24));
        make.width.height.equalTo(@(36));
    }];
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.hidden = YES;
        [_backBtn setImage:[UIImage imageNamed:@"yuan_backBtn"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(onBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UITableView *)contentTab
{
    if (!_contentTab) {
        _contentTab = [[UITableView alloc] init];
        _contentTab.delegate = self;
        _contentTab.dataSource = self;
         _contentTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _contentTab;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _headerView = [UIView new];
    _headerView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 38, kDeviceWidth - 40, 30)];
    titleLb.text = @"会员体系说明";
    titleLb.textAlignment = NSTextAlignmentLeft;
    titleLb.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    titleLb.textColor = [UIColor blackColor];
    [_headerView addSubview:titleLb];
    return _headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kScaleFrom_iPhone5s_Desgin(80);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ExplainTableViewCell cellHeight:@"如何成为会员？\n凡在OhFlyer注册成功后并选择产品下单成功即可成为银卡会员，拥有你的云端飞行服务管家。\n会员可享受什么优惠政策？\n我们将为会员提供更多的便利及优惠。比如说在同等的条件下，会员拥有优先包机的权利；再比如会员可以享受到累计积分，当你到达一定的积分是可以享受到多种优惠促销政策；同时在我们条件允许的情况下，会员可以挑选喜欢的机组为其服务；（还有很多服务如增加机组、机上宣传册、餐具刻名、机身喷绘）。\n会员积分相当于多少钱？\n 1会员积分，相当于人民币1元，可用于飞行使用。"];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"ExplainTableViewCell";
    ExplainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[ExplainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y > _oldOffset) {//如果当前位移大于缓存位移，说明scrollView向上滑动
        _backBtn.hidden = YES;
        NSLog(@"1111111111");
    }else{
        _backBtn.hidden = NO;
        NSLog(@"22222222222");
    }
    
    _oldOffset = scrollView.contentOffset.y;//将当前位移变成缓存位移
    
    
}
- (void)onBackBtn
{
    if (_myBlock) {
        _myBlock();
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
