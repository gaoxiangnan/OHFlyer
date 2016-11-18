//
//  SZCalendarPicker.m
//  SZCalendarPicker
//
//  Created by Stephen Zhuang on 14/12/1.
//  Copyright (c) 2014年 Stephen Zhuang. All rights reserved.
//

#import "SZCalendarPicker.h"
#import "SZCalendarCell.h"

NSString *const SZCalendarCellIdentifier = @"cell";

@interface SZCalendarPicker ()<UIPickerViewDelegate,UIPickerViewDataSource>
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

@property (nonatomic, strong) NSString *completString;

@property (nonatomic, strong) NSArray *hourArr;
@property (nonatomic, strong) NSArray *minArr;

@property (nonatomic, strong) UIView *bgPickView;

@property (nonatomic, strong) UIControl *bgControl;
@end

@implementation SZCalendarPicker


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
    headerView.backgroundColor = RGBACOLOR(10, 18, 50, 0.3);
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
    [_collectionView registerClass:[SZCalendarCell class] forCellWithReuseIdentifier:SZCalendarCellIdentifier];
    [_bgCalendarView addSubview:_collectionView];
    
    UIView *timeView = [[UIView alloc]init];
    if (kDevice_Is_iPhone5) {
        timeView.frame=CGRectMake(0, 382, kDeviceWidth, 64);
    }else{
        timeView.frame=CGRectMake(0, 432, kDeviceWidth, 64);
    }
    timeView.backgroundColor = RGBCOLOR(246, 246, 246);
    UITapGestureRecognizer *chooseTime = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onChooseTimeGes)];
    [timeView addGestureRecognizer:chooseTime];
    [_bgCalendarView addSubview:timeView];
    
    
    UILabel *showTime = [[UILabel alloc]init];
    showTime.text = @"时间（北京）：";
    showTime.textColor = RGBACOLOR(0, 0, 0, 0.7);
    showTime.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [timeView addSubview:showTime];
    [showTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(timeView).offset(20);
        make.centerY.equalTo(timeView);
    }];
    
    UILabel *showMin = [[UILabel alloc]init];
    showMin.text = @"分";
    showMin.textColor = RGBACOLOR(0, 0, 0, 0.7);
    showMin.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [timeView addSubview:showMin];
    [showMin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(timeView.mas_right).offset(-20);
        make.centerY.equalTo(timeView);
    }];
    
    _minLabel = [[UILabel alloc]init];
    _minLabel.text = @"30";
    _minLabel.backgroundColor = RGBCOLOR(10, 18, 50);
    _minLabel.textColor = [UIColor whiteColor];
    _minLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [timeView addSubview:_minLabel];
    [_minLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(showMin.mas_left).offset(-14);
        make.centerY.equalTo(timeView);
    }];
    
    UILabel *showHour = [[UILabel alloc]init];
    showHour.text = @"点";
    showHour.textColor = RGBACOLOR(0, 0, 0, 0.7);
    showHour.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [timeView addSubview:showHour];
    [showHour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_minLabel.mas_left).offset(-22);
        make.centerY.equalTo(timeView);
    }];
    
    _hourLabel = [[UILabel alloc]init];
    _hourLabel.text = @"13";
    _hourLabel.backgroundColor = RGBCOLOR(10, 18, 50);
    _hourLabel.textColor = [UIColor whiteColor];
    _hourLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [timeView addSubview:_hourLabel];
    [_hourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(showHour.mas_left).offset(-22);
        make.centerY.equalTo(timeView);
    }];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = RGBCOLOR(233, 71, 9);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(onSureBtn) forControlEvents:UIControlEventTouchUpInside];
    [_bgCalendarView addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(49));
    }];
    
    
    
    
    _bgPickView = [[UIView alloc]init];
    _bgPickView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgPickView];
    [_bgPickView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(260);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(260));
    }];
    
    UIView *pickerHeader = [[UIView alloc]init];
    pickerHeader.backgroundColor = RGBCOLOR(10, 18, 50);
    [_bgPickView addSubview:pickerHeader];
    [pickerHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgPickView);
        make.top.equalTo(_bgPickView);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(44));
    }];
    
    UILabel *showNameLb = [[UILabel alloc]init];
    showNameLb.text = @"选择出发时间";
    showNameLb.textColor = [UIColor whiteColor];
    showNameLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [pickerHeader addSubview:showNameLb];
    [showNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(pickerHeader);
    }];
    
    UIButton *canclePickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    canclePickBtn.tag = 1000;
    [canclePickBtn setTitle:@"取消" forState:UIControlStateNormal];
    [canclePickBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    canclePickBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [canclePickBtn addTarget:self action:@selector(onPickSelect:) forControlEvents:UIControlEventTouchUpInside];
    [pickerHeader addSubview:canclePickBtn];
    [canclePickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pickerHeader).offset(20);
        make.centerY.equalTo(pickerHeader);
        make.width.equalTo(@(50));
        make.height.equalTo(@(42));
    }];
    
    UIButton *surePickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    surePickBtn.tag = 1001;
    [surePickBtn setTitle:@"确定" forState:UIControlStateNormal];
    [surePickBtn setTitleColor:RGBCOLOR(233, 71, 9) forState:UIControlStateNormal];
    surePickBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [surePickBtn addTarget:self action:@selector(onPickSelect:) forControlEvents:UIControlEventTouchUpInside];
    [pickerHeader addSubview:surePickBtn];
    [surePickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(pickerHeader.mas_right).offset(-20);
        make.centerY.equalTo(pickerHeader);
        make.width.equalTo(@(50));
        make.height.equalTo(@(42));
    }];
    
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    // 显示选中框
    pickerView.showsSelectionIndicator=YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [self addSubview:pickerView];
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bgPickView);
        make.top.equalTo(_bgPickView).offset(44);
        make.width.equalTo(@(kDeviceWidth));
        make.height.equalTo(@(216));
        
    }];
    
    _bgControl = [[UIControl alloc]init];
    _bgControl.backgroundColor = RGBACOLOR(0, 0, 0, 0.7);
    [_bgControl addTarget:self action:@selector(onTapControl) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

#pragma Mark -- UIPickerViewDataSource
// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_hourArr count];
    }
    
    return [_minArr count];
}
#pragma Mark -- UIPickerViewDelegate
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    if (component == 1) {
        return 100;
    }
    return 180;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _proNameStr = [_hourArr objectAtIndex:row];
        NSLog(@"nameStr=%@",_proNameStr);
    } else {
        _proTimeStr = [_minArr objectAtIndex:row];
        NSLog(@"_proTimeStr=%@",_proTimeStr);
    }
    
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_hourArr objectAtIndex:row];
    } else {
        return [_minArr objectAtIndex:row];
        
    }
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
    SZCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SZCalendarCellIdentifier forIndexPath:indexPath];
    [cell.dateImg setImage:nil];
//    if (indexPath.section == 0) {
//        [cell.dateLabel setText:_weekDayArray[indexPath.row]];
//        [cell.dateLabel setTextColor:[UIColor redColor]];
//        cell.backgroundColor = RGBCOLOR(246, 246, 246);
//        [cell.dateLabel setBackgroundColor:RGBCOLOR(246, 246, 246)];
//    } else {
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
                    [cell.dateImg setImage:[UIImage imageNamed:@"today"]];
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
    SZCalendarCell * cell = (SZCalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.dateLabel.textColor = [UIColor whiteColor];
    [cell.dateImg setImage:[UIImage imageNamed:@"select_day"]];
    [cell bringSubviewToFront:cell.dateLabel];
    
    self.completString = [NSString stringWithFormat:@"%ld/%ld/%ld",day,[comp month],[comp year]];
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SZCalendarCell * cell = (SZCalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.dateLabel.textColor = RGBACOLOR(0, 0, 0, 0.7);
    [cell.dateImg setImage:nil];
    
}

- (void)onSureBtn
{
    if (self.calendarBlock) {
        self.calendarBlock(self.completString);
    }
}

- (void)onChooseTimeGes
{
    _bgCalendarView.frame = CGRectMake(0, -200, kDeviceWidth, kDeviceHeight -64);
    [UIView animateWithDuration:2 animations:^{
        
        [_bgPickView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(@(kDeviceWidth));
            make.height.equalTo(@(260));
        }];
        
        
        [self addSubview:_bgControl];
        [_bgControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.width.equalTo(@(kDeviceWidth));
            make.bottom.equalTo(_bgPickView.mas_top);
        }];
    }];
    
    
    
}
- (void)onTapControl
{
    _bgCalendarView.frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight -64);
    [UIView animateWithDuration:2 animations:^{
        [_bgControl removeFromSuperview];
        [_bgPickView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(260);
            make.width.equalTo(@(kDeviceWidth));
            make.height.equalTo(@(260));
        }];
    }];
    
}
- (void)onPickSelect:(UIButton *)sender
{
    if (sender.tag == 1000) {
        
    }else{
        _hourLabel.text = _proNameStr;
        _minLabel.text = _proTimeStr;
    }
    _bgCalendarView.frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight -64);
    [UIView animateWithDuration:2 animations:^{
        
        [_bgControl removeFromSuperview];
        [_bgPickView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(260);
            make.width.equalTo(@(kDeviceWidth));
            make.height.equalTo(@(260));
        }];
    }];
    
    
}
//- (void)show
//{
//    self.transform = CGAffineTransformTranslate(self.transform, 0, - self.frame.size.height);
//    [UIView animateWithDuration:0.5 animations:^(void) {
//        self.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL isFinished) {
//        [self customInterface];
//    }];
//}
//
//- (void)hide
//{
//    [UIView animateWithDuration:0.5 animations:^(void) {
//        self.transform = CGAffineTransformTranslate(self.transform, 0, - self.frame.size.height);
//        self.mask.alpha = 0;
//    } completion:^(BOOL isFinished) {
//        [self.mask removeFromSuperview];
//        [self removeFromSuperview];
//    }];
//}

@end
