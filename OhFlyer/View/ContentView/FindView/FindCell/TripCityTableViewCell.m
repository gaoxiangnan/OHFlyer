//
//  TripCityTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/8.
//  Copyright © 2016年 向楠. All rights reserved.
//
#define GAPWIDTH kScaleFrom_iPhone5s_Desgin(10)
#define BTNWIDTH kScaleFrom_iPhone5s_Desgin(62)
#define BTNHEIGHT kScaleFrom_iPhone5s_Desgin(25)
#import "TripCityTableViewCell.h"

@interface TripCityTableViewCell ()

@property (nonatomic, strong) UILabel *countryLb;
@property (nonatomic, strong) UIView *bgContentView;

@end

@implementation TripCityTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self InitWithSubViews];
    
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.countryLb];
    [_countryLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(10));
    }];
    
    [self addSubview:self.bgContentView];
    [_bgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_countryLb.mas_bottom).offset(5);
        make.width.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(5);
    }];
    [self createCountry];
}
- (UILabel *)countryLb
{
    if (!_countryLb) {
        _countryLb = [UILabel new];
        _countryLb.text = @"美国";
        _countryLb.textAlignment = NSTextAlignmentCenter;
        _countryLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _countryLb;
}
- (UIView *)bgContentView
{
    if (!_bgContentView) {
        _bgContentView = [UIView new];
        _bgContentView.backgroundColor = [UIColor purpleColor];
    }
    return _bgContentView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)createCountry
{
    for (int i = 0; i < 10; i++) {
        UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cityBtn.backgroundColor = [UIColor redColor];
        [cityBtn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [cityBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        int aa = (int)i/4;
        cityBtn.tag = 10000 + i;
        [cityBtn addTarget:self action:@selector(attentionAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_bgContentView addSubview:cityBtn];
        [cityBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_bgContentView).offset(kScaleFrom_iPhone5s_Desgin(20) +GAPWIDTH*(i%4) + BTNWIDTH*(i%4));
            
            make.top.equalTo(_bgContentView).offset(kScaleFrom_iPhone5s_Desgin(10)+kScaleFrom_iPhone5s_Desgin(10)*(aa)+BTNHEIGHT*(aa));
            
            make.width.equalTo(@(BTNWIDTH));
            make.height.equalTo(@(BTNHEIGHT));
        }];
    }
}
- (void)attentionAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
