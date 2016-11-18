//
//  UserDetailTableViewCell.h
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

@protocol UserDetailCellDelegate <NSObject>

- (void)textValueChangedd:(UITextField *)text andTextIdentify:(NSString *)str;
@end

@interface UserDetailCell : BaseTableViewCell
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSString *str;
@property (nonatomic, weak) id<UserDetailCellDelegate>delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andStr:(NSString *)str;
+ (CGFloat)cellHeight;

@end
