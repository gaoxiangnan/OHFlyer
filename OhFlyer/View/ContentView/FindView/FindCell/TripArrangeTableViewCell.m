//
//  TripArrangeTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/21.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TripArrangeTableViewCell.h"

@interface TripArrangeTableViewCell ()
{
    NSString *_string;
}
@property (nonatomic, strong) UIImageView *showImg;
@property (nonatomic, strong) UILabel *numStepLb;

@property (nonatomic, strong) UILabel *stepType;
@property (nonatomic, strong) UILabel *startLb;
@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UILabel *arriveLb;
@property (nonatomic, strong) UIImageView *foodImg;
@property (nonatomic, strong) UILabel *foodLb;
@property (nonatomic, strong) UILabel *breakfastLb;

@property (nonatomic, strong) UIImageView *hotelImg;
@property (nonatomic, strong) UILabel *hotelLb;
@property (nonatomic, strong) UILabel *hotelName;

@property (nonatomic, strong) UIImageView *travelImg;
@property (nonatomic, strong) UILabel *travelLb;
@property (nonatomic, strong) UILabel *travelName;

@property (nonatomic, strong) UIImageView *showOnePic;
@property (nonatomic, strong) UIImageView *showTwoPic;

@property (nonatomic, strong) UILabel *contentLb;

@property (nonatomic, strong) UIView *shuLine;

@end

@implementation TripArrangeTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _string = @"酒店早餐后取驱车前往曼雅拉湖-她依偎在雄伟壮观的东非大裂谷悬崖之下，海明威曾赞叹曼雅拉湖是“我见过的非洲最可爱的地方”。今天她仍然是一颗风景秀丽";
        [self InitWithSubViews];
    }
    
    return self;
}
- (UIImageView *)showImg
{
    if (!_showImg) {
        _showImg = [UIImageView new];
        _showImg.image = [UIImage imageNamed:@"step_num"];
    }
    return _showImg;
}
- (UILabel *)numStepLb
{
    if (!_numStepLb) {
        _numStepLb = [UILabel new];
        _numStepLb.text = @"NO.1";
        _numStepLb.textColor = [UIColor whiteColor];
        _numStepLb.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
    }
    return _numStepLb;
}
- (UILabel *)stepType
{
    if (!_stepType) {
        _stepType = [UILabel new];
        _stepType.text = @"Day1";
        _stepType.textColor = [UIColor blackColor];
        _stepType.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _stepType;
}
- (UILabel *)startLb
{
    if (!_startLb) {
        _startLb = [UILabel new];
        _startLb.text = @"上海";
        _startLb.textAlignment = NSTextAlignmentLeft;
        _startLb.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    }
    return _startLb;
}
- (UILabel *)arriveLb
{
    if (!_arriveLb) {
        _arriveLb = [UILabel new];
        _arriveLb.text = @"墨尔本";
        _arriveLb.textAlignment = NSTextAlignmentLeft;
        _arriveLb.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    }
    return _arriveLb;
}
- (UIImageView *)arrowImg
{
    if (!_arrowImg) {
        _arrowImg = [UIImageView new];
        _arrowImg.image = [UIImage imageNamed:@"start_detail"];
    }
    return _arrowImg;
}
- (UIImageView *)foodImg
{
    if (!_foodImg) {
        _foodImg = [UIImageView new];
        _foodImg.image = [UIImage imageNamed:@"food_detail"];
    }
    return _foodImg;
}
- (UILabel *)foodLb
{
    if (!_foodLb) {
        _foodLb = [UILabel new];
        _foodLb.text = @"餐饮：";
        _foodLb.textAlignment = NSTextAlignmentLeft;
        _foodLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _foodLb;
}
- (UILabel *)breakfastLb
{
    if (!_breakfastLb) {
        _breakfastLb = [UILabel new];
        _breakfastLb.text = @"早餐：自理";
        _breakfastLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _breakfastLb.textAlignment = NSTextAlignmentLeft;
        _breakfastLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _breakfastLb;
}

- (UIImageView *)hotelImg
{
    if (!_hotelImg) {
        _hotelImg = [UIImageView new];
        _hotelImg.image = [UIImage imageNamed:@"hotel_detail"];
    }
    return _hotelImg;
}
- (UILabel *)hotelLb
{
    if (!_hotelLb) {
        _hotelLb = [UILabel new];
        _hotelLb.text = @"住宿";
        _hotelLb.textColor = [UIColor blackColor];
        _hotelLb.textAlignment = NSTextAlignmentLeft;
        _hotelLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _hotelLb;
}
- (UILabel *)hotelName
{
    if (!_hotelName) {
        _hotelName = [UILabel new];
        _hotelName.text = @"五星豪华酒店";
        _hotelName.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _hotelName.textAlignment = NSTextAlignmentLeft;
        _hotelName.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _hotelName;
}
- (UIImageView *)travelImg
{
    if (!_travelImg) {
        _travelImg = [UIImageView new];
        _travelImg.image = [UIImage imageNamed:@"travel_detail"];
    }
    return _travelImg;
}
- (UILabel *)travelLb
{
    if (!_travelLb) {
        _travelLb = [UILabel new];
        _travelLb.text = @"行程";
        _travelLb.textColor = [UIColor blackColor];
        _travelLb.textAlignment = NSTextAlignmentLeft;
        _travelLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _travelLb;
}
- (UILabel *)travelName
{
    if (!_travelName) {
        _travelName = [UILabel new];
        _travelName.text = @"曼雅拉湖树屋";
        _travelName.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _travelName.textAlignment = NSTextAlignmentLeft;
        _travelName.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _travelName;
}
- (UIImageView *)showOnePic
{
    if (!_showOnePic) {
        _showOnePic = [UIImageView new];
        _showOnePic.image = [UIImage imageNamed:@"Group4"];
        _showOnePic.userInteractionEnabled=YES;
        UITapGestureRecognizer *picTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSelectPic:)];
        [_showOnePic addGestureRecognizer:picTap];
    }
    return _showOnePic;
}
- (UIImageView *)showTwoPic
{
    if (!_showTwoPic) {
        _showTwoPic = [UIImageView new];
        _showTwoPic.userInteractionEnabled=YES;
        _showTwoPic.image = [UIImage imageNamed:@"Group5"];
        UITapGestureRecognizer *picTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSelectPic:)];
        [_showTwoPic addGestureRecognizer:picTap];
    }
    return _showTwoPic;
}
- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.text = @"酒店早餐后取驱车前往曼雅拉湖-她依偎在雄伟壮观的东非大裂谷悬崖之下，海明威曾赞叹曼雅拉湖是“我见过的非洲最可爱的地方”。今天她仍然是一颗风景秀丽";
        _contentLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _contentLb.textAlignment = NSTextAlignmentLeft;
        _contentLb.numberOfLines = 0;
        _contentLb.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    }
    return _contentLb;
}
- (UIView *)shuLine
{
    if (!_shuLine) {
        _shuLine = [UIView new];
        _shuLine.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _shuLine;
}
- (void)InitWithSubViews
{
    [self addSubview:self.showImg];
    [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(10);
    }];
    [self addSubview:self.numStepLb];
    [_numStepLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_showImg);
    }];
    
    [self addSubview:self.shuLine];
    [_shuLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_showImg);
        make.top.equalTo(_showImg.mas_bottom).offset(10);
        make.width.equalTo(@(1));
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    [self addSubview:self.stepType];
    [_stepType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showImg.mas_right).offset(10);
        make.centerY.equalTo(_showImg);
    }];
    [self addSubview:self.startLb];
    [_startLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_stepType.mas_right).offset(10);
        make.centerY.equalTo(_showImg);
    }];
    [self addSubview:self.arrowImg];
    [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startLb.mas_right).offset(10);
        make.top.equalTo(_startLb);
    }];
    [self addSubview:self.arriveLb];
    [_arriveLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_arrowImg.mas_right).offset(10);
        make.top.equalTo(_startLb);
    }];
    [self addSubview:self.foodImg];
    [_foodImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_stepType);
        make.top.equalTo(_stepType.mas_bottom).offset(10);
    }];
    [self addSubview:self.foodLb];
    [_foodLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_foodImg.mas_right).offset(5);
        make.top.equalTo(_foodImg);
    }];
    [self addSubview:self.breakfastLb];
    [_breakfastLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_foodLb.mas_right).offset(5);
        make.top.equalTo(_foodLb);
    }];
    
    [self addSubview:self.hotelImg];
    [_hotelImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_foodImg);
        make.top.equalTo(_breakfastLb.mas_bottom).offset(15);
    }];
    [self addSubview:self.hotelLb];
    [_hotelLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_foodLb);
        make.top.equalTo(_hotelImg);
    }];
    [self addSubview:self.hotelName];
    [_hotelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotelLb.mas_right).offset(5);
        make.top.equalTo(_hotelLb);
    }];
    
    [self addSubview:self.travelImg];
    [_travelImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotelImg);
        make.top.equalTo(_hotelLb.mas_bottom).offset(15);
    }];
    [self addSubview:self.travelLb];
    [_travelLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotelLb);
        make.top.equalTo(_travelImg);
    }];
    [self addSubview:self.travelName];
    [_travelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_travelLb.mas_right).offset(5);
        make.top.equalTo(_travelLb);
    }];
    
    [self addSubview:self.showOnePic];
    [_showOnePic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_travelImg);
        make.top.equalTo(_travelImg.mas_bottom).offset(15);
    }];
    [self addSubview:self.showTwoPic];
    [_showTwoPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-30);
        make.top.equalTo(_showOnePic);
    }];
    
    
    
    [self addSubview:self.contentLb];
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_stepType);
        make.top.equalTo(_showOnePic.mas_bottom).offset(5);
        make.width.equalTo(@(kDeviceWidth-29-60));
    }];
}
- (void)onSelectPic:(UITapGestureRecognizer *)sender
{
    NSLog(@"我点了图片");
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
