//
//  CardTypeView.m
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CardTypeView.h"
#import "CardTypeCell.h"
#import "UIView+DrawLine.h"

@interface CardTypeView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic)NSIndexPath *indexpath;

@end

@implementation CardTypeView

- (instancetype)initWithFrame:(CGRect)frame selectType:(NSInteger)selectType
{
    self = [super initWithFrame:frame];
    if (self) {
        //（1身份证、2护照、3台胞证、4回乡证、5军人证、6港澳通行证、7户口本、8出生证明、0其他）
        self.dataArr = [NSArray arrayWithObjects:@"其它", @"身份证", @"护照", @"台胞证", @"回乡证", @"军人证", @"港澳通行证", @"户口本", nil];
        
        [self InitWithSubViews];
        NSIndexPath * selIndex = [NSIndexPath indexPathForRow:selectType inSection:0];
        [_tableView selectRowAtIndexPath:selIndex animated:YES scrollPosition:UITableViewScrollPositionTop];
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
        _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[CardTypeCell class] forCellReuseIdentifier:[CardTypeCell reuseIdentifier]];
    }
    return _tableView;
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CardTypeCell cellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(CardTypeCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell addLineUp:NO andDown:YES andColor:kSeperatorLineColor andLeftSpace:kScaleFrom_iPhone5s_Desgin(20) andRightSpace:kScaleFrom_iPhone5s_Desgin(20)];

    if (_indexpath == indexPath &&  _indexpath != nil) {
        cell.cardType.textColor = kOrangeColor;
    }else{
        cell.cardType.textColor = [UIColor blackColor];
    }
    cell.tintColor = kOrangeColor;
    cell.cardType.text = _dataArr[indexPath.row];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:[CardTypeCell reuseIdentifier] forIndexPath:indexPath];
 
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _indexpath = indexPath;
    if ([_delegate respondsToSelector:@selector(didSelectRowAtIndexPath:)]) {
        [_delegate didSelectRowAtIndexPath:indexPath];
    }
//    CardTypeTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.tintColor = kOrangeColor;
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [self.tableView reloadData];
}

- (UITableViewCellAccessoryType)tableView:(UITableView*)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath*)indexPath
{
    if(_indexpath == indexPath && _indexpath!=nil)
    {
        return UITableViewCellAccessoryCheckmark;
    }
    else
    {
        return UITableViewCellAccessoryNone;
    }
}

@end
