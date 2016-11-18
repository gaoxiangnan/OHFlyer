//
//  ChartCityGroupCell.m
//  FlyShare
//
//  Created by zzxcc on 16/1/21.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "ChartCityGroupCell.h"

@interface ChartCityGroupCell()

@end

@implementation ChartCityGroupCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self InitWithSubViews];
    }
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.noDateLabel];
    [_noDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
}

- (UILabel *)noDateLabel
{
    if (!_noDateLabel) {
        _noDateLabel = [UILabel new];
        [_noDateLabel setText:@"暂无数据"];
        [_noDateLabel setTextColor:[UIColor grayColor]];
        [_noDateLabel setFont:[UIFont systemFontOfSize:14.0f]];
    }
    return _noDateLabel;
}

- (NSMutableArray *)arrayCityButtons
{
    if (!_arrayCityButtons) {
        _arrayCityButtons = [[NSMutableArray alloc] init];
    }
    return _arrayCityButtons;
}

- (void)setCityArray:(NSArray *)cityArray
{
    _cityArray = cityArray;
    self.noDateLabel.hidden = (cityArray && cityArray.count > 0);
    
    for (int i = 0; i < cityArray.count; i++) {
        CityModel *model = [cityArray objectAtIndex:i];
        UIButton *button;
        if (i < self.arrayCityButtons.count) {
            button = [self.arrayCityButtons objectAtIndex:i];
        }else{
            button = [[UIButton alloc] init];
            [button setBackgroundColor:kTableViewBGColor];
            button.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 3.0f;
            [button addTarget:self action:@selector(cityButtonDown:) forControlEvents:UIControlEventTouchUpInside];
            [self.arrayCityButtons addObject:button];
            [self addSubview:button];
        }
        [button setTitle:model.CityName forState:UIControlStateNormal];
        button.tag = i;
    }
    while (cityArray.count < self.arrayCityButtons.count) {
        [self.arrayCityButtons removeLastObject];
    }
}

- (void) cityButtonDown:(UIButton *)sender
{
    CityModel *city = [self.cityArray objectAtIndex:sender.tag];
    if (_delegate && [_delegate respondsToSelector:@selector(cityGroupCellDidSelectCity:)]) {
        [_delegate cityGroupCellDidSelectCity:city];
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    float x = 10;
    float y = 4;
 
    y += 6;
    float space = 11;            // 最小空隙
    float width = 86;     // button最小宽度
    int t = (kDeviceWidth - 10 - 30 + space) / (width + space);
    
    // 修正空隙宽度
    space = (kDeviceWidth - 10 - 30 - width * t) / (t - 1);
    
    if (space > 14) {                                                  // 修正button宽度
        width += (space - 14) * (t - 1) / t;
        space = 14;
    }
    
    for (int i = 0; i < self.arrayCityButtons.count; i ++) {
        UIButton *button = [self.arrayCityButtons objectAtIndex:i];
        [button setFrame:CGRectMake(x, y, 86, 32)];
        if ((i + 1) % t == 0) {
            y += 32 + 11;
            x = 10;
        }else {
            x += width + space;
        }
    }
}


+ (CGFloat) getCellHeightOfCityArray:(NSArray *)cityArray
{
    float h = 10;
    if (cityArray && cityArray.count > 0) {
        float space = 11;            // 最小空隙
        float width = 86;     // button最小宽度
        int t = (kDeviceWidth - 10 - 30 + space) / (width + space);
        
        space = (kDeviceWidth - 10 - 30 - width * t) / (t - 1);        // 修正空隙宽度
        if (space > 14) {                                                                // 修正button宽度
            width += (space - 14) * (t - 1) / t;
            space = 14;
        }
        
        h += (10 + (32 + 5) * (cityArray.count / t + (cityArray.count % t == 0 ? 0 : 1)));
    }
    else {
        h += 47;
    }
    return h;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
