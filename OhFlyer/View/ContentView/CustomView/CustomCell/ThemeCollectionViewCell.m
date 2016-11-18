//
//  ThemeCollectionViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/8.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ThemeCollectionViewCell.h"

@interface ThemeCollectionViewCell ()
@property (nonatomic, strong) UIImageView *showImg;


@end

@implementation ThemeCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.showImg];
    [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-10);
    }];
    [self addSubview:self.selectImg];
    [_selectImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-10);
    }];
    [self addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(25);
    }];
}
- (UIImageView *)showImg
{
    if (!_showImg) {
        _showImg = [UIImageView new];
        _showImg.image = [UIImage imageNamed:@"custom_study"];
    }
    return _showImg;
}
- (UIImageView *)selectImg
{
    if (!_selectImg) {
        _selectImg = [UIImageView new];
        _selectImg.hidden = YES;
        _selectImg.image = [UIImage imageNamed:@"custom_select"];
    }
    return _selectImg;
}
- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.text = @"亲子游学";
        _nameLb.textAlignment = NSTextAlignmentCenter;
        _nameLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
    return _nameLb;
}

@end
