//
//  HomeActiveView.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/3.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "HomeActiveView.h"
@interface HomeActiveView ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *contentImg;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *contentLb;
@end

@implementation HomeActiveView
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
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self);
    }];
    
    [_bgView addSubview:self.contentImg];
    [_contentImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(10);
        make.top.equalTo(_bgView);
        make.width.equalTo(@(260));
        make.height.equalTo(@(125));
    }];
    
    [_bgView addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(23);
        make.top.equalTo(_contentImg.mas_bottom).offset(12);
    }];
    
    [_bgView addSubview:self.contentLb];
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLb);
        make.top.equalTo(_titleLb.mas_bottom).offset(5);
    }];
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
- (UIImageView *)contentImg
{
    if (!_contentImg) {
        _contentImg  = [UIImageView new];
        _contentImg.image = [UIImage imageNamed:@"homeActive.png"];
    }
    return _contentImg;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"用共享经济做公务机平台";
        _titleLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _titleLb;
}
- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _contentLb.text = @"你翻牌我送礼";
        _contentLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _contentLb;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
