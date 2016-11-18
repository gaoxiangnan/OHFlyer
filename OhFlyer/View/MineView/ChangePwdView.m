//
//  ChangePwdView.m
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "ChangePwdView.h"
#import "UserDetailCell.h"
#import "UIView+DrawLine.h"
#import "UIView+Helpers.h"
#import "UIView+Common.h"

//footView height
#define FS_CPFootHeihgt kScaleFrom_iPhone5s_Desgin(60.0f)

//按钮旁文字
#define FS_CPLabelMarginRight kScaleFrom_iPhone5s_Desgin(20.0f)
#define FS_CPLabelMarginTop kScaleFrom_iPhone5s_Desgin(31.5f)

//按钮-显示密码
#define FS_CPButtonMarginLeft kDeviceWidth - 105
#define FS_CPButtonMarginTop kScaleFrom_iPhone5s_Desgin(34.0f)
#define FS_CPButtonSize kScaleFrom_iPhone5s_Desgin(15.0f)

@interface ChangePwdView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UIView *footView;
@property BOOL buttonSelected;

@end

@implementation ChangePwdView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = [NSMutableArray arrayWithObjects:@"输入旧密码", @"输入新密码(6-16位)", @"确认密码(6-16位)", nil];
        _buttonSelected = NO;
        
        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {

        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, kDeviceWidth, kDeviceHeight - 74) style:UITableViewStylePlain];
        _tableView.backgroundColor = kTableViewBGColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.bounces = NO;
        _tableView.tableFooterView = self.footView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIView *)footView
{
    if (!_footView) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 60)];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(FS_CPButtonMarginLeft, FS_CPButtonMarginTop, FS_CPButtonSize, FS_CPButtonSize);
        [button setBackgroundImage:[UIImage imageNamed:@"showPwd_nomal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"showPwd_select"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(showPwd:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kDeviceWidth - 57 - FS_CPLabelMarginRight, FS_CPLabelMarginTop, 57, 20)];
        label.text = @"显示密码";
        label.textColor = RGBACOLOR(0, 0, 0, 0.3);
        label.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        label.textAlignment = NSTextAlignmentRight;
        
        UIButton *outButton = [UIButton buttonWithType:UIButtonTypeCustom];
        outButton.frame = CGRectMake(kScaleFrom_iPhone5s_Desgin(20.0), kScaleFrom_iPhone5s_Desgin(148.0), kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40), kScaleFrom_iPhone5s_Desgin(35));
        outButton.backgroundColor = HEXCOLOR(@"#0a1232", 1);
        [outButton setTitle:@"完成修改" forState:UIControlStateNormal];
        [outButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        outButton.titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        outButton.layer.cornerRadius = 3;
        [outButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
        
        [_footView addSubview:outButton];
        [_footView addSubview:button];
        [_footView addSubview:label];
    }
    return _footView;
}

#pragma mark -tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UserDetailCell cellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell addLineUp:NO andDown:YES andColor:[UIColor blackColor] andLeftSpace:kScaleFrom_iPhone5s_Desgin(20.0) andRightSpace:kScaleFrom_iPhone5s_Desgin(20.0)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[UserDetailCell reuseIdentifier]];
    if (!cell) {
        cell = [[UserDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[UserDetailCell reuseIdentifier] andStr:_dataArr[indexPath.row]];
    }
    cell.delegate = (id)[self findViewController];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -private
- (void)saveAction
{
    
}

- (void)showPwd:(UIButton *)sender
{
    sender.selected = !sender.selected;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeSecurityType" object:[NSNumber numberWithBool:sender.selected]];
}

@end
