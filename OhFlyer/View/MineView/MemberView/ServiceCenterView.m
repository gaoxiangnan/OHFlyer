//
//  ServiceCenterView.m
//  OhFlyer
//
//  Created by 向楠 on 16/10/11.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ServiceCenterView.h"
#import "HMSegmentedControl.h"
#import "UIView+DrawLine.h"
#import "ServiceTableViewCell.h"
@interface ServiceCenterView ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _cellHeight;
    UIImageView *_arrow;
}
@property (nonatomic, strong) HMSegmentedControl *mySegmentControl;
@property (nonatomic, strong) UITableView *menuTableView;

@property (nonatomic,strong)NSMutableArray *sectionArray;
@property (nonatomic,strong)NSMutableArray *flagArray;

@end
@implementation ServiceCenterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.backgroundColor = RGBACOLOR(246, 246, 246, 1);
        [self InitWithSubViews];
        [self makeData];
        
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.mySegmentControl];
    [_mySegmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(37)));
    }];
    
    [self addSubview:self.menuTableView];
    [_menuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_mySegmentControl.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}
- (HMSegmentedControl *)mySegmentControl
{
    if (!_mySegmentControl) {
        _mySegmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"单程", @"往返",@"多程"]];
        _mySegmentControl.backgroundColor = [UIColor whiteColor];
        _mySegmentControl.selectedSegmentIndex = 1;
        _mySegmentControl.selectionStyle = HMSegmentedControlTypeTextImages;
        _mySegmentControl.selectedTextColor = kOrangeColor;
        _mySegmentControl.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _mySegmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _mySegmentControl.selectionIndicatorHeight = 2.0f;
        _mySegmentControl.selectionIndicatorColor = kOrangeColor;
        _mySegmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _mySegmentControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
        _mySegmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        [self.mySegmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        [_mySegmentControl addLineUp:NO andDown:YES];
    }
    return _mySegmentControl;
}
- (UITableView *)menuTableView
{
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTableView.backgroundColor = [UIColor whiteColor];
    }
    return _menuTableView;
}
- (void)makeData{
    _sectionArray = [NSMutableArray array];
    _flagArray  = [NSMutableArray array];
    NSInteger num = 3;
    for (int i = 0; i < num; i ++) {
        NSMutableArray *rowArray = [NSMutableArray array];
        for (int j = 0; j < 1; j ++) {
            [rowArray addObject:[NSString stringWithFormat:@"%d",j]];
        }
        [_sectionArray addObject:rowArray];
        [_flagArray addObject:@"0"];
    }
}
//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionArray.count;
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _sectionArray[section];
    return arr.count;
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 58;
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_flagArray[indexPath.section] isEqualToString:@"0"])
        return 0;
    else
        return [ServiceTableViewCell cellHeight:@"随着生活水平的提高，我们平时吃的食物的种类越来越丰富，摄入的营养也是越来越多。而一直忙于工作的企业精英，高层管理人员和都市白领等由于缺乏运动的时间，所以现代都市人最大的一个问题便是“健康问题”，我们现在基本上都处在于“亚健康状态”。正因如此，才会越来越重视每年一次的“体检”按时打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算打算的阿打算打算打算打算打算打算打算打算打算打算打算打算打算的按时打算打算打打打算打算打打死大大大大大大撒发发发发发打打。"];
}
//组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 58)];
    headView.backgroundColor = RGBACOLOR(246, 246, 246, 1);
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, kDeviceWidth, 48)];
    contentView.backgroundColor = [UIColor redColor];
    contentView.tag = 100 + section;
    [headView addSubview:contentView];
    
    UILabel *sectionLabel = [UILabel new];
    sectionLabel.textColor = RGBACOLOR(0, 0, 0, 0.7);
    sectionLabel.text = [NSString stringWithFormat:@"组%@",@"拼机”是一种新的机票订购模式吗？"];
    sectionLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    [contentView addSubview:sectionLabel];
    [sectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(20);
        make.centerY.equalTo(contentView);
    }];
    
    _arrow = [UIImageView new];
    _arrow.image = [UIImage imageNamed:@"arrow_bottom"];
    [contentView addSubview:_arrow];
    [_arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(contentView).offset(-20);
        make.centerY.equalTo(contentView);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
    [contentView addGestureRecognizer:tap];
    
    return headView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"Cell";
    ServiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[ServiceTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    cell.clipsToBounds = YES;//这句话很重要 不信你就试试
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)sectionClick:(UITapGestureRecognizer *)tap{
    int index = tap.view.tag % 100;
    
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    NSArray *arr = _sectionArray[index];
    for (int i = 0; i < arr.count; i ++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:index];
        [indexArray addObject:path];
    }
    //展开
    if ([_flagArray[index] isEqualToString:@"0"]) {
        _flagArray[index] = @"1";
        [_menuTableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationBottom];  //使用下面注释的方法就 注释掉这一句
        _arrow.image = [UIImage imageNamed:@"arrow_top"];
    } else { //收起
        _flagArray[index] = @"0";
        [_menuTableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationTop]; //使用下面注释的方法就 注释掉这一句
        _arrow.image = [UIImage imageNamed:@"arrow_bottom"];
    }
    //	NSRange range = NSMakeRange(index, 1);
    //	NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    //	[_tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
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
