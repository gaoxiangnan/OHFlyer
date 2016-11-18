//
//  MessageEditView.m
//  FlyShare
//
//  Created by zzxcc on 16/2/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "MessageEditView.h"
#import "UIView+DrawLine.h"
#import "MessageEditCell.h"
#import "NSObject+Common.h"
#import "NSObject+ObjectMap.h"

@interface MessageEditView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation MessageEditView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSMutableString *localPath = [kAPI_GetMessageList mutableCopy];
     
        id resultData = [NSObject loadResponseWithPath:localPath];
        self.dataArray = [resultData objectForKey:@"data"];
        [self initWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)initWithSubViews
{
    [self addSubview:self.tableView];
    [self addSubview:self.bottomView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 49)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, kSViewHeight - 39, kDeviceWidth, 49)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.alpha = 0.95;
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightRegular];
        [leftBtn setTitleColor:RGBACOLOR(0, 0, 0, 0.4) forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"delete_message"]forState:UIControlStateNormal];
        [leftBtn setTitle:@"删除" forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(readMsgAction) forControlEvents:UIControlEventTouchUpInside];
        [self initButton:leftBtn];
        [_bottomView addSubview:leftBtn];
        [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(_bottomView);
            make.width.equalTo(@(kDeviceWidth));
            make.height.equalTo(@49);
        }];
        
        
        [_bottomView addLineUp:YES andDown:NO];
    }
    return _bottomView;
}

#pragma mark -tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MessageEditCell cellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell addLineUp:NO andDown:YES andColor:kSeperatorLineColor andLeftSpace:10 andRightSpace:10];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *identifierCell = [NSString stringWithFormat:@"%ld%ld", (long)indexPath.section, (long)indexPath.row];
    MessageEditCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
    if (cell == nil) {
        cell = [[MessageEditCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierCell];
    }
    cell.messageModel = [NSObject objectOfClass:@"MessageList" fromJSON:_dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageEditCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectBtn.selected = !cell.selectBtn.selected;
}
-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width-15.0, -10.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(-5.0, 0.0,20.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}
#pragma mark -private
- (void)readMsgAction
{
    if ([_delegate respondsToSelector:@selector(readMsgAction)]) {
        [_delegate readMsgAction];
    }
}

- (void)deleteAction
{
    if ([_delegate respondsToSelector:@selector(deleteAction)]) {
        [_delegate deleteAction];
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
