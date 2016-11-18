//
//  FoodSelectCell.m
//  FlyShare
//
//  Created by 向楠 on 16/5/12.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "FoodSelectCell.h"
#import "UIImageView+WebCache.h"
@interface FoodSelectCell()
{
    int _menuValue;
    int _allValue;
    NSMutableArray *_sumArr;
}
@property (nonatomic, strong) FTSaleProduct *myModel;
@property (nonatomic, strong) UIImageView *showImageView;
@property (nonatomic, strong) UILabel *foodNameLb;
@property (nonatomic, strong) UIView *bgImView;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIImageView *bgChangeImageView;
@property (nonatomic, strong) UIButton *jiaBtn;
@property (nonatomic, strong) UIButton *jianBtn;
@property (nonatomic, strong) UILabel *numLb;

@property (nonatomic, assign) NSInteger passengerCount;
@property (nonatomic, strong) NSString *mealDType;
@property (nonatomic, strong) NSMutableArray *sumArr;

@end
@implementation FoodSelectCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _menuValue = 0;
        _allValue = 0;
        _jiaBtn.userInteractionEnabled = YES;
        _sumArr = [[NSMutableArray alloc]initWithCapacity:0];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkOutAllLimit:) name:@"checkOutAllLimit" object:nil];
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)checkOutAllLimit:(NSNotification *)notif
{
    [_sumArr removeAllObjects];
    FTSaleProduct *proModel = notif.object;
    for (FTSaleProduct *model in proModel.mealData) {
        if ([model.mealDType isEqualToString:self.mealDType]) {
            [_sumArr addObject:model.mealNum];
        }
    }
    NSNumber *sum = [_sumArr valueForKeyPath:@"@sum.floatValue"];
    if ([sum intValue] >= self.passengerCount) {
        _jiaBtn.userInteractionEnabled = NO;
    }
    
}
- (void)InitWithSubViews
{
    [self addSubview:self.showImageView];
    [_showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(15));
        make.top.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(15));
        make.width.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(62)));
    }];
    [self addSubview:self.foodNameLb];
    [_foodNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(92));;
        make.top.equalTo(_showImageView);
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(132)));
    }];
    
    [self addSubview:self.bgImView];
    [_bgImView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(-15));
        make.top.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(52));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(26)));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(71)));
    }];
    
    
    [_bgImView addSubview:self.bgChangeImageView];
    _bgChangeImageView.hidden = YES;
    [_bgChangeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.width.equalTo(_bgImView);
    }];
    
    [_bgImView addSubview:self.jiaBtn];
    [_jiaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgImView);
        make.top.equalTo(_bgImView);
        make.width.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(26)));
    }];
    [_bgImView addSubview:self.jianBtn];
    _jianBtn.hidden = YES;
    [_jianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgImView);
        make.top.equalTo(_bgImView);
        make.width.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(26)));
    }];
    [_bgImView addSubview:self.numLb];
    _numLb.hidden = YES;
    [_numLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jianBtn.mas_right);
        make.right.equalTo(_jiaBtn.mas_left);
        make.top.equalTo(_bgImView).offset(kScaleFrom_iPhone5s_Desgin(5));
    }];
    
    [self addSubview:self.line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(10));
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(@(self.frame.size.width - 20));
        make.height.equalTo(@(0.5));
    }];
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
- (UIImageView *)showImageView{
    if (!_showImageView) {
        _showImageView = [UIImageView new];
    }
    return _showImageView;
}
- (UIView *)bgImView{
    if (!_bgImView) {
        _bgImView = [UIView new];
    }
    return _bgImView;
}
- (UIImageView *)bgChangeImageView{
    if (!_bgChangeImageView) {
        _bgChangeImageView = [UIImageView new];
        _bgChangeImageView.image = [UIImage imageNamed:@"change_btn"];
    }
    return _bgChangeImageView;
}
- (UIButton *)jiaBtn{
    if (!_jiaBtn) {
        _jiaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _jiaBtn.tag = 30001;
        [_jiaBtn setBackgroundImage:[UIImage imageNamed:@"add_btn"] forState:UIControlStateNormal];
        [_jiaBtn addTarget:self action:@selector(onAddFoodNumBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jiaBtn;
}
- (UIButton *)jianBtn{
    if (!_jianBtn) {
        _jianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _jianBtn.tag = 30002;
        [_jianBtn addTarget:self action:@selector(onAddFoodNumBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jianBtn;
}
- (UILabel *)numLb{
    if (!_numLb) {
        _numLb = [UILabel new];
        _numLb.textAlignment = NSTextAlignmentCenter;
        _numLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _numLb;
}
- (UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}
- (void)onAddFoodNumBtn:(UIButton *)sender
{
    
    if([self.myModel.mealNum intValue] < 1){
        self.myModel.mealNum = @"0";
        _menuValue = 0;
        _jianBtn.hidden = YES;
        _numLb.hidden = YES;
        _bgChangeImageView.hidden = YES;
    }
    _menuValue = (self.myModel.mealNum.length)?[self.myModel.mealNum intValue]:0;
    
    if (sender.tag == 30001) {
        _menuValue ++;
        if (_menuValue > self.passengerCount) {
            kTipAlert(@"超过人数限制");
            return;
        }
        [UIView animateWithDuration:3 animations:^{
            _jianBtn.hidden = NO;
            _numLb.hidden = NO;
            _numLb.text = [NSString stringWithFormat:@"%d",_menuValue];
            self.myModel.mealNum = _numLb.text;
            _bgChangeImageView.hidden = NO;
        }];
    }else{
        [UIView animateWithDuration:3 animations:^{
            _jiaBtn.userInteractionEnabled = YES;
            _menuValue --;
            _numLb.text = [NSString stringWithFormat:@"%d",_menuValue];
            self.myModel.mealNum = _numLb.text;
            if (_menuValue <= 0) {
                _jianBtn.hidden = YES;
                _numLb.hidden = YES;
                _bgChangeImageView.hidden = YES;
            }
        }];
    }
    if (_myBlock) {
        _myBlock(self.myModel);
    }
}
- (void)translateData:(FTSaleProduct *)model passengerCount:(NSInteger)passengerCount mealDType:(NSString *)mealDType
{
    self.myModel = model;
    self.passengerCount = passengerCount;
    self.mealDType = mealDType;
//    _jiaBtn.userInteractionEnabled = YES;
    if([self.myModel.mealNum intValue] < 1){
        self.myModel.mealNum = @"0";
        _menuValue = 0;
        _jianBtn.hidden = YES;
        _numLb.hidden = YES;
        _bgChangeImageView.hidden = YES;
    }else{
        _jianBtn.hidden = NO;
        _numLb.hidden = NO;
        _bgChangeImageView.hidden = NO;
    }
    _menuValue = (self.myModel.mealNum.length)?[self.myModel.mealNum intValue]:0;
    
    [_showImageView sd_setImageWithURL:[NSURL URLWithString:model.mealUrl] placeholderImage:kChosenPlaceHolderImage];
    _foodNameLb.text = model.mealName;
    self.numLb.text = (model.mealNum.length)?model.mealNum:@"0";
    
}
- (void)translateAllData:(FTSaleProduct *)allModel mealDType:(NSString *)mealDType
{
    [_sumArr removeAllObjects];
    for (FTSaleProduct *model in allModel.mealData) {
        if ([model.mealDType isEqualToString:mealDType]) {
            [_sumArr addObject:model.mealNum];
        }
    }
    NSNumber *sum = [_sumArr valueForKeyPath:@"@sum.floatValue"];
    if ([sum intValue] >= self.passengerCount) {
        _jiaBtn.userInteractionEnabled = NO;
    }else{
        _jiaBtn.userInteractionEnabled = YES    ;
    }
}
+ (CGFloat)cellHeight{
    return 93;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
