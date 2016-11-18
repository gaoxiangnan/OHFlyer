//
//  OrderDetailCell.m
//  FlyShare
//
//  Created by 向楠 on 16/5/5.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "UC_OrderDetailCell.h"
#import "Contacts.h"
#define kFT_scheduleBgViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(110))
#define kFT_scheduleViewWidth (kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40))

@implementation UC_OrderDetailCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(12);
    }];
    [self addSubview:self.cardNoLb];
    [_cardNoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(_nameLb.mas_bottom).offset(5);
    }];
    [self addSubview:self.line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
}
- (void)translateData:(FTSaleProduct *)model
{
    _nameLb.text = model.userName;
    _cardNoLb.text = [NSString stringWithFormat:@"%@ :%@",[Contacts convertToStringWithCardType:(NSNumber *)model.cardType],model.cardNo];
}
- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.textAlignment = NSTextAlignmentLeft;
        _nameLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        
    }
    return _nameLb;
}
- (UILabel *)cardNoLb
{
    if (!_cardNoLb) {
        _cardNoLb = [UILabel new];
        _cardNoLb.textAlignment = NSTextAlignmentLeft;
        _cardNoLb.textColor = RGBCOLOR(100, 101, 103);
        _cardNoLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        
    }
    return _cardNoLb;
}
- (UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line;
}
+ (CGFloat)cellHeight
{
    return 70.0;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
