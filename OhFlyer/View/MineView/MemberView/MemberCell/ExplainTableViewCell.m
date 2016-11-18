//
//  ExplainTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ExplainTableViewCell.h"
#import "UILabel+StringFrame.h"

@interface ExplainTableViewCell ()

@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *contentLb;

@end

@implementation ExplainTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        [self InitWithSubViews];
    }
    
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(20);
    }];
    
    [self addSubview:self.contentLb];
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLb);
        make.top.equalTo(_titleLb.mas_bottom).offset(5);
        make.width.equalTo(@(kDeviceWidth - 40));
        make.height.equalTo(@(_labelSize.height));
    }];
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.textAlignment = NSTextAlignmentLeft;
        _titleLb.text = @"1.会员等级：银卡、金卡、黑卡";
        _titleLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    }
    return _titleLb;
}
- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.textAlignment = NSTextAlignmentLeft;
        _contentLb.text = @"如何成为会员？\n凡在OhFlyer注册成功后并选择产品下单成功即可成为银卡会员，拥有你的云端飞行服务管家。\n会员可享受什么优惠政策？\n我们将为会员提供更多的便利及优惠。比如说在同等的条件下，会员拥有优先包机的权利；再比如会员可以享受到累计积分，当你到达一定的积分是可以享受到多种优惠促销政策；同时在我们条件允许的情况下，会员可以挑选喜欢的机组为其服务；（还有很多服务如增加机组、机上宣传册、餐具刻名、机身喷绘）。\n会员积分相当于多少钱？\n 1会员积分，相当于人民币1元，可用于飞行使用。";
        _contentLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _contentLb.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLb.textColor = [UIColor grayColor];
        _contentLb.numberOfLines = 0;
        _labelSize = [_contentLb boundingRectWithSize:CGSizeMake(kDeviceWidth-40, 0)];
    }
    return _contentLb;
}
+ (CGFloat)cellHeight:(NSString *)string
{
    CGRect r = [string boundingRectWithSize:CGSizeMake(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40),10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]} context:nil];
    
    return r.size.height + 40;
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
