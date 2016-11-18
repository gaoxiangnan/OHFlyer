//
//  InvoiceTableCell.m
//  FlyShare
//
//  Created by 向楠 on 16/6/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "InvoiceTableCell.h"
//nameLabel
static const CGFloat FS_CTIS1NameLabelMarginLeft = 20.0;
static const CGFloat FS_CTIS1NameLabelMarginTop = 8.0;
static const CGFloat FS_CTIS1NameLabelFont = 14.0;

//rightArrow
static const CGFloat FSCTIS0RightArrMarginRight = 20.0;
static const CGFloat FSCTIS0RightARrrWidth = 6.0;
static const CGFloat FSCTIS0RightARrrHeight = 10.0;

@interface InvoiceTableCell()
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *rightArrow;

@end
@implementation InvoiceTableCell
- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self InitWithSubViews];
    }
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(FS_CTIS1NameLabelMarginLeft));
        make.top.equalTo(@(FS_CTIS1NameLabelMarginTop));
    }];
    
    [self addSubview:self.rightArrow];
    [_rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-FSCTIS0RightArrMarginRight);
        make.width.equalTo(@(FSCTIS0RightARrrWidth));
        make.height.equalTo(@(FSCTIS0RightARrrHeight));
        
    }];
    
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:FS_CTIS1NameLabelFont weight:UIFontWeightRegular];
        //  _nameLabel.text = @"多发发的";
    }
    return _nameLabel;
}


- (UIImageView *)rightArrow
{
    if (!_rightArrow) {
        _rightArrow = [UIImageView new];
        _rightArrow.image = [UIImage imageNamed:@"list_rightarrow"];
    }
    return _rightArrow;
}

//setdata
- (void)setInvoice:(Invoice *)invoice
{
    _invoice = invoice;

    if (!_invoice) {
        return;
    }
    _nameLabel.text = [_invoice valueForKey:@"title"];
    
}

+ (CGFloat)cellHeight
{
    return 40.0;
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
