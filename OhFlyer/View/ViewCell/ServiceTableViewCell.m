//
//  ServiceTableViewCell.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/12.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ServiceTableViewCell.h"


@interface ServiceTableViewCell ()
{
    NSString *_contentStr;
}
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *contentLb;
@property (nonatomic, assign) CGFloat contentLabelH;



@end

@implementation ServiceTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = RGBACOLOR(246, 246, 246, 1);
        _contentStr = @"随着生活水平的提高，我们平时吃的食物的种类越来越丰富，摄入的营养也是越来越多。而一直忙于工作的企业精英，高层管理人员和都市白领等由于缺乏运动的时间，所以现代都市人最大的一个问题便是“健康问题”，我们现在基本上都处在于“亚健康状态”。正因如此，才会越来越重视每年一次的“体检”按时打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算的阿打算打算打算打算打算打算打算打算打算打算打算打算打算的按时打算打算打打打算打算打打死大大大大大大撒发发发发发打打。";
        
       
        
        [self InitWithSubViews];
        
    }
    
    return self;
}
- (void)InitWithSubViews
{
    
    [self addSubview:self.secondView];
    [_secondView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(self.contentLabelH + 30));
    }];
    
    [_secondView addSubview:self.topLine];
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_secondView);
        make.top.equalTo(_secondView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(0.5));
    }];
    
    [_secondView addSubview:self.contentLb];
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_secondView).offset(20);
        make.top.equalTo(_secondView).offset(10);
        make.width.equalTo(@(kDeviceWidth - 40));
    }];
}

- (UIView *)secondView
{
    if (!_secondView) {
        _secondView = [UIView new];
        _secondView.backgroundColor = [UIColor whiteColor];
    }
    return _secondView;
}
- (UIView *)topLine
{
    if (!_topLine) {
        _topLine = [UIView new];
        _topLine.backgroundColor = RGBACOLOR(239, 239, 239, 0.5);
    }
    return _topLine;
}
- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.text = @"随着生活水平的提高，我们平时吃的食物的种类越来越丰富，摄入的营养也是越来越多。而一直忙于工作的企业精英，高层管理人员和都市白领等由于缺乏运动的时间，所以现代都市人最大的一个问题便是“健康问题”，我们现在基本上都处在于“亚健康状态”。正因如此，才会越来越重视每年一次的“体检”按时打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算的阿打算打算打算打算打算打算打算打算打算打算打算打算打算的按时打算打算打打打算打算打打死大大大大大大撒发发发发发打打。";
        _contentLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _contentLb.textColor = RGBACOLOR(47, 47, 47, 0.7);
        _contentLb.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLb.numberOfLines = 0;
    }
    return _contentLb;
}

+ (CGFloat)cellHeight:(NSString *)string
{
    CGRect r = [string boundingRectWithSize:CGSizeMake(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40),10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f]} context:nil];
    
    return r.size.height + 20;
}


-(CGFloat)rowHeightWithCellModel

{
    
    
    __weak __typeof(&*self)weakSelf =self;
    
    //设置标签的高度
    
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker*make) {
        
        // weakSelf.contentLabelH  这个会调用下面的懒加载方法
        
        make.height.mas_equalTo(weakSelf.contentLabelH);
        
    }];
    
    // 2. 更新约束
    
    [self layoutIfNeeded];
    
    //3.  视图的最大 Y 值
    
    CGFloat h= CGRectGetMaxY(self.contentLb.frame);
    
    return h;//最大的高度+10
    
}
-(CGFloat)contentLabelH

{
    
    if(!_contentLabelH){
        
        CGFloat h=[_contentStr boundingRectWithSize:CGSizeMake(kDeviceWidth, kDeviceHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}context:nil].size.height;
        
        _contentLabelH=h;//内容距离底部下划线10的距离
        
    }
    
    return _contentLabelH;
    
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
