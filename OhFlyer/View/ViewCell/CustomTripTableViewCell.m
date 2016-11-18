//
//  CustomTripTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/6.
//  Copyright © 2016年 向楠. All rights reserved.
//
#define kFT_buttonBgColor RGBCOLOR(246, 246, 246)
#import "CustomTripTableViewCell.h"
@interface CustomTripTableViewCell ()

@property (nonatomic, strong) UILabel *nameLb;

@end

@implementation CustomTripTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = kFT_buttonBgColor;
    [self InitWithSubViews];
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
}
- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.text = @"美国";
        _nameLb.textAlignment = NSTextAlignmentCenter;
        _nameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _nameLb;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.backgroundColor = [UIColor whiteColor];
        _nameLb.textColor = RGBCOLOR(233, 71, 9);
    }else{
        self.backgroundColor = kFT_buttonBgColor;
        _nameLb.textColor = [UIColor blackColor];
    }

    // Configure the view for the selected state
}

@end
