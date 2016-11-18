//
//  MessageEditCell.h
//  FlyShare
//
//  Created by zzxcc on 16/2/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "MessageList.h"


@interface MessageEditCell : BaseTableViewCell
@property (nonatomic, strong) MessageList *messageModel;
@property (nonatomic, strong) UIButton *selectBtn;

+ (CGFloat)cellHeight;

@end
