//
//  CuSZCalendarPicker.m
//  OhFlyer
//
//  Created by 向楠 on 16/11/2.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "CuSZCalendarPicker.h"
#import "CuSZcalendarCell.h"
NSString *const CuSZCalendarCellIdentifier = @"cell";
@interface CuSZCalendarPicker ()
{
    NSString  *_proNameStr;
    NSString  *_proTimeStr;
}

@property (nonatomic, strong) UIView *bgCalendarView;
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) UILabel *monthLabel;

@property (nonatomic, strong) UILabel *yearLabel;

@property (nonatomic , strong) NSArray *weekDayArray;
@property (nonatomic , strong) UIView *mask;

@property (nonatomic, strong) UILabel *minLabel;
@property (nonatomic, strong) UILabel *hourLabel;


@property (nonatomic, strong) NSArray *hourArr;
@property (nonatomic, strong) NSArray *minArr;

@property (nonatomic, strong) UIView *bgPickView;

@property (nonatomic, strong) UIControl *bgControl;
@end
@implementation CuSZCalendarPicker
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self customInterface];
    }
    return self;
}
- (void)awakeFromNib
{
    
    
}

- (void)customInterface
{
    _weekDayArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    self.hourArr = [[NSArray alloc]initWithObjects:@"01点",@"02点",@"03点",@"04点",@"05点",@"06点",@"07点",@"08点",@"09点",@"10点",@"11点",@"12点",@"13点",@"14点",@"15点",@"16点",@"17点",@"18点",@"19点",@"20点",@"21点",@"22点",@"23点",@"00点",nil];
    self.minArr = [[NSArray alloc]initWithObjects:@"00分",@"15分",@"30分",@"45分",nil];
    
    _bgCalendarView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight -64)];
    [self addSubview:_bgCalendarView];
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 66)];
    headerView.backgroundColor = RGBACOLOR(233, 71, 9, 1);
    [_bgCalendarView addSubview:headerView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.tag = 0;
    [leftBtn setImage:[UIImage imageNamed:@"arrow_left_calendar"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(onSelectturn:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(20);
        make.top.equalTo(headerView).offset(8);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.tag = 1;
    [rightBtn setImage:[UIImage imageNamed:@"arrow_right_calendar"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(onSelectturn:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headerView.mas_right).offset(-20);
        make.top.equalTo(headerView).offset(8);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    
    _monthLabel = [[UILabel alloc] init];
    _monthLabel.textColor = [UIColor whiteColor];
    _monthLabel.textAlignment = NSTextAlignmentCenter;
    _monthLabel.font = [UIFont systemFontOfSize:32 weight:UIFontWeightBold];
    [headerView addSubview:_monthLabel];
    [_monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView).offset(kScaleFrom_iPhone5s_Desgin(-50));
        make.centerY.equalTo(headerView);
    }];
    
    _yearLabel = [[UILabel alloc] init];
    _yearLabel.textColor = [UIColor whiteColor];
    _yearLabel.textAlignment = NSTextAlignmentCenter;
//    [_yearLabel setText:[NSString stringWithFormat:@"%li",(long)[self year:self.date]]];
    _yearLabel.font = [UIFont systemFontOfSize:32 weight:UIFontWeightLight];
    [headerView addSubview:_yearLabel];
    [_yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_monthLabel.mas_right).offset(5);
        make.centerY.equalTo(headerView);
    }];
    
    UIView *showView = [[UIView alloc]initWithFrame:CGRectMake(0, 66, kDeviceWidth, 46)];
    showView.backgroundColor = RGBCOLOR(246, 246, 246);
    [_bgCalendarView addSubview:showView];
    
    for (int i = 0; i < 7; i ++) {
        UILabel *showLabel = [[UILabel alloc]init];
        showLabel.text = [_weekDayArray objectAtIndex:i];
        showLabel.textColor = RGBACOLOR(0, 0, 0, 0.7);
        showLabel.textAlignment = NSTextAlignmentCenter;
        showLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        showLabel.frame = CGRectMake(kDeviceWidth/7*i, 0, kDeviceWidth/7, 46);
        [showView addSubview:showLabel];
    }
    
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(5, 112, kDeviceWidth-10, 320) collectionViewLayout:layout];
    CGFloat itemWidth = (_collectionView.frame.size.width-10) / 7;
    CGFloat itemHeight = _collectionView.frame.size.width / 7;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    ;
    
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView setCollectionViewLayout:layout animated:YES];
    [_collectionView registerClass:[CuSZcalendarCell class] forCellWithReuseIdentifier:CuSZCalendarCellIdentifier];
    [_bgCalendarView addSubview:_collectionView];
    
    
    
}



- (void)onSelectturn:(UIButton *)sender
{
    if (sender.tag == 0) {
        [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
            self.date = [self lastMonth:self.date];
        } completion:nil];
    }else{
        [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
            self.date = [self nextMonth:self.date];
        } completion:nil];
    }
}
- (void)setDate:(NSDate *)date
{
    _date = date;
    [_monthLabel setText:[NSString stringWithFormat:@"%.2ld月",(long)[self month:date]]];
    [_yearLabel setText:[NSString stringWithFormat:@"%li",(long)[self year:self.date]]];
    [_collectionView reloadData];
}

#pragma mark - date

- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (NSInteger)totaldaysInThisMonth:(NSDate *)date{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

- (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

#pragma -mark collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    if (section == 0) {
    //        return _weekDayArray.count;
    //    } else {
    return 42;
    //    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CuSZcalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CuSZCalendarCellIdentifier forIndexPath:indexPath];
    [cell.dateImg setImage:nil];
    NSInteger daysInThisMonth = [self totaldaysInMonth:_date];
    NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    
    if (i < firstWeekday) {
        [cell.dateLabel setText:@""];
        
    }else if (i > firstWeekday + daysInThisMonth - 1){
        [cell.dateLabel setText:@""];
    }else{
        day = i - firstWeekday + 1;
        [cell.dateLabel setText:[NSString stringWithFormat:@"%li",(long)day]];
        [cell.dateLabel setTextColor:RGBACOLOR(0, 0, 0, 0.2)];
        [cell.dateImg setImage:nil];
        
        //this month
        if ([_today isEqualToDate:_date]) {
            if (day == [self day:_date]) {
                [cell.dateLabel setTextColor:[UIColor redColor]];
                [cell.dateImg setImage:[UIImage imageNamed:@"custom_today"]];
            } else if (day > [self day:_date]) {
                [cell.dateLabel setTextColor:RGBACOLOR(0, 0, 0, 0.7)];
                [cell.dateImg setImage:nil];
            }
        } else if ([_today compare:_date] == NSOrderedAscending) {
            [cell.dateLabel setTextColor:RGBACOLOR(0, 0, 0, 0.7)];
            [cell.dateImg setImage:nil];
        }
        //        }
    }
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.section == 1) {
    NSInteger daysInThisMonth = [self totaldaysInMonth:_date];
    NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    
    if (i >= firstWeekday && i <= firstWeekday + daysInThisMonth - 1) {
        day = i - firstWeekday + 1;
        
        //this month
        if ([_today isEqualToDate:_date]) {
            if (day > [self day:_date]) {
                return YES;
            }
        } else if ([_today compare:_date] != NSOrderedDescending) {
            return YES;
        }
    }
    //    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.date];
    NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    day = i - firstWeekday + 1;
    CuSZcalendarCell * cell = (CuSZcalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.dateLabel.textColor = [UIColor whiteColor];
    [cell.dateImg setImage:[UIImage imageNamed:@"custom_selectday"]];
    [cell bringSubviewToFront:cell.dateLabel];
    
    if (_calendarBlock) {
        _calendarBlock([NSString stringWithFormat:@"%ld/%ld/%ld",day,[comp month],[comp year]]);
    }
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CuSZcalendarCell * cell = (CuSZcalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.dateLabel.textColor = RGBACOLOR(0, 0, 0, 0.7);
    [cell.dateImg setImage:nil];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
