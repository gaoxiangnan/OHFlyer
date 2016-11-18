//
//  MessageEditView.h
//  FlyShare
//
//  Created by zzxcc on 16/2/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol MessageEditViewDelegate <NSObject>

- (void)readMsgAction;
- (void)deleteAction;

@end

@interface MessageEditView : BaseView
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id<MessageEditViewDelegate>delegate;

@end
