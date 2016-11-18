//
//  HomeTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIView+DrawLine.h"
@interface HomeTableViewCell()
@property (nonatomic, strong) UIImageView *contentImV;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *contentLb;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation HomeTableViewCell
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
    [self addSubview:self.contentImV];
    [_contentImV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(10);
        make.width.equalTo(@(kDeviceWidth-20));
        make.height.equalTo(@(170));
    }];
    
    [self addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(_contentImV.mas_bottom).offset(10);
        make.width.equalTo(@(kDeviceWidth-40));
    }];
    
    [self addSubview:self.contentLb];
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLb);
        make.top.equalTo(_titleLb.mas_bottom).offset(10);
    }];
    
    
    [self addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
//    [self addLineUp:NO andDown:YES andColor:RGBCOLOR(230, 230, 230)];
    
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = RGBACOLOR(230, 230, 230, 0.5);
    }
    return _lineView;
}
- (UIImageView *)contentImV
{
    if (!_contentImV) {
        _contentImV = [UIImageView new];
        [_contentImV sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"home.png"]];
    }
    return _contentImV;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.textColor = [UIColor blackColor];
        _titleLb.numberOfLines = 0;
        _titleLb.text = @"和赛车有个约会 | 第63届格兰披治赛车尊享之旅";
        _titleLb.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _titleLb.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLb;
}
- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.textColor = RGBACOLOR(0, 0, 0, 0.5);
        _contentLb.numberOfLines = 0;
        _contentLb.text = @"用共享经济做公务机平台，你翻牌我送礼";
        _contentLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _contentLb.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _contentLb;
}
+ (CGFloat)cellHeight
{
    CGRect r = [@"和赛车有个约会 | 第63届格兰披治赛车尊享之旅" boundingRectWithSize:CGSizeMake(kFT_scheduleBgViewWidth - kScaleFrom_iPhone5s_Desgin(80),10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular]} context:nil];
    return 230.0 +r.size.height;
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
