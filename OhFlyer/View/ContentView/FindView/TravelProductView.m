//
//  TravelProductView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/27.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TravelProductView.h"
#import "TravelProTableViewCell.h"

@interface TravelProductView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UITableView *travelProTableView;
@end
@implementation TravelProductView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.travelProTableView];
    [_travelProTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kDeviceHeight-64));
    }];
}
- (UITableView *)travelProTableView
{
    if (!_travelProTableView) {
        _travelProTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _travelProTableView.delegate = self;
        _travelProTableView.dataSource = self;
        _travelProTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _travelProTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 30)];
    headerView.backgroundColor = [UIColor greenColor];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 260;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"TravelProTableViewCell";
    TravelProTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[TravelProTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_listBlock) {
        _listBlock(indexPath.row);
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
