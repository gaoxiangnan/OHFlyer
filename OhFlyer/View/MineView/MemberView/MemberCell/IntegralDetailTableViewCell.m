//
//  IntegralDetailTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "IntegralDetailTableViewCell.h"

@interface IntegralDetailTableViewCell ()
@property (nonatomic, strong) UILabel *timeLb;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *integralNumLb;
@property (nonatomic, strong) UIView *lineTop;
@property (nonatomic, strong) UIView *lineBottom;
@end

@implementation IntegralDetailTableViewCell
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
    [self addSubview:self.timeLb];
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(6);
    }];
    [self addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLb);
        make.top.equalTo(_timeLb.mas_bottom).offset(10);
    }];
    [self addSubview:self.integralNumLb];
    [_integralNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(_titleLb);
    }];
    [self addSubview:self.lineTop];
    [_lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLb);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth - 40));
        make.height.equalTo(@(0.5));
    }];
    [self addSubview:self.lineBottom];
    [_lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLb);
        make.top.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(@(kDeviceWidth - 40));
        make.height.equalTo(@(0.5));
    }];
}
- (UILabel *)timeLb
{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        _timeLb.text = @"2015-06-19  13:18";
        _timeLb.textColor = RGBACOLOR(0, 0, 0, 0.7);
        _timeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _timeLb;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"普吉岛航班未成行返还记录";
        _titleLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _titleLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _titleLb;
}
- (UILabel *)integralNumLb
{
    if (!_integralNumLb) {
        _integralNumLb = [UILabel new];
        _integralNumLb.text = @"＋600";
        _integralNumLb.textColor = RGBACOLOR(238, 42, 42, 1);
        _integralNumLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _integralNumLb;
}
- (UIView *)lineTop
{
    if (!_lineTop) {
        _lineTop = [UIView new];
        _lineTop.hidden = YES;
        _lineTop.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _lineTop;
}
- (UIView *)lineBottom
{
    if (!_lineBottom) {
        _lineBottom = [UIView new];
        _lineBottom.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _lineBottom;
}
- (void)translateDataToCell:(NSInteger)index
{
    if (index == 0) {
        _lineTop.hidden = NO;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
