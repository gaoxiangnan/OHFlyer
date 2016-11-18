
//
//  SettingView.m
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "SettingView.h"
#import "TravelerAddCell.h"
#import "UIView+DrawLine.h"
#import "Login.h"

@interface SettingView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = [NSMutableArray arrayWithObjects:@"密码修改", @"关于", nil];

        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight - 64 -10));
    }];
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 340)];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kScaleFrom_iPhone5s_Desgin(20.0), kScaleFrom_iPhone5s_Desgin(148.0), kDeviceWidth - kScaleFrom_iPhone5s_Desgin(40), kScaleFrom_iPhone5s_Desgin(35));
        button.backgroundColor = HEXCOLOR(@"#0a1232", 1);
        [button setTitle:@"退出登录" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
//        button.hidden = [Login isLogin] ? NO : YES;
        button.layer.cornerRadius = 3;
        [button addTarget:self action:@selector(loginOut) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:button];
    }
    return _bottomView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = kTableViewBGColor;
        [_tableView setTableFooterView:self.bottomView];
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [_tableView registerClass:[TravelerAddCell class] forCellReuseIdentifier:[TravelerAddCell reuseIdentifier]];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TravelerAddCell cellHeight:UITableViewCellType50];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(TravelerAddCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell addLineUp:NO andDown:YES andColor:kSeperatorLineColor andLeftSpace:kScaleFrom_iPhone5s_Desgin(20.0) andRightSpace:kScaleFrom_iPhone5s_Desgin(20.0)];
    if (indexPath.row != 2) {
        cell.rightArrow.hidden = NO;
    }
    else{
        cell.switches.hidden = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.inputField.userInteractionEnabled = NO;
    cell.typeLabel.text = _dataArr[indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    TravelerAddCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TravelerAddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectIndexPath:)]){
        [_delegate didSelectIndexPath:indexPath];
    }
}

#pragma mark -private
- (void)loginOut
{
    if ([_delegate respondsToSelector:@selector(loginOut)]) {
        [_delegate loginOut];
    }
}

@end
