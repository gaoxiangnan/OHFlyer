//
//  MessageEditViewController.m
//  FlyShare
//
//  Created by zzxcc on 16/2/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "MessageEditViewController.h"
#import "MessageEditView.h"
#import "MessageEditCell.h"
#import "NSObject+Common.h"

@interface MessageEditViewController ()<MessageEditViewDelegate>
@property (nonatomic, strong) MessageEditView *editView;

@end

@implementation MessageEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"消息编辑";
    [self rightWithText:@"取消" action:@selector(deleteMessage)];
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    [self InitWithSubViews];
}

- (void)InitWithSubViews
{
    [self.view addSubview:self.editView];
}

- (MessageEditView *)editView
{
    if (!_editView) {
        _editView = [[MessageEditView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
        _editView.delegate = self;
    }
    return _editView;
}

#pragma mark -delegate
- (void)readMsgAction
{
    NSMutableString *localPath = [kAPI_GetMessageList mutableCopy];
    
    if ([MessageList updataeAllFlagToReadWithPath:localPath]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        kTipAlert(@"设置失败");
    }
    
}

- (void)deleteAction
{
    NSMutableString *localPath = [kAPI_GetMessageList mutableCopy];
    for (MessageEditCell *cell in _editView.tableView.visibleCells) {
        if (cell.selectBtn.selected) {
            [MessageList deleteSeletedMessageWithId:cell.messageModel.id andPath:localPath];
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)deleteMessage
{
    for (MessageEditCell *cell in _editView.tableView.visibleCells) {
        cell.selectBtn.selected = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
