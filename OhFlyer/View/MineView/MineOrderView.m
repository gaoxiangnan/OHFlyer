//
//  MineOrderView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "MineOrderView.h"
#import "HMSegmentedControl.h"
#import "UIView+DrawLine.h"
#import "MineOrderTableViewCell.h"

@interface MineOrderView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) HMSegmentedControl *fsegmentControl;
@property (nonatomic, strong) UITableView *orderTableView;

@end

@implementation MineOrderView
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
    [self addSubview:self.fsegmentControl];
    [self addSubview:self.orderTableView];
}
- (HMSegmentedControl *)fsegmentControl
{
    if (!_fsegmentControl) {
        _fsegmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"全部", @"代付款",@"已支付"]];
        _fsegmentControl.selectedSegmentIndex = 0;
        _fsegmentControl.frame = CGRectMake(0, 0, kDeviceWidth, 37);
        _fsegmentControl.font = [UIFont systemFontOfSize:kSegmentTitleFont];
        _fsegmentControl.selectionIndicatorHeight = 2.0f;
        _fsegmentControl.selectionIndicatorColor = kOrangeColor;
        _fsegmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _fsegmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _fsegmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        [self.fsegmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        [_fsegmentControl addLineUp:NO andDown:YES];
        
    }
    return _fsegmentControl;
}
- (UITableView *)orderTableView
{
    if (!_orderTableView) {
        _orderTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 37, kDeviceWidth, kDeviceHeight-64-37) style:UITableViewStylePlain];
        _orderTableView.backgroundColor = [UIColor clearColor];
        _orderTableView.delegate = self;
        _orderTableView.dataSource = self;
        _orderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _orderTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 195;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"MineOrderTableViewCell";
    MineOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[MineOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_orderBlock) {
        _orderBlock(indexPath.row);
    }
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)sender
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
