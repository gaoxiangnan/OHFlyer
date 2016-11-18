//
//  OHCalendarCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/28.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "OHCalendarCell.h"

@implementation OHCalendarCell
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 2, self.bounds.size.width, self.bounds.size.height-2)];
        _bgView.backgroundColor = RGBCOLOR(251, 251, 251);
        [self addSubview:_bgView];
    }
    return _bgView;
}
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, self.bounds.size.width, self.bounds.size.height/5*2)];
        _dateLabel.textColor = [UIColor whiteColor];
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular]];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}
- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height/5*2+8, self.bounds.size.width, self.bounds.size.height/5*2)];
        _priceLabel.textColor = RGBCOLOR(233, 71, 9);
        [_priceLabel setTextAlignment:NSTextAlignmentCenter];
        [_priceLabel setFont:[UIFont systemFontOfSize:12 weight:UIFontWeightLight]];
        [self addSubview:_priceLabel];
    }
    return _priceLabel;
}
@end
