//
//  MessageCell.m
//  FlyShare
//
//  Created by Patrick on 15/12/20.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "MessageCell.h"
#import "NSDate+Helper.h"

@interface MessageCell ( )
@property (nonatomic, strong) UIButton *message;
@property (nonatomic, strong) UILabel *mainTitle;
@property (nonatomic, strong) UILabel *subTitle;
@property (nonatomic, strong) UILabel *time;

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIImageView *arrowImg;
@end

@implementation MessageCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    return self;
}

- (void)createView{
    //消息图片
    [self.contentView addSubview:self.message];
    [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset (0);
        make.centerY.offset(0);
        make.width.offset (68);
        make.height.offset (MessageCellHeight);
        
    }];
    //时间
    [self.contentView addSubview:self.time];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset (-20);
        make.top.offset (12);
    }];
    //主标题
    [self.contentView addSubview:self.mainTitle];
    [self.mainTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (self.time);
        make.left.equalTo (self.message.mas_right);
    }];
    //副标题
    [self.contentView addSubview:self.subTitle];
    [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (self.mainTitle.mas_bottom).offset (7);
        make.left.equalTo (self.mainTitle);
        make.right.equalTo(self.time.mas_right);
    }];
    
    [self.contentView addSubview:self.arrowImg];
    [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_time.mas_right);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@(0.5));
    }];
    
}

-(UIButton *)message{
    if (!_message) {
        _message = [UIButton buttonWithType:UIButtonTypeCustom];
        [_message setImage:[UIImage imageNamed:@"notice_message"] forState:UIControlStateNormal];
        _message.userInteractionEnabled = NO;
    }
    return _message;
}

-(UILabel *)mainTitle{
    if (!_mainTitle) {
        _mainTitle = [[UILabel alloc]init];
        _mainTitle.text = @"订单消息";
        _mainTitle.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin];
        _mainTitle.textColor = [UIColor blackColor];
    }
    return _mainTitle;
}

- (UILabel *)subTitle{
    if (!_subTitle) {
        _subTitle = [[UILabel alloc]init];
        _subTitle.text = @"您的拼机订单“北京－上海”已预定成功，请您尽快联系客服人员完成剩asda撒打算打算打算打算打算打打打打打打打算打算打算的撒余尾款部分。";
        _subTitle.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightThin];
        _subTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        _subTitle.numberOfLines = 0;
        _subTitle.textColor = RGBACOLOR(0, 0, 0, 0.7);

        
    }
    return _subTitle;
}

- (UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.text = @"  2016-08-12";
        _time.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin];
        _time.textColor = RGBACOLOR(0, 0, 0, 0.3);
    }
    return _time;
}
- (UIImageView *)arrowImg
{
    if (!_arrowImg) {
        _arrowImg = [UIImageView new];
        _arrowImg.hidden = YES;
        _arrowImg.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _arrowImg;
}
- (UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _line;
}
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    if (!_messageModel) {
//        return;
//    }
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

- (void)setDidSee{
    [self.message setImage:[UIImage imageNamed:@"icon_readMessage"] forState:UIControlStateNormal];
}

- (void)setModel{
    
}
+ (CGFloat)cellHeight:(NSString *)string
{
    CGRect r = [string boundingRectWithSize:CGSizeMake(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40),10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f]} context:nil];
    
    return r.size.height + 50;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
