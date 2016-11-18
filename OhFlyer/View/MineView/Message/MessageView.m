//
//  MessageView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/16.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MessageView.h"
#import "MessageCell.h"

@interface MessageView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *messageTab;
@end

@implementation MessageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(246, 246, 246, 1);
        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.messageTab];
    [_messageTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}
- (UITableView *)messageTab
{
    if (!_messageTab) {
        _messageTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 74) style:UITableViewStylePlain];
        _messageTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _messageTab.delegate = self;
        _messageTab.dataSource = self;
    }
    return _messageTab;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MessageCell cellHeight:@"您的拼机订单“北京－上海”已预定成功，请您尽快联系客服人员完成剩asda撒打算打算打算打算打算打打打打打打打算打算打算的撒余尾款部分。"];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"MessageCell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell =  [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;//设置编辑风格为删除风格
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source.
//        NSMutableString *localPath = [kAPI_GetMessageList mutableCopy];
//        [_showArray removeObjectAtIndex:indexPath.row];
//        MessageCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
//        [MessageList deleteSeletedMessageWithId:cell.messageModel.id andPath:localPath];
//        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        if ([cell.messageModel.flag integerValue] == 1) {
//            [_unReadMsgArray removeObjectAtIndex:indexPath.row];
//            [_tableView1 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        }else{
//            [_readMsgArray removeObjectAtIndex:indexPath.row];
//            [_tableView2 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        }
        
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
