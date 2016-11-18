//
//  ContentView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/6.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ContentView.h"

@interface ContentView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIImageView *faxianImg;
@property (nonatomic, strong) UIButton *customBtn;
@property (nonatomic, strong) UIButton *touchUp;
@end

@implementation ContentView
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
    [self addSubview:self.bgScrollView];
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-49));
    }];
    _bgScrollView.contentSize = CGSizeMake(kDeviceWidth, kDeviceHeight-48);
    
    [_bgScrollView addSubview:self.faxianImg];
    [_faxianImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_bgScrollView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-49));
    }];
    
    [_bgScrollView addSubview:self.customBtn];
    [_customBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgScrollView);
        make.top.equalTo(_bgScrollView).offset(kScaleFrom_iPhone5s_Desgin(259));
        make.width.equalTo(@(34));
        make.height.equalTo(@(20));
    }];
    
    [_bgScrollView addSubview:self.touchUp];
    [_touchUp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_faxianImg);
        make.bottom.equalTo(_faxianImg.mas_bottom).offset(-20);
        make.width.equalTo(@(28));
        make.height.equalTo(@(25));
    }];
    
//    [self bringSubviewToFront:_customBtn];
//    [self bringSubviewToFront:_touchUp];
    
}
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [UIScrollView new];
        _bgScrollView.delegate = self;
    }
    return _bgScrollView;
}
- (UIImageView *)faxianImg
{
    if (!_faxianImg) {
        _faxianImg = [UIImageView new];
//        _faxianImg.userInteractionEnabled = YES;
        _faxianImg.image = [UIImage imageNamed:@"faxian"];
    }
    return _faxianImg;
}
- (UIButton *)customBtn
{
    if (!_customBtn) {
        _customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_customBtn setBackgroundImage:[UIImage imageNamed:@"custom"] forState:UIControlStateNormal];
        [_customBtn addTarget:self action:@selector(attentionAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customBtn;
}
- (UIButton *)touchUp
{
    if (!_touchUp) {
        _touchUp = [UIButton buttonWithType:UIButtonTypeCustom];
        [_touchUp setBackgroundImage:[UIImage imageNamed:@"touchUp"] forState:UIControlStateNormal];
        [_touchUp addTarget:self action:@selector(touchUpBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _touchUp;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 20) {
        if (_findBlock) {
            _findBlock();
        }
    }
}
- (void)attentionAction
{
    if (_myBlock) {
        _myBlock();
    }
}
- (void)touchUpBtn
{
    if (_findBlock) {
        _findBlock();
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
