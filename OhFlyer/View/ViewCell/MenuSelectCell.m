//
//  MenuSelectCell.m
//  FlyShare
//
//  Created by 向楠 on 16/5/13.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "MenuSelectCell.h"
#import "BottomShadowView.h"
#import "UIBadgeView.h"

#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
@interface MenuSelectCell ()
{
    NSMutableArray *_sumArr;
}
@property (nonatomic, strong) BottomShadowView *bgView;
@property (nonatomic, strong) UIImageView *showImageView;
@property (nonatomic, strong) UILabel *showLb;
@property (nonatomic, strong) KeysModel *foodDType;;
@property (nonatomic, strong) NSDictionary *foodPicGrayDic;
@property (nonatomic, strong) NSDictionary *foodPicLightDic;
@property (nonatomic, assign) NSInteger passengerCount;

@end
@implementation MenuSelectCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.backgroundColor = kFT_buttonBgColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _foodPicGrayDic = [NSDictionary dictionaryWithObjectsAndKeys:@"qiancai_gray",@"1",@"zhucai_gray",@"2",@"zhushi_gray",@"3",@"tiandian_gray",@"4",@"jiushui_gray",@"5", nil];
        _foodPicLightDic = [NSDictionary dictionaryWithObjectsAndKeys:@"qiancai_light",@"1",@"zhucai_light",@"2",@"zhushi_light",@"3",@"tiandian_light",@"4",@"jiushui_light",@"5", nil];
        _sumArr = [[NSMutableArray alloc]initWithCapacity:0];
        
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)InitWithSubViews
{
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self);
    }];
    
    [_bgView addSubview:self.showImageView];
    [_showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(26));
        make.top.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(15));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(18)));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(13)));
    }];
    [_bgView addSubview:self.showLb];
    [_showLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showImageView);
        make.top.equalTo(_showImageView.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(3));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(24)));
    }];
}
- (BottomShadowView *)bgView{
    if (!_bgView) {
        _bgView = [BottomShadowView new];
        _bgView.backgroundColor = kFT_buttonBgColor;
    }
    return _bgView;
}
- (UIImageView *)showImageView{
    if (!_showImageView) {
        _showImageView = [UIImageView new];
        _showImageView.image = [UIImage imageNamed:@"zhushi_light"];
    }
    return _showImageView;
}
- (UILabel *)showLb{
    if (!_showLb) {
        _showLb = [UILabel new];
        _showLb.text = @"主食";
        _showLb.textColor = [UIColor grayColor];
        _showLb.textAlignment = NSTextAlignmentLeft;
        _showLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
    }
    return _showLb;
}
- (void)tip
{
    
}
- (void)translateDataType:(FoodSelectType)type passengerCount:(NSInteger)passengerCount andData:(KeysModel *)mealType
{
    self.foodDType = mealType;
    self.passengerCount = passengerCount;
    
    [_sumArr removeAllObjects];
    
    for (FTSaleProduct *model in mealType.proArr) {
        [_sumArr addObject:model.mealNum];
    }
    NSNumber *sum = [_sumArr valueForKeyPath:@"@sum.floatValue"];
    
    KeysModel *model = [[KeysModel alloc]init];
    model.keys = mealType.keys;
    model.typeKeys = [NSString stringWithFormat:@"%@",sum];
    
    UIBadgeView *badgeV = [self viewWithTag:1000];
    if(badgeV){
        if ([sum intValue] > 0) {
            badgeV.hidden = NO;
        }else{
            badgeV.hidden = YES;
        }
        [badgeV setBadgeValue:[NSString stringWithFormat:@"%@",sum]];
        [badgeV setCenter:CGPointMake(kScaleFrom_iPhone5s_Desgin(60), 24)];
    }
    
    NSDictionary *foodTypeDic;
    if (type == ChineseFood) {
        foodTypeDic = [NSDictionary dictionaryWithObjectsAndKeys:@"前菜",@"1",@"主菜",@"2",@"主食",@"3",@"甜品",@"4",@"酒水",@"5", nil];
        
    }else{
        foodTypeDic = [NSDictionary dictionaryWithObjectsAndKeys:@"头盘",@"1",@"主菜",@"2",@"主食",@"3",@"甜品",@"4",@"酒水",@"5", nil];
    }
    _showLb.text = [foodTypeDic objectForKey:mealType.keys];
    _showImageView.image = [UIImage imageNamed:[_foodPicGrayDic objectForKey:mealType.keys]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        _bgView.backgroundColor = [UIColor whiteColor];
        _showImageView.image = [UIImage imageNamed:[_foodPicLightDic objectForKey:self.foodDType.keys]];
    }else{
        _bgView.backgroundColor = kFT_buttonBgColor;
        _showImageView.image = [UIImage imageNamed:[_foodPicGrayDic objectForKey:self.foodDType.keys]];
    }
    // Configure the view for the selected state
}
+ (CGFloat)cellHeight{
    return kScaleFrom_iPhone5s_Desgin(64);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
