//
//  RecommendCell.m
//  FlyShare
//
//  Created by 向楠 on 16/5/13.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "RecommendCell.h"
#import "UIImageView+WebCache.h"

#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
@interface RecommendCell()
@property (nonatomic, strong) UIImageView *showImageView;
@property (nonatomic, strong) UILabel *foodNameLb;
@property (nonatomic, strong) UIImageView *foodImageView;
@property (nonatomic, strong) UILabel *foodClassLb;
@property (nonatomic, strong) UILabel *foodNumLb;
@property (nonatomic, strong) UIView *bgView;
@end
@implementation RecommendCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kFT_buttonBgColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(8));
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(-8));
    }];
    [_bgView addSubview:self.showImageView];
    [_showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(15));
        make.top.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(15));
        make.width.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(62)));
    }];
    [_bgView addSubview:self.foodNameLb];
    [_foodNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(92));;
        make.top.equalTo(_showImageView);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(132)));
    }];
//    [_bgView addSubview:self.foodImageView];
//    [_foodImageView makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(82));
//        make.top.equalTo(_foodNameLb).offset(kScaleFrom_iPhone5s_Desgin(10));
//    }];
    [_bgView addSubview:self.foodClassLb];
    [_foodClassLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(97));
        make.top.equalTo(_foodNameLb.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(4));
    }];
    [_bgView addSubview:self.foodNumLb];
    [_foodNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(-20));
        make.top.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(31));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(28)));
    }];
    
}
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
- (UILabel *)foodNameLb{
    if (!_foodNameLb) {
        _foodNameLb = [UILabel new];
        _foodNameLb.lineBreakMode = NSLineBreakByWordWrapping;
        _foodNameLb.numberOfLines = 0;
        _foodNameLb.textAlignment = NSTextAlignmentLeft;
        _foodNameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _foodNameLb;
}
- (UILabel *)foodClassLb{
    if (!_foodClassLb) {
        _foodClassLb = [UILabel new];
        _foodClassLb.textColor = [UIColor grayColor];
        _foodClassLb.textAlignment = NSTextAlignmentLeft;
        _foodClassLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
    }
    return _foodClassLb;
}
- (UILabel *)foodNumLb{
    if (!_foodNumLb) {
        _foodNumLb = [UILabel new];
        _foodNumLb.numberOfLines = 0;
        _foodNumLb.textAlignment = NSTextAlignmentLeft;
        _foodNumLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _foodNumLb;
}
- (UIImageView *)showImageView{
    if (!_showImageView) {
        _showImageView = [UIImageView new];
    }
    return _showImageView;
}
- (void)translateFoodType:(FoodSelectType)type Data:(FTSaleProduct *)model
{
    NSDictionary *foodTypeDic;
    if (type == ChineseFood) {
        foodTypeDic = [NSDictionary dictionaryWithObjectsAndKeys:@"前菜",@"1",@"主菜",@"2",@"主食",@"3",@"甜品",@"4",@"酒水",@"5", nil];
        
    }else{
        foodTypeDic = [NSDictionary dictionaryWithObjectsAndKeys:@"头盘",@"1",@"主菜",@"2",@"主食",@"3",@"甜品",@"4",@"酒水",@"5", nil];
    }
    
    [_showImageView sd_setImageWithURL:[NSURL URLWithString:model.mealUrl] placeholderImage:kChosenPlaceHolderImage];
    _foodNameLb.text = model.mealName;
    _foodNumLb.text = [NSString stringWithFormat:@"%@ 份",model.mealNum];
    _foodClassLb.text = [foodTypeDic objectForKey:model.mealDType];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
