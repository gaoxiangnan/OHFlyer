//
//  CTInfoView.m
//  FlyShare
//
//  Created by zzxcc on 15/12/21.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CTInfoView.h"
#import "HMSegmentedControl.h"
#import "UIView+DrawLine.h"
#import "UIView+Helpers.h"
#import "CTInfoS0Cell.h"
#import "CTInfoS1Cell.h"
#import "InvoiceTableCell.h"
#import "AddressTableCell.h"

@interface CTInfoView()<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) HMSegmentedControl *fsegmentControl;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation CTInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    [self initWithSubViews];

    return self;
}

#pragma mark -UI
- (void)initWithSubViews
{
    [self addSubview:self.fsegmentControl];
    [self addSubview:self.scrollView];
}

- (HMSegmentedControl *)fsegmentControl
{
    if (!_fsegmentControl) {
        _fsegmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"乘客", @"地址",@"发票抬头"]];
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

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_fsegmentControl.frame), kDeviceWidth, self.frameSizeHeight)];

        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(3 * kDeviceWidth, _scrollView.frameSizeHeight);
        _scrollView.delegate = self;
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, kDeviceWidth, _scrollView.frameSizeHeight) animated:NO];
        
        [_scrollView addSubview:self.tableView];
        [_scrollView addSubview:self.tableView1];
        [_scrollView addSubview:self.tableView2];
    }
    return _scrollView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, _scrollView.frameSizeHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = kTableViewBGColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[CTInfoS0Cell class] forCellReuseIdentifier:[CTInfoS0Cell reuseIdentifier]];
        [_tableView registerClass:[CTInfoS1Cell class] forCellReuseIdentifier:[CTInfoS1Cell reuseIdentifier]];
    }
    return _tableView;
}

- (UITableView *)tableView1
{
    if (!_tableView1) {
        _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(kDeviceWidth, 0, kDeviceWidth, _scrollView.frameSizeHeight) style:UITableViewStyleGrouped];
        _tableView1.backgroundColor = kTableViewBGColor;
        _tableView1.delegate = self;
        _tableView1.dataSource = self;
        _tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView1 registerClass:[CTInfoS0Cell class] forCellReuseIdentifier:[CTInfoS0Cell reuseIdentifier]];
        [_tableView1 registerClass:[AddressTableCell class] forCellReuseIdentifier:[AddressTableCell reuseIdentifier]];
    }
    return _tableView1;
}
- (UITableView *)tableView2
{
    if (!_tableView2) {
        _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(kDeviceWidth * 2, 0, kDeviceWidth, _scrollView.frameSizeHeight-40) style:UITableViewStyleGrouped];
        _tableView2.backgroundColor = kTableViewBGColor;
        _tableView2.delegate = self;
        _tableView2.dataSource = self;
        _tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView2 registerClass:[CTInfoS0Cell class] forCellReuseIdentifier:[CTInfoS0Cell reuseIdentifier]];
        [_tableView2 registerClass:[InvoiceTableCell class] forCellReuseIdentifier:[InvoiceTableCell reuseIdentifier]];
    }
    return _tableView2;
}

#pragma mark -tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numberSection;
    if (tableView == _tableView) {
        numberSection = 1 +_adultsArray.count;
    }else if (tableView == _tableView1){
        numberSection = _adressArray.count + 1;
    }else{
        numberSection = _invoiceArray.count + 1;
    }
    return numberSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 15.0 : 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return section == 0 ? 15.0 : 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    if (tableView == _tableView) {
        rowHeight =  indexPath.section == 0 ? [CTInfoS0Cell cellHeight] : [CTInfoS1Cell cellHeight];
    }else if (tableView == _tableView1){
        rowHeight = indexPath.section == 0 ? [CTInfoS0Cell cellHeight] : [AddressTableCell cellHeight];
    }else if (tableView == _tableView2){
        rowHeight = indexPath.section == 0 ? [CTInfoS0Cell cellHeight] : [InvoiceTableCell cellHeight];
    }
    return rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contacts *contact;
    Invoice  *invoice;
    Address  *address;
    
    if (indexPath.section == 0) {
        CTInfoS0Cell *cell = [tableView dequeueReusableCellWithIdentifier:[CTInfoS0Cell reuseIdentifier] forIndexPath:indexPath];
        if (tableView == _tableView) {
            cell.addTraveler.text = @"添加新旅客";
        }else if (tableView == _tableView1){
            cell.addTraveler.text = @"添加常用地址";
        }else if (tableView == _tableView2){
            cell.addTraveler.text = @"添加常用发票抬头";
        }
        return cell;
    }
    
    
    
    
    
    if (tableView == _tableView) {
        CTInfoS1Cell *cell = [tableView dequeueReusableCellWithIdentifier:[CTInfoS1Cell reuseIdentifier]];
        if (!cell) {
            cell = [[CTInfoS1Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[CTInfoS1Cell reuseIdentifier]];
        }
        contact = _adultsArray[indexPath.section - 1];
        cell.contacts = contact;
        return cell;
    }else if (tableView == _tableView1){
        AddressTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[AddressTableCell reuseIdentifier]];
        if (!cell) {
            cell = [[AddressTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AddressTableCell reuseIdentifier]];
        }
        address = _adressArray[indexPath.section - 1];
        cell.address = address;
        return cell;
    }else{
        InvoiceTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[InvoiceTableCell reuseIdentifier]];
        if (!cell) {
            cell = [[InvoiceTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[InvoiceTableCell reuseIdentifier]];
        }
        invoice = _invoiceArray[indexPath.section - 1];
        cell.invoice = invoice;
        return cell;
    }
    
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section > 0) {
        return UITableViewCellEditingStyleDelete;//设置编辑风格为删除风格
    }
    return UITableViewCellEditingStyleNone;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        CTInfoS1Cell *cell;
        if (tableView == _tableView) {
            [_adultsArray removeObjectAtIndex:indexPath.section - 1];
            cell = [_tableView cellForRowAtIndexPath:indexPath];
            [_tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section]  withRowAnimation:UITableViewRowAnimationFade];
        }
        
        if (tableView == _tableView1) {
            [_adressArray removeObjectAtIndex:indexPath.section - 1];
            cell = [_tableView1 cellForRowAtIndexPath:indexPath];
            [_tableView1 deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section]  withRowAnimation:UITableViewRowAnimationFade];
        }
        if (tableView == _tableView2) {
            [_invoiceArray removeObjectAtIndex:indexPath.section - 1];
            cell = [_tableView1 cellForRowAtIndexPath:indexPath];
            [_tableView1 deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section]  withRowAnimation:UITableViewRowAnimationFade];
        }
        
        
        if ([_delegate respondsToSelector:@selector(DeleteAction:)]) {
            [_delegate DeleteAction:cell.contacts];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contacts *contact;
    Invoice  *invoice;
    Address  *address;
    if (tableView == _tableView && indexPath.section != 0) {
        contact = _adultsArray[indexPath.section - 1];
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectIndexPath:andTableView:andModel:)]) {
            [_delegate didSelectIndexPath:indexPath andTableView:tableView andModel:contact];
        }
    }else if (tableView == _tableView1 && indexPath.section != 0){
        address = _adressArray[indexPath.section - 1];
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectIndexPath:andTableView:andModel:)]) {
            [_delegate didSelectIndexPath:indexPath andTableView:tableView andModel:address];
        }
    }else if (tableView == _tableView2 && indexPath.section != 0){
        invoice = _invoiceArray[indexPath.section - 1];
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectIndexPath:andTableView:andModel:)]) {
            [_delegate didSelectIndexPath:indexPath andTableView:tableView andModel:invoice];
        }
    }else{
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectIndexPath:andTableView:andModel:)]) {
            [_delegate didSelectIndexPath:indexPath andTableView:tableView andModel:invoice];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

#pragma mark -HMSegment delegate
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
 
    //[_tableView1 reloadData];
    [self.scrollView scrollRectToVisible:CGRectMake(kDeviceWidth * segmentedControl.selectedSegmentIndex, 0, kDeviceWidth, _scrollView.frameSizeHeight) animated:YES];
    
}

#pragma mark -UIScrollViewDelegate
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    CGFloat pageWidth = scrollView.frame.size.width;
//    NSInteger page = scrollView.contentOffset.x / pageWidth;
//    
////    [self.fsegmentControl setSelectedSegmentIndex:page animated:YES];
//}

@end
