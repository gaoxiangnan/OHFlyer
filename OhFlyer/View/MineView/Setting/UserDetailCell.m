//
//  UserDetailTableViewCell.m
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "UserDetailCell.h"
#import "Login.h"

#define kMaxLength 10

#define FS_UDTextFieldMargin kScaleFrom_iPhone5s_Desgin(20.0)
#define FS_UDTextFieldHeight kScaleFrom_iPhone5s_Desgin(21.0)

@implementation UserDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andStr:(NSString *)str{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _str = str;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSecurity:) name:@"changeSecurityType" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:self.textField];
        [self InitWithSubViews];
    }
    
    return self;
}

#pragma mark -ui
- (void)InitWithSubViews
{
    [self addSubview:self.textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(FS_UDTextFieldMargin);
        make.right.equalTo(self).offset(-FS_UDTextFieldMargin);
        make.height.equalTo(@(FS_UDTextFieldHeight));
    }];
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.clearButtonMode = UITextFieldViewModeAlways;
        _textField.secureTextEntry = YES;
        _textField.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0 weight:UIFontWeightThin]}];
        [_textField addTarget:self action:@selector(textValueChangedd:) forControlEvents:UIControlEventEditingChanged];
        if ([_str isEqualToString:@"请输入昵称"]) {
            _textField.text = [Login curLoginUser].name;
        }else if ([_str isEqualToString:@"请输入邮箱"]){
            _textField.text = [Login curLoginUser].email;
        }
        
    }
    return _textField;
}

#pragma mark -cellheight
+ (CGFloat)cellHeight
{
    return  kScaleFrom_iPhone5s_Desgin(55.0);
}

#pragma mark -privte
- (void)textValueChangedd:(UITextField *)text
{
    if ([self.delegate respondsToSelector:@selector(textValueChangedd:andTextIdentify:)]){
        [self.delegate textValueChangedd:text andTextIdentify:_str];
    }
}

- (void)textFieldEditChanged:(NSNotification *)obj
{
    if ([_str isEqualToString:@"请输入昵称"]) {
        UITextField *textField = (UITextField *)obj.object;
        
        NSString *toBeString = textField.text;
        NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage; // 键盘输入模式
        if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
            UITextRange *selectedRange = [textField markedTextRange];
            //获取高亮部分
            UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if (toBeString.length > kMaxLength) {
                    textField.text = [toBeString substringToIndex:kMaxLength];
                }
            }
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
            else{
                
            }
        }
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        else{
            if (toBeString.length > kMaxLength) {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }  
        }
        if ([self.delegate respondsToSelector:@selector(textValueChangedd:andTextIdentify:)]){
            [self.delegate textValueChangedd:textField andTextIdentify:_str];
        }
    }
}

- (void)changeSecurity:(NSNotification *)object
{
    _textField.secureTextEntry = ![object.object boolValue];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
