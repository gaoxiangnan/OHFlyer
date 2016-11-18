//
//  BaojiDetailView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/31.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaojiDetailView.h"
#import "BaojiDetailTableViewCell.h"
#import "UIView+DrawLine.h"
@interface BaojiDetailView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *airHeaderView;
@property (nonatomic, strong) UILabel *numPersonLb;

@property (nonatomic, strong) UITableView *airList;
@property (nonatomic, strong) NSArray *landNum;

@end
@implementation BaojiDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];;
    if (self) {
        self.backgroundColor = RGBACOLOR(246, 246, 246, 1);
        self.landNum = [NSArray arrayWithObjects:@"0",@"1", nil];
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    
    [self addSubview:self.airList];
    [_airList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(@(kDeviceWidth));
//        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@(kDeviceHeight-64));
    }];
}
- (UILabel *)numPersonLb
{
    if (!_numPersonLb) {
        _numPersonLb = [UILabel new];
        _numPersonLb.text = @"14";
        _numPersonLb.textColor = [UIColor darkGrayColor];
        _numPersonLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
        _numPersonLb.textAlignment = NSTextAlignmentLeft;
    }
    return _numPersonLb;
}

- (UITableView *)airList
{
    if (!_airList) {
        _airList = [[UITableView alloc] init];
        _airList.delegate = self;
        _airList.dataSource = self;
        _airList.separatorStyle = UITableViewCellSeparatorStyleNone;
        _airList.tableHeaderView = self.airHeaderView;
//        _airList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            
//        }];
//        _airList.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            
//        }];
    }
    return _airList;
}
- (UIView *)airHeaderView
{
    if (!_airHeaderView) {
        _airHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 42+_landNum.count*45)];
        _airHeaderView.backgroundColor = RGBACOLOR(246, 246, 246, 1);
        UILabel *showMaxPerson = [UILabel new];
        showMaxPerson.text = @"最大乘客人数  ";
        showMaxPerson.textColor = RGBACOLOR(0, 0, 0, 0.7);
        showMaxPerson.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        [_airHeaderView addSubview:showMaxPerson];
        [showMaxPerson mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_airHeaderView).offset(16);
            make.top.equalTo(_airHeaderView).offset(14);
        }];
        [_airHeaderView addSubview:self.numPersonLb];
        [_numPersonLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(showMaxPerson.mas_right).offset(10);
            make.top.equalTo(showMaxPerson);
        }];
        
        
        for (int i = 0; i < _landNum.count; i ++) {
            UILabel *startPla = [UILabel new];
            startPla.text = @"新加坡";
            startPla.textColor = [UIColor blackColor];
            startPla.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
            [_airHeaderView addSubview:startPla];
            [startPla mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(showMaxPerson);
                make.top.equalTo(showMaxPerson.mas_bottom).offset(10 + i*45);
            }];
            
            UILabel *startAir = [UILabel new];
            startAir.text = @"新加坡机场";
            startAir.textColor = RGBACOLOR(0, 0, 0, 0.5);
            startAir.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
            [_airHeaderView addSubview:startAir];
            [startAir mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(startPla);
                make.top.equalTo(startPla.mas_bottom).offset(3);
            }];
            
            UIImageView *showGoImg = [UIImageView new];
            showGoImg.image = [UIImage imageNamed:@"start_detail"];
            [_airHeaderView addSubview:showGoImg];
            [showGoImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(startPla.mas_right).offset(40);
                make.bottom.equalTo(startPla.mas_bottom).offset(5);
            }];
            
            UILabel *arrivePlaLb = [UILabel new];
            arrivePlaLb.text = @"北京";
            arrivePlaLb.textColor = [UIColor blackColor];
            arrivePlaLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
            arrivePlaLb.textAlignment = NSTextAlignmentLeft;
            [_airHeaderView addSubview:arrivePlaLb];
            [arrivePlaLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(showGoImg.mas_right).offset(40);
                make.top.equalTo(startPla);
            }];
            
            UILabel *arriveAir = [UILabel new];
            arriveAir.text = @"北京首都机场";
            arriveAir.textColor = RGBACOLOR(0, 0, 0, 0.5);
            arriveAir.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
            [_airHeaderView addSubview:arriveAir];
            [arriveAir mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(arrivePlaLb);
                make.top.equalTo(arrivePlaLb.mas_bottom).offset(3);
            }];
            
            
            UILabel *timeLb = [UILabel new];
            timeLb.text = @"2016/11/12 13:30";
            timeLb.textColor = [UIColor blackColor];
            timeLb.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
            timeLb.textAlignment = NSTextAlignmentLeft;
            [_airHeaderView addSubview:timeLb];
            [timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(arrivePlaLb.mas_right).offset(10);
                make.top.equalTo(arrivePlaLb);
            }];
        }
        
    
    }
    return _airHeaderView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(BaojiDetailTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell addLineUp:NO andDown:YES andColor:RGBCOLOR(239, 239, 239)];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"BaojiDetailTableViewCell";
    BaojiDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[BaojiDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_myBlock) {
        _myBlock();
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
