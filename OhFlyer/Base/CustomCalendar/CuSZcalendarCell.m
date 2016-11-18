//
//  CuSZcalendarCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CuSZcalendarCell.h"

@implementation CuSZcalendarCell
- (UIImageView *)dateImg
{
    if (!_dateImg) {
        _dateImg = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_dateImg];
    }
    return _dateImg;
}
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _dateLabel.textColor = [UIColor whiteColor];
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular]];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}
@end
