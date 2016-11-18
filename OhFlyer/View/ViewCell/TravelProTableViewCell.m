//
//  TravelProTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/27.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TravelProTableViewCell.h"
@interface TravelProTableViewCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *proImg;
@property (nonatomic, strong) UILabel *proName;
@property (nonatomic, strong) UIImageView *showTitle;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UIImageView *showPrice;
@property (nonatomic, strong) UILabel *showPriceLb;
@property (nonatomic, strong) UILabel *priceLb;
@end
@implementation TravelProTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [_bgView addSubview:self.proImg];
    [_proImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(10);
        make.top.equalTo(_bgView);
    }];
    
    [_bgView addSubview:self.proName];
    [_proName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(16);
        make.top.equalTo(_proImg.mas_bottom).offset(8);
    }];
    [_bgView addSubview:self.showTitle];
    [_showTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_proName);
        make.top.equalTo(_proName.mas_bottom).offset(10);
    }];
    [_bgView addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTitle.mas_right).offset(5);
        make.centerY.equalTo(_showTitle);
    }];
    
    [_bgView addSubview:self.showPrice];
    [_showPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showTitle);
        make.top.equalTo(_showTitle.mas_bottom).offset(12);
    }];
    [_bgView addSubview:self.showPriceLb];
    [_showPriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPrice.mas_right).offset(5);
        make.centerY.equalTo(_showPrice);
    }];
    [_bgView addSubview:self.priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceLb.mas_right).offset(5);
        make.top.equalTo(_showPriceLb);
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
- (UIImageView *)proImg
{
    if (!_proImg) {
        _proImg = [UIImageView new];
        _proImg.image = [UIImage imageNamed:@"travel_img"];
    }
    return _proImg;
}
- (UILabel *)proName
{
    if (!_proName) {
        _proName = [UILabel new];
        _proName.text = @"马尔代夫班度士岛Bandos land4晚自助游";
        _proName.textColor = [UIColor blackColor];
        _proName.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _proName;
}
- (UIImageView *)showTitle
{
    if (!_showTitle) {
        _showTitle = [UIImageView new];
        _showTitle.image = [UIImage imageNamed:@"theme_travel"];
    }
    return _showTitle;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"主题：马尔代夫－自助游";
        _titleLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _titleLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _titleLb;
}
- (UIImageView *)showPrice
{
    if (!_showPrice) {
        _showPrice = [UIImageView new];
        _showPrice.image = [UIImage imageNamed:@"travel_price"];
    }
    return _showPrice;
}
- (UILabel *)showPriceLb
{
    if (!_showPriceLb) {
        _showPriceLb = [UILabel new];
        _showPriceLb.text = @"参考价格：";
        _showPriceLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _showPriceLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _showPriceLb;
}
- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.text = @"¥12,300";
        _priceLb.textColor = RGBACOLOR(233, 71, 9, 1);
        _priceLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _priceLb;
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
