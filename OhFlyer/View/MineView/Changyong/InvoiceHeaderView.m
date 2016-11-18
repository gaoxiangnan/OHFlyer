//
//  InvoiceHeaderView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/31.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "InvoiceHeaderView.h"
//#import "AFApiManage.h"
#import "UIImage+Color.h"
@interface InvoiceHeaderView()<UITextFieldDelegate>
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *showLb;
@property (nonatomic, strong) UITextField *insertTextfield;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *sureBtn;

@end

@implementation InvoiceHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.invoice = [[Invoice alloc]init];
    [self initWithSubViews];
    
    return self;
}

#pragma mark -UI
- (void)initWithSubViews
{
    
    
    [self addSubview:self.bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(self);
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(80)));
    }];
    [_bgView addSubview:self.showLb];
    [_showLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(20));
        make.top.equalTo(_bgView).offset(kScaleFrom_iPhone5s_Desgin(30));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(60)));
        
    }];
    [_bgView addSubview:self.insertTextfield];
    [_insertTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showLb.mas_right).offset(20);
        make.top.equalTo(_showLb);
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(100)));
    }];
    [_bgView addSubview:self.line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_bgView);
        make.top.equalTo(_bgView.mas_bottom).offset(-1);
        make.height.equalTo(@(1));
        
    }];
    [self addSubview:self.sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kScaleFrom_iPhone5s_Desgin(30)));
        make.top.equalTo(_bgView.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(20));
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(60)));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(39)));
    }];
}
- (void)setInvoice:(Invoice *)invoice
{
    _invoice = invoice;
    if (![_invoice valueForKey:@"id"]) {
        return;
    }
    _insertTextfield.text = [invoice valueForKey:@"title"];
}
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
- (UILabel *)showLb{
    if (!_showLb) {
        _showLb = [UILabel new];
        _showLb.text = @"发票抬头";
        _showLb.textAlignment = NSTextAlignmentLeft;
        _showLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _showLb;
}
- (UITextField *)insertTextfield{
    if (!_insertTextfield) {
        _insertTextfield = [UITextField new];
        _insertTextfield.clearButtonMode = UITextFieldViewModeAlways;
        _insertTextfield.placeholder = @"个人姓名或者公司名称";
        _insertTextfield.textAlignment = NSTextAlignmentLeft;
        _insertTextfield.keyboardType = UIKeyboardTypeDefault;
        _insertTextfield.borderStyle = UITextBorderStyleNone;
        _insertTextfield.delegate = self;
        _insertTextfield.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        
    }
    return _insertTextfield;
}
- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}

- (UIButton *)sureBtn
{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setBackgroundImage:[UIImage createImageWithColor:HEXCOLOR(@"#0a1232", 1)] forState:UIControlStateNormal];
        [_sureBtn setBackgroundImage:[UIImage createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
        _sureBtn.layer.cornerRadius = 3;
        _sureBtn.layer.masksToBounds = YES;
        [_sureBtn setTitle:@"提交" forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBt:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    self.invoice.title = textField.text;
    return YES;
}
- (void)sureBt:(id)sender
{
    if ([_delegate respondsToSelector:@selector(sureBt:withParams:)]) {
        [_delegate sureBt:[_invoice valueForKey:@"id"] withParams:self.invoice];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
