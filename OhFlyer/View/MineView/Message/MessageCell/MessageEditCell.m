//
//  MessageEditCell.m
//  FlyShare
//
//  Created by zzxcc on 16/2/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "MessageEditCell.h"

@interface MessageEditCell()
@property (nonatomic, strong) UIButton *message;
@property (nonatomic, strong) UILabel *mainTitle;
@property (nonatomic, strong) UILabel *subTitle;
@property (nonatomic, strong) UILabel *time;

@end

@implementation MessageEditCell

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
    [self addSubview:self.selectBtn];
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15.0);
    }];
    
    
    [self addSubview:self.mainTitle];
    [_mainTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(85.0f);
        make.top.equalTo(self).offset(12.5f);
    }];
    
    [self addSubview:self.time];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset (-20);
        make.top.offset (12.5);
    }];
    
    [self addSubview:self.subTitle];
    [_subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mainTitle.mas_left);
        make.right.equalTo(_time.mas_right);
        make.top.equalTo(_mainTitle.mas_bottom).offset(4.0f);
    }];}

- (UIButton *)selectBtn
{
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.userInteractionEnabled = NO;
        [_selectBtn setImage:[UIImage imageNamed:@"showPwd_nomal"] forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"showPwd_select"] forState:UIControlStateSelected];
//        [_selectBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}


-(UILabel *)mainTitle{
    if (!_mainTitle) {
        _mainTitle = [[UILabel alloc]init];
        _mainTitle.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin];
        _mainTitle.textColor = [UIColor blackColor];
    }
    return _mainTitle;
}

- (UILabel *)subTitle{
    if (!_subTitle) {
        _subTitle = [[UILabel alloc]init];
        _subTitle.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin];
        _subTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        _subTitle.textColor = kLightGrayTextColor192;
        
        
    }
    return _subTitle;
}

- (UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin];
        _time.textColor = kLightGrayTextColor192;
    }
    return _time;
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    if (!_messageModel) {
//        return;
//    }
//    
//    NSString *imgStr;
//    if ([_messageModel.flag integerValue] == 1) {
//        imgStr = @"icon_unreadMessage";
//    }else{
//        imgStr = @"icon_readMessage";
//    }
//    [_message setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
//    _mainTitle.text = @"系统消息";
//    _time.text = [_messageModel.send_time substringWithRange:NSMakeRange(0, 16)];
//    _subTitle.text = _messageModel.message;
//}

+ (CGFloat)cellHeight
{
    return 69.5f;
}

#pragma mark -private
- (void)selectAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
