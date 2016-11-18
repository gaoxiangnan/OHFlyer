//
//  CustomCityTableCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CustomCityTableCell.h"
@interface CustomCityTableCell ()


@end
@implementation CustomCityTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self);
    }];
}
- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.text = @"美国";
        _nameLb.textAlignment = NSTextAlignmentCenter;
        _nameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }
    return _nameLb;
}
- (void)setChecked:(BOOL)checked
{
    
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
