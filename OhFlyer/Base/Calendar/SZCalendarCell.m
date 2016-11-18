//
//  SZCalendarCell.m
//  SZCalendarPicker
//
//  Created by Stephen Zhuang on 14/12/1.
//  Copyright (c) 2014年 Stephen Zhuang. All rights reserved.
//

#import "SZCalendarCell.h"

@implementation SZCalendarCell
- (UIImageView *)dateImg
{
    if (!_dateImg) {
        _dateImg = [[UIImageView alloc]initWithFrame:self.bounds];
        //        _dateImg.backgroundColor = [UIColor blackColor];
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
