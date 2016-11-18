//
//  CounterView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/26.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CounterView.h"
@interface CounterView ()
{
    int _menuValue;
}
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UIView *bgImView;
@property (nonatomic, strong) UIButton *jiaBtn;
@property (nonatomic, strong) UIButton *jianBtn;
@property (nonatomic, strong) UILabel *numLb;

@end

@implementation CounterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        _menuValue = 1;
        [self InitWithSubViews:frame];
        
    }
    return self;
}
- (void)InitWithSubViews:(CGRect)frame
{
    
    
    [self addSubview:self.bgImView];
    [_bgImView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(5));
        make.top.equalTo(self);
        make.height.equalTo(@(27));
        make.width.equalTo(@(90));
    }];

    
    [_bgImView addSubview:self.jiaBtn];
    [_jiaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgImView.mas_right);
        make.top.equalTo(_bgImView);
        make.width.height.equalTo(@(29));
        make.height.equalTo(@(27));
    }];
    
    [_bgImView addSubview:self.jianBtn];
    [_jianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgImView);
        make.top.equalTo(_bgImView);
        make.width.height.equalTo(@(29));
        make.height.equalTo(@(27));
    }];
    
    [_bgImView addSubview:self.numLb];
    [_numLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jianBtn.mas_right).offset(-3);
        make.right.equalTo(_jiaBtn.mas_left).offset(3);
        make.top.equalTo(_bgImView);
        make.height.equalTo(@(27));
    }];
}
- (UIView *)bgImView{
    if (!_bgImView) {
        _bgImView = [UIView new];
        _bgImView.backgroundColor = [UIColor whiteColor];
    }
    return _bgImView;
}

- (UIButton *)jiaBtn{
    if (!_jiaBtn) {
        _jiaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _jiaBtn.tag = 30001;
        _jiaBtn.layer.cornerRadius = 5;
        _jiaBtn.layer.masksToBounds = YES;
        _jiaBtn.layer.borderWidth = 2;
        _jiaBtn.layer.borderColor = [RGBACOLOR(239, 71, 9, 1) CGColor];
        [_jiaBtn setImage:[UIImage imageNamed:@"btn_jia"] forState:UIControlStateNormal];
        [_jiaBtn addTarget:self action:@selector(onAddFoodNumBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jiaBtn;
}
- (UIButton *)jianBtn{
    if (!_jianBtn) {
        _jianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _jianBtn.tag = 30002;
        _jianBtn.userInteractionEnabled = NO;
        _jianBtn.layer.cornerRadius = 3;
        _jianBtn.layer.masksToBounds = YES;
        _jianBtn.layer.borderWidth = 2;
        _jianBtn.layer.borderColor = [RGBACOLOR(239, 71, 9, 1) CGColor];
        [_jianBtn setImage:[UIImage imageNamed:@"btn_jian"] forState:UIControlStateNormal];
        [_jianBtn addTarget:self action:@selector(onAddFoodNumBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jianBtn;
}
- (UILabel *)numLb{
    if (!_numLb) {
        _numLb = [UILabel new];
        _numLb.backgroundColor = RGBACOLOR(239, 71, 9, 1);
        _numLb.textAlignment = NSTextAlignmentCenter;
        _numLb.text = [NSString stringWithFormat:@"%d",_menuValue];
        _numLb.textColor = [UIColor whiteColor];
        _numLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightThin];
    }
    return _numLb;
}
- (void)onAddFoodNumBtn:(UIButton *)sender
{
    
    
    if (sender.tag == 30001) {
        _menuValue +=1;
    }else{
        _menuValue -=1;
    }
    _numLb.text = [NSString stringWithFormat:@"%d",_menuValue];
    
    if (_menuValue < 2) {
        _jianBtn.userInteractionEnabled = NO;
    }else{
        _jianBtn.userInteractionEnabled = YES;
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
