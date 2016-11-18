//
//  MineView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MineView.h"
#import "MineMenuTableViewCell.h"

@interface MineView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *imgArray;
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIImageView *bgImv;
@property (nonatomic, strong) UIView *bgMenuView;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *nameLb;
@property (nonatomic, strong) NSArray *titleArr;



@property (nonatomic, strong) UITableView *menuTableView;


//@property (nonatomic, strong) 

@end
@implementation MineView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.imgArray = [NSArray arrayWithObjects:@"order_detail",@"collcet_my",@"message_my_nomal", nil];
        self.titleArr = [NSArray arrayWithObjects:@"我的订单",@"我的收藏",@"我的消息", nil];
        
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@(kDeviceHeight - 44));
    }];
    
    [_bgScrollView addSubview:self.bgImv];
    [_bgImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView);
    }];
    
    
    [_bgScrollView addSubview:self.loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView).offset(kScaleFrom_iPhone5s_Desgin(131));
        make.width.height.equalTo(@(80));
    }];
    
    [_bgScrollView addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgScrollView);
        make.top.equalTo(_loginBtn.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(20));
    }];
    
    [_bgScrollView addSubview:self.bgMenuView];
    [_bgMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgImv.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(60));
    }];
    
    [_bgScrollView addSubview:self.menuTableView];
    [_menuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgScrollView);
        make.top.equalTo(_bgMenuView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(220));
    }];
}
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [UIScrollView new];
        if (kDeviceWidth == 320) {
            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, kDeviceHeight+50);

        }else{
//            _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, kDeviceHeight);

        }
    }
    return _bgScrollView;
}
- (UIImageView *)bgImv
{
    if (!_bgImv) {
        _bgImv = [UIImageView new];
        _bgImv.image = [UIImage imageNamed:@"user_bg"];
    }
    return _bgImv;
}

- (UIView *)bgMenuView
{
    if (!_bgMenuView) {
        _bgMenuView = [UIView new];
        _bgMenuView.backgroundColor = [UIColor whiteColor];
        for (int i = 0; i < 3; i ++) {
            UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            selectBtn.tag = 3000+i;
            selectBtn.frame = CGRectMake(kScaleFrom_iPhone5s_Desgin(50)+kScaleFrom_iPhone5s_Desgin(105 * i), 0, 50, 50);
            [selectBtn setImage:[UIImage imageNamed:[_imgArray objectAtIndex:i]] forState:UIControlStateNormal];
            [selectBtn setTitle:[self.titleArr objectAtIndex:i] forState:UIControlStateNormal];
            [selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            selectBtn.titleLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightThin];
            [selectBtn addTarget:self action:@selector(onSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self initButton:selectBtn];
            
            [_bgMenuView addSubview:selectBtn];
        }
    }
    return _bgMenuView;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 40;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.borderWidth = 2;
        _loginBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
        [_loginBtn addTarget:self action:@selector(onSelectLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.text = @"飞翔者";
        _nameLb.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
        _nameLb.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLb;
}
- (UITableView *)menuTableView
{
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 220) style:UITableViewStylePlain];
        _menuTableView.backgroundColor = [UIColor redColor];
        _menuTableView.scrollEnabled = NO;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
    }
    return _menuTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"MineMenuTableViewCell";
    MineMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[MineMenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    [cell translateDataToCell:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_centerBlock) {
        _centerBlock(indexPath.row);
    }
}
- (void)onSelectBtn:(UIButton *)sender
{
    if (_titleBlock) {
        _titleBlock(sender.tag);
    }
}
- (void)onSelectLoginBtn
{
    if (_loginBlock) {
        _loginBlock();
    }
}

-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, -10.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,20.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
