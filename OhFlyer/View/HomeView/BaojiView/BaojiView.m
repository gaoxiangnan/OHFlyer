//
//  BaojiView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/23.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiView.h"
#import "WTImageScroll.h"
#import "UIView+Helpers.h"

@interface BaojiView()
@property (nonatomic, strong) UIView *imageScorll;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UISegmentedControl *mySegmentControl;
@property (nonatomic, strong) UIView *bgMessView;




@end
@implementation BaojiView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.backgroundColor = RGBACOLOR(246, 246, 246, 1);
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.imageScorll];
    [_imageScorll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@(155));
    }];
    
    [self addSubview:self.mySegmentControl];
    [_mySegmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_imageScorll.mas_bottom).offset(16);
        make.width.equalTo(@(kDeviceWidth-20));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(29)));
    }];
    
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_mySegmentControl.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.width.equalTo(@(kDeviceWidth));
        make.bottom.equalTo(self.mas_bottom);
    }];
    
//    [_bgScrollView addSubview:self.bgMessView];
//    [_bgMessView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_mySegmentControl);
//        make.top.equalTo(_bgScrollView).offset(kScaleFrom_iPhone5s_Desgin(5));
//        make.width.equalTo(_mySegmentControl);
//        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(140)));
//    }];
    
    [_bgView addSubview:self.tripView];
    [_tripView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(10);
        make.top.equalTo(_bgView);
        make.bottom.equalTo(_bgView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth-20));
        
    }];
    
    [_bgView addSubview:self.tripBackView];
    [_tripBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(10);
        make.top.equalTo(_bgView);
        make.bottom.equalTo(_bgView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth-20));
        
    }];
    
    [_bgView addSubview:self.tripMoreView];
    [_tripMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(10);
        make.top.equalTo(_bgView);
        make.bottom.equalTo(_bgView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth-20));
        
    }];
    
    [_bgView bringSubviewToFront:_tripView];
    
    
}
- (UIView *)imageScorll
{
    NSArray *locatArr = [NSArray arrayWithObjects:@"banner",@"banner",@"banner", nil];
    if (!_imageScorll) {
        /*网络图片*/
//        _imageScorll = [WTImageScroll ShowNetWorkImageScrollWithFream:CGRectMake(0, 20, kDeviceWidth, 200) andImageArray:array andBtnClick:^(NSInteger tagValue) {
//            
//        }];
        _imageScorll = [WTImageScroll ShowLocationImageScrollWithFream:CGRectMake(0, 20, kDeviceWidth, 155) andImageArray:locatArr andBtnClick:^(NSInteger tagValue) {
            
        }];
    }
    return _imageScorll;
}
- (UISegmentedControl *)mySegmentControl
{
    
    if (!_mySegmentControl) {
        _mySegmentControl = [[UISegmentedControl alloc] initWithItems:@[@"单程", @"往返",@"多程"]];
         _mySegmentControl.selectedSegmentIndex = 0;//选中第几个segment 一般用于初始化时选中
        [_mySegmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        _mySegmentControl.segmentedControlStyle = UISegmentedControlStyleBordered;
        [_mySegmentControl setTintColor:RGBACOLOR(10, 18, 50, 1)]; //设置segments的颜色
    }
    return _mySegmentControl;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = RGBCOLOR(246, 246, 246);
    }
    return _bgView;
}
- (TripBaojiView *)tripView
{
    if (!_tripView) {
        _tripView = [[TripBaojiView alloc] initWithFrame:CGRectMake(10, 5, kDeviceWidth-20, 197)];
    }
    return _tripView;
}
- (TripBaojiBackView *)tripBackView
{
    if (!_tripBackView) {
        _tripBackView = [[TripBaojiBackView alloc] initWithFrame:CGRectMake(10, 5, kDeviceWidth-20, 197)];
    }
    return _tripBackView;
}
- (TripBaojiMoreView *)tripMoreView
{
    if (!_tripMoreView) {
        _tripMoreView = [[TripBaojiMoreView alloc] initWithFrame:CGRectMake(10, 5, kDeviceWidth-20, 300)];
    }
    return _tripMoreView;
}

- (void)onSearchBtn
{
    if (_myBlock) {
        _myBlock();
    }
}
- (void)segmentedControlChangedValue:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        [_bgView bringSubviewToFront:_tripView];
    }else if (segmentedControl.selectedSegmentIndex == 1){
        [_bgView bringSubviewToFront:_tripBackView];
    }else{
        [_bgView bringSubviewToFront:_tripMoreView];
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
