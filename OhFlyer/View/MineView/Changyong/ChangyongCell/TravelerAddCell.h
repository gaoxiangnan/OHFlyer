//
//  TravelerAddTableViewCell.h
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "Contacts.h"

typedef NS_ENUM(NSInteger, UITableViewCellType){
    UITableViewCellType40,
    UITableViewCellType50,
};

@interface TravelerAddCell : BaseTableViewCell
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UITextField *inputField;
@property (nonatomic, strong) UIImageView *rightArrow;
@property (nonatomic, strong) UISwitch *switches;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIButton *userImage;
@property (nonatomic, copy) void(^textValueChangee)(UITextField *text);

+ (CGFloat)cellHeight :(UITableViewCellType)cellType;

@end
