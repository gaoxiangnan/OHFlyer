//
//  TripBaojiMoreView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/31.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "TripBaojiMoreView.h"
#import "CounterView.h"
#import "TripMoreTableViewCell.h"
@interface TripBaojiMoreView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tripMoreTable;
@property (nonatomic, strong) UIView *tableFootView;

/*  乘客  */
@property (nonatomic, strong) UILabel *passengerNumLb;
@property (nonatomic, strong) UIImageView *showPassengerImg;
@property (nonatomic, strong) CounterView *numView;

/*  行程安排  */
@property (nonatomic, strong) UIButton *addTrip;
@property (nonatomic, strong) UIButton *addBackTrip;
@property (nonatomic, strong) UIButton *deleteTrip;

@property (nonatomic, strong) UIButton *searchBtn;

@property (nonatomic, strong) UIImageView *pointRedImg;
@property (nonatomic, strong) UILabel *showPointLb;
@property (nonatomic, strong) UILabel *pointContentLb;
@end

@implementation TripBaojiMoreView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    [self addSubview:self.tripMoreTable];
    [_tripMoreTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self);
//        make.height.equalTo(@(self.bounds.size.height-20));
    }];

    

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"TripMoreTableViewCell";
    TripMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[TripMoreTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleDelete;//设置编辑风格为删除风格
//}
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return @"删除";
//}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"删除");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
    }
}

- (UITableView *)tripMoreTable
{
    if (!_tripMoreTable) {
        _tripMoreTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth-20, 0) style:UITableViewStylePlain];
        _tripMoreTable.backgroundColor = RGBCOLOR(246, 246, 246);
        _tripMoreTable.delegate = self;
        _tripMoreTable.dataSource = self;
        _tripMoreTable.tableFooterView = self.tableFootView;
        _tripMoreTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tripMoreTable;
}
- (UIView *)tableFootView
{
    if (!_tableFootView) {
        _tableFootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth-40, 250)];
        _tableFootView.backgroundColor = RGBCOLOR(246, 246, 246);
        
        UIView *routeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth - 20, 58)];
        routeView.backgroundColor = [UIColor whiteColor];
        
        
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setBounds:self.bounds];
        [shapeLayer setPosition:self.center];
        [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
        
        // 设置虚线颜色为blackColor
        [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
        [shapeLayer setStrokeColor:[[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0f] CGColor]];
        
        // 3.0f设置虚线的宽度
        [shapeLayer setLineWidth:1.0f];
        [shapeLayer setLineJoin:kCALineJoinRound];
        
        // 3=线的宽度 1=每条线的间距
        [shapeLayer setLineDashPattern:
         [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
          [NSNumber numberWithInt:1],nil]];
        
        // Setup the path
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 5, 0);
        CGPathAddLineToPoint(path, NULL, kScaleFrom_iPhone5s_Desgin(325),0);
        
        [shapeLayer setPath:path];
        CGPathRelease(path);
        
        // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
        [[routeView layer] addSublayer:shapeLayer];
//
        
        
        
        
        /*行程安排*/
        [routeView addSubview:self.addBackTrip];
        [_addBackTrip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(routeView).offset(15);
            make.top.equalTo(routeView).offset(10);
            make.width.equalTo(@((kDeviceWidth-kScaleFrom_iPhone5s_Desgin(40))/3));
            make.height.equalTo(@(38));
        }];
        
        [routeView addSubview:self.addTrip];
        [_addTrip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_addBackTrip.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
            make.top.width.height.equalTo(_addBackTrip);
        }];
        
        [routeView addSubview:self.deleteTrip];
        [_deleteTrip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_addTrip.mas_right).offset(kScaleFrom_iPhone5s_Desgin(5));
            make.top.width.height.equalTo(_addBackTrip);
        }];
        
        UIView *passengerView = [[UIView alloc] initWithFrame:CGRectMake(0, 68, kDeviceWidth - 20, 50)];
        passengerView.backgroundColor = [UIColor whiteColor];
        
        
        /*  乘客  */
        [passengerView addSubview:self.showPassengerImg];
        [_showPassengerImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(passengerView).offset(20);
            make.centerY.equalTo(passengerView);
        }];
        
        [passengerView addSubview:self.passengerNumLb];
        [_passengerNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_showPassengerImg.mas_right).offset(8);
            make.centerY.equalTo(passengerView);
        }];
        
        
        
        [passengerView addSubview:self.numView];
        [_numView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(passengerView.mas_right).offset(-20);
            make.centerY.equalTo(passengerView);
            make.width.equalTo(@(90));
            make.height.equalTo(@(27));
        }];
        
        
        
        [_tableFootView addSubview:passengerView];
        [_tableFootView addSubview:routeView];
        
        [_tableFootView addSubview:self.searchBtn];
        [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tableFootView).offset(kScaleFrom_iPhone5s_Desgin(35));
            make.top.equalTo(passengerView.mas_bottom).offset(26);
            make.right.equalTo(_tableFootView.mas_right).offset(kScaleFrom_iPhone5s_Desgin(-35));
            make.height.equalTo(@(40));
        }];
        
        [_tableFootView addSubview:self.pointRedImg];
        [_pointRedImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tableFootView).offset(5);
            make.top.equalTo(_searchBtn.mas_bottom).offset(20);
        }];
        [_tableFootView addSubview:self.showPointLb];
        [_showPointLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pointRedImg.mas_right).offset(5);
            make.top.equalTo(_pointRedImg);
        }];
        [_tableFootView addSubview:self.pointContentLb];
        [_pointContentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pointRedImg);
            make.top.equalTo(_pointRedImg.mas_bottom).offset(5);
            make.right.equalTo(_tableFootView).offset(-5);
        }];
        
    }
    return _tableFootView;
}
- (UILabel *)passengerNumLb
{
    if (!_passengerNumLb) {
        _passengerNumLb = [UILabel new];
        _passengerNumLb.text = @"乘客人数";
        _passengerNumLb.textColor = [UIColor blackColor];
        _passengerNumLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _passengerNumLb.textAlignment = NSTextAlignmentLeft;
    }
    return _passengerNumLb;
}
- (UIImageView *)showPassengerImg
{
    if (!_showPassengerImg) {
        _showPassengerImg = [UIImageView new];
        _showPassengerImg = [UIImageView new];
        _showPassengerImg.image = [UIImage imageNamed:@"max_person"];
    }
    return _showPassengerImg;
}
- (UIButton *)addTrip
{
    if (!_addTrip) {
        _addTrip = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addTrip setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addTrip setTitle:@"添加行程" forState:UIControlStateNormal];
        [_addTrip setImage:[UIImage imageNamed:@"addTrip_trip"] forState:UIControlStateNormal];
        _addTrip.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_addTrip addTarget:self action:@selector(onAddTripClient) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addTrip;
}
- (UIButton *)addBackTrip
{
    if (!_addBackTrip) {
        _addBackTrip = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBackTrip setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addBackTrip setTitle:@"添加返程" forState:UIControlStateNormal];
        [_addBackTrip setImage:[UIImage imageNamed:@"addBack_trip"] forState:UIControlStateNormal];
        _addBackTrip.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_addBackTrip addTarget:self action:@selector(onAddBackTripClient) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBackTrip;
}
- (UIButton *)deleteTrip
{
    if (!_deleteTrip) {
        _deleteTrip = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteTrip setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_deleteTrip setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteTrip setImage:[UIImage imageNamed:@"delete_trip"] forState:UIControlStateNormal];
        _deleteTrip.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_deleteTrip addTarget:self action:@selector(onDeleteBackTripClient) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteTrip;
}
- (UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchBtn.backgroundColor = RGBACOLOR(233, 71, 9, 1);
        _searchBtn.layer.cornerRadius = 3;
        [_searchBtn setImage:[UIImage imageNamed:@"search_baoji"] forState:UIControlStateNormal];
        [_searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_searchBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20.0,0.0, _searchBtn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
        _searchBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(onSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}
- (CounterView *)numView
{
    if (!_numView) {
        _numView = [[CounterView alloc] initWithFrame:CGRectMake(0, 0, 27, 90)];
    }
    return _numView;
}
- (UIImageView *)pointRedImg
{
    if (!_pointRedImg) {
        _pointRedImg = [UIImageView new];
        _pointRedImg.image = [UIImage imageNamed:@"show_baoji"];
    }
    return _pointRedImg;
}
- (UILabel *)showPointLb
{
    if (!_showPointLb) {
        _showPointLb = [UILabel new];
        _showPointLb.text = @"公务机包机流程：";
        _showPointLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _showPointLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _showPointLb.textAlignment = NSTextAlignmentLeft;
    }
    return _showPointLb;
}
- (UILabel *)pointContentLb
{
    if (!_pointContentLb) {
        _pointContentLb = [UILabel new];
        _pointContentLb.text = @"航班搜索 > 选定飞机 > 留下您的联系方式 > 客服人员对接需求";
        _pointContentLb.lineBreakMode = NSLineBreakByWordWrapping;
        _pointContentLb.numberOfLines = 0;
        _pointContentLb.textColor = RGBACOLOR(0, 0, 0, 0.3);
        _pointContentLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _pointContentLb.textAlignment = NSTextAlignmentLeft;
    }
    return _pointContentLb;
}
- (void)onSearchBtn
{
    if (_searchBlock) {
        _searchBlock();
    }
}
- (void)onSelectDateClient
{
    if (_dateBlock) {
        _dateBlock();
    }
}
- (void)onAddBackTripClient
{
    
}
- (void)onDeleteBackTripClient
{
    
}
- (void)onAddTripClient
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
