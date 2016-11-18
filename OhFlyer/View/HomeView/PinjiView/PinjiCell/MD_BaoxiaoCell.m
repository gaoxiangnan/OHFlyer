//
//  MD_BaoxiaoCell.m
//  FlyShare
//
//  Created by 向楠 on 16/5/11.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "MD_BaoxiaoCell.h"
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))

@interface MD_BaoxiaoCell()
@property (nonatomic, strong) UIView *stateView;
@property (nonatomic, strong) UIView *contentsView;
@property (nonatomic, strong) UIView *line;
@end

@implementation MD_BaoxiaoCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.stateView];
    [_stateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(80)));
        make.height.equalTo(self);
    }];
    [_stateView addSubview:self.stateLb];
    [_stateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_stateView);
        make.width.equalTo(_stateView);
    }];
    
    [self addSubview:self.contentsView];
    [_contentsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_stateView.mas_right).offset(kScaleFrom_iPhone5s_Desgin(20));
        make.top.equalTo(_stateView);
        make.width.equalTo(@(kFT_scheduleBgViewWidth - kScaleFrom_iPhone5s_Desgin(80)));
        make.height.equalTo(self);
    }];
    [_contentsView addSubview:self.contentsLb];
    [_contentsLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_contentsView);
        make.width.equalTo(_contentsView);
    }];
    
    [self addSubview:self.line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(_contentsView.mas_bottom);
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40)));
        make.height.equalTo(@(0.5));
    }];
}
- (UILabel *)stateLb{
    if (!_stateLb) {
        _stateLb = [UILabel new];
        _stateLb.text = @"发票抬头";
        _stateLb.textAlignment = NSTextAlignmentCenter;
        _stateLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _stateLb;
}
- (UIView *)stateView{
    if (!_stateView) {
        _stateView = [UIView new];
        _stateView.backgroundColor = [UIColor whiteColor];
    }
    return _stateView;
}
- (UILabel *)contentsLb{
    if (!_contentsLb) {
        _contentsLb = [UILabel new];
        _contentsLb.text = @"飞享者（北京）科技有限公司asdasdasdasdasda大叔大叔大叔大打算打算打算打算打算打打啊实打实大师大师大师大师的";
        _contentsLb.textAlignment = NSTextAlignmentLeft;
        _contentsLb.lineBreakMode = NSLineBreakByWordWrapping;
        _contentsLb.numberOfLines = 0;
        _contentsLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _contentsLb;
}
- (UIView *)contentsView{
    if (!_contentsView) {
        _contentsView = [UIView new];
        _contentsView.backgroundColor = [UIColor whiteColor];
    }
    return _contentsView;
}
- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = RGBACOLOR(246, 246, 246, 1);
    }
    return _line;
}
+ (CGFloat)cellHeight:(NSString *)string
{
    CGRect r = [string boundingRectWithSize:CGSizeMake(kFT_scheduleBgViewWidth - kScaleFrom_iPhone5s_Desgin(80),10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]} context:nil];
    return r.size.height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
