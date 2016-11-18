//
//  MessageCell.h
//  FlyShare
//
//  Created by Patrick on 15/12/20.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "MessageList.h"

@interface MessageCell : BaseTableViewCell

@property (nonatomic, strong) MessageList *messageModel;


- (void)setDidSee;

- (void)setModel;

+ (CGFloat)cellHeight:(NSString *)string;
@end
