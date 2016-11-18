//
//  CollectView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/16.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CollectView.h"
#import "CollectTableViewCell.h"
@interface CollectView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *collectTab;

@end
@implementation CollectView
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
    [self addSubview:self.collectTab];
    [_collectTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self);
    }];
}
- (UITableView *)collectTab
{
    if (!_collectTab) {
        _collectTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64) style:UITableViewStylePlain];
        _collectTab.delegate = self;
        _collectTab.dataSource = self;
        _collectTab.backgroundColor = [UIColor clearColor];
        _collectTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _collectTab;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 118;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *identify = @"CollectTableViewCell";
    CollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[CollectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
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
