//
//  CollectTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/16.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CollectTableViewCell.h"
@interface CollectTableViewCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UIImageView *showPriceImg;
@property (nonatomic, strong) UILabel *showPriceLb;
@property (nonatomic, strong) UILabel *priceLb;
@property (nonatomic, strong) UIImageView *showHotImg;
@property (nonatomic, strong) UILabel *hotLb;

@property (nonatomic, strong) UIImageView *productImg;

@end
@implementation CollectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self InitWithSubViews];
    }
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.width.equalTo(self);
        make.height.equalTo(@(108));
    }];
    
    [_bgView addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(20);
        make.top.equalTo(_bgView).offset(12);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(235)));
    }];
    
    
    [_bgView addSubview:self.showPriceImg];
    [_showPriceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLb);
        make.top.equalTo(_titleLb.mas_bottom).offset(7);
    }];
    
    [_bgView addSubview:self.showPriceLb];
    [_showPriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceImg.mas_right).offset(6);
        make.top.equalTo(_showPriceImg);
    }];
    
    [_bgView addSubview:self.priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceLb.mas_right).offset(6);
        make.top.equalTo(_showPriceImg.mas_bottom);
    }];
    
    
    
    [_bgView addSubview:self.showHotImg];
    [_showHotImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showPriceImg);
        make.top.equalTo(_showPriceImg.mas_bottom).offset(20);
    }];
    
    [_bgView addSubview:self.hotLb];
    [_hotLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showHotImg.mas_right).offset(6);
        make.top.equalTo(_showHotImg);
    }];
    
    [_bgView addSubview:self.productImg];
    [_productImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(_bgView).offset(-20);
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
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"澳大利亚悉尼+布里斯班10日8晚跟团游(4钻)·纯玩行程";
        _titleLb.textColor = [UIColor blackColor];
        _titleLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _titleLb.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}
- (UIImageView *)showPriceImg
{
    if (!_showPriceImg) {
        _showPriceImg = [UIImageView new];
        _showPriceImg.image = [UIImage imageNamed:@""];
    }
    return _showPriceImg;
}
- (UILabel *)showPriceLb
{
    if (!_showPriceLb) {
        _showPriceLb = [UILabel new];
        _showPriceLb.text = @"参考价格：";
        _showPriceLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _showPriceLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _showPriceLb;
}

- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.text = @"¥5500";
        _priceLb.textColor = RGBACOLOR(238, 42, 42, 1);
        _priceLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _priceLb;
}
- (UIImageView *)showHotImg
{
    if (!_showHotImg) {
        _showHotImg = [UIImageView new];
        _showHotImg.image = [UIImage imageNamed:@"product_img"];
    }
    return _showHotImg;
}
- (UILabel *)hotLb
{
    if (!_hotLb) {
        _hotLb = [UILabel new];
        _hotLb.text = @"销量领先，万人关注，无购物";
        _hotLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _hotLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _hotLb;
}
- (UIImageView *)productImg
{
    if (!_productImg) {
        _productImg = [UIImageView new];
        _productImg.image = [UIImage imageNamed:@"pruduct_img"];
    }
    return _productImg;
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
