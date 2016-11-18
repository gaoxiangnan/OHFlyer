//
//  MineMenuTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/8.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MineMenuTableViewCell.h"

@interface MineMenuTableViewCell ()
@property (nonatomic, strong) UIImageView *showImv;
@property (nonatomic, strong) UILabel *nameLb;
@property (nonatomic, strong) UIImageView *arrowImv;
@property (nonatomic, strong) UIView *line;



@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSArray *nameArr;

@end

@implementation MineMenuTableViewCell
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
    self.imageArr = [NSArray arrayWithObjects:@"all_message",@"menber_center",@"service_center",@"set_center", nil];
    self.nameArr = [NSArray arrayWithObjects:@"常用信息",@"会员中心",@"客服中心",@"设置", nil];
    
    [self addSubview:self.showImv];
    [_showImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self);
    }];
    
    
    
    
    [self addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showImv.mas_right).offset(20);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.arrowImv];
    [_arrowImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLb);
        make.top.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(@(kDeviceWidth - 80));
        make.height.equalTo(@(0.5));
    }];
}
- (UIImageView *)showImv
{
    if (!_showImv) {
        _showImv = [UIImageView new];
        
    }
    return _showImv;
}

- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        
        _nameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _nameLb.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLb;
}
- (UIImageView *)arrowImv
{
    if (!_arrowImv) {
        _arrowImv = [UIImageView new];
        _arrowImv.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _arrowImv;
}
- (UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = RGBACOLOR(239, 239, 239, 0.6);
    }
    return _line;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)translateDataToCell:(NSInteger)index
{
    _showImv.image = [UIImage imageNamed:[_imageArr objectAtIndex:index]];
    _nameLb.text = [_nameArr objectAtIndex:index];
    if (index == 3) {
        _line.hidden = YES;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
