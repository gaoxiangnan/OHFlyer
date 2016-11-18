//
//  MD_OrderDetailCell.m
//  FlyShare
//
//  Created by 向楠 on 16/5/11.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "MD_OrderDetailCell.h"
#import "FTSaleProduct.h"
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
@interface MD_OrderDetailCell ()
{
    NSDictionary *_foodCHTypeDic;
    NSDictionary *_foodWETypeDic;
    NSDictionary *_foodPicLightDic;
}
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *datailView;
@property (nonatomic, strong) UILabel *headerNameLb;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) KeysModel *myKeysModel;

@end

@implementation MD_OrderDetailCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kFT_buttonBgColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
            _foodCHTypeDic = [NSDictionary dictionaryWithObjectsAndKeys:@"前菜",@"1",@"主菜",@"2",@"主食",@"3",@"甜品",@"4",@"酒水",@"5", nil];
            
            _foodWETypeDic = [NSDictionary dictionaryWithObjectsAndKeys:@"头盘",@"1",@"主菜",@"2",@"主食",@"3",@"甜品",@"4",@"酒水",@"5", nil];
        
            _foodPicLightDic = [NSDictionary dictionaryWithObjectsAndKeys:@"qiancai_light",@"1",@"zhucai_light",@"2",@"zhushi_light",@"3",@"tiandian_light",@"4",@"jiushui_light",@"5", nil];
        
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.headerView];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(8));
        make.top.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(4));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(46)));
        make.height.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(-4));
    }];
    [_headerView addSubview:self.headerImageView];
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_headerView);
        make.centerY.equalTo(@(kScaleFrom_iPhone5s_Desgin(-10)));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(18)));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(10)));
    }];
    [_headerView addSubview:self.headerNameLb];
    [_headerNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerView);
        make.top.equalTo(_headerImageView.mas_bottom);
        make.width.equalTo(_headerView);
    }];
    
    [self addSubview:self.datailView];
    [_datailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerView.mas_right).offset(kScaleFrom_iPhone5s_Desgin(8));
        make.top.equalTo(_headerView);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(250)));
        make.height.equalTo(_headerView);
    }];
    
    
    
}
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [UIView new];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}
- (UIView *)datailView{
    if (!_datailView) {
        _datailView = [UIView new];
        _datailView.backgroundColor = [UIColor whiteColor];
    }
    return _datailView;
}
- (UILabel *)headerNameLb{
    if (!_headerNameLb) {
        _headerNameLb = [UILabel new];
        _headerNameLb.textColor = [UIColor orangeColor];
        _headerNameLb.textAlignment = NSTextAlignmentCenter;
        _headerNameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _headerNameLb;
}
- (UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [UIImageView new];
        
    }
    return _headerImageView;
}
- (void)translateData:(KeysModel *)keysModel
{
    self.myKeysModel = keysModel;
    
    if ([keysModel.typeKeys isEqualToString:@"1"]) {
        _headerNameLb.text = [_foodCHTypeDic objectForKey:keysModel.keys];
    }else{
        _headerNameLb.text = [_foodWETypeDic objectForKey:keysModel.keys];
    }
    _headerImageView.image = [UIImage imageNamed:[_foodPicLightDic objectForKey:keysModel.keys]];
    
    
    for (int i = 0; i < keysModel.proArr.count; i++) {
        
        FTSaleProduct *proModel = keysModel.proArr[i];
        
        UILabel *canshiNameLb = [UILabel new];
        canshiNameLb.text = [NSString stringWithFormat:@"%@",proModel.mealName];
        canshiNameLb.textColor = [UIColor blackColor];
        canshiNameLb.textAlignment = NSTextAlignmentLeft;
        canshiNameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_datailView addSubview:canshiNameLb];
        [canshiNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_datailView).offset(kScaleFrom_iPhone5s_Desgin(15));
            make.top.equalTo(_datailView).offset(kScaleFrom_iPhone5s_Desgin(15)+kScaleFrom_iPhone5s_Desgin(20)*i);
            make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(250)/2));
            make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(20)));
        }];
        
        UILabel *numLb = [UILabel new];
        numLb.text = [NSString stringWithFormat:@"%@ 份",proModel.mealNum];
        numLb.textColor = [UIColor blackColor];
        numLb.textAlignment = NSTextAlignmentLeft;
        numLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        
        [_datailView addSubview:numLb];
        [numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(canshiNameLb.mas_right).offset(kScaleFrom_iPhone5s_Desgin(10));
            make.top.equalTo(_datailView).offset(kScaleFrom_iPhone5s_Desgin(15)+kScaleFrom_iPhone5s_Desgin(20)*i);
            make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(250)/2-10));
            make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(20)));
        }];
        
    }
}
+ (CGFloat)cellHeight:(KeysModel *)keysModel
{
    return keysModel.proArr.count * kScaleFrom_iPhone5s_Desgin(20) + kScaleFrom_iPhone5s_Desgin(30);
//    return 80;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
