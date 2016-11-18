//
//  CityChooseViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/11/25.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "CityChooseViewController.h"
#import "HMSegmentedControl.h"
#import "CityChooseCell.h"
#import "CityModel.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"
#import "AFApiManage.h"
#import "HandleCityData.h"
#import "UIView+DrawLine.h"
#import "NSObject+ObjectMap.h"
#import "ChartCityGroupCell.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface CityChooseViewController()<UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate, UISearchControllerDelegate, UIScrollViewDelegate, CLLocationManagerDelegate, ChartCityGroupCell>
@property (nonatomic, strong) UISearchBar *citySearch;
@property (nonatomic, strong) HMSegmentedControl *segmentControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView1;
@property (nonatomic, strong) UISearchDisplayController *mySearchDisplayController;
//定位
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, strong) NSString *currentCity;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSMutableArray *charArr; //右边索引数组国内
@property (nonatomic, strong) NSMutableArray *charArr1; //右边索引数组国外
@property (nonatomic, strong) NSArray *headArr; //section header数组
@property (nonatomic, strong) NSArray *homeArray; //国内数组
@property (nonatomic, strong) NSArray *interNationArray; //国际数组

@property (nonatomic, strong) NSMutableArray *hotCityData; //存放热门城市
@property (nonatomic, strong) NSMutableArray *recentCityData; //存放最近访问
@property (nonatomic, strong) NSMutableArray *localCityData; //存放定位城市

@property (nonatomic, strong) NSMutableArray *fixArray;//存放国内城市model
@property (nonatomic, strong) NSMutableArray *fixArray1;//存放国际城市model
//@property (nonatomic, strong) NSMutableArray *tempArray;//中间数组
@property (nonatomic, strong) NSMutableArray *letters;//存放国内城市开头字母
@property (nonatomic, strong) NSMutableArray *letters1;//存放国际城市的开头字母
@property (nonatomic, strong) NSMutableArray *chineseCities;//存放所有未排序的城市信息
@property (nonatomic, strong) NSMutableArray *searchResults;

@end

@implementation CityChooseViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];

    self.navigationItem.titleView = self.citySearch;
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.homeArray = [[NSArray alloc] init];
    self.fixArray = [[NSMutableArray alloc] init];
    self.fixArray1 = [[NSMutableArray alloc] init];
    self.interNationArray = [[NSArray alloc] init];
    self.chineseCities = [[NSMutableArray alloc] init];
    self.recentCityData = [[NSMutableArray alloc] init];
    self.localCityData = [[NSMutableArray alloc] init];
    self.charArr = [NSMutableArray arrayWithObjects:@"当前", @"历史", @"热门", nil];
    self.charArr1 = [NSMutableArray arrayWithObjects:@"当前", @"历史", @"热门", nil];
    [self locationStart];
    [self InitWithSubViews];
    [self requestData];

}


#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.scrollView];
}

- (UISearchBar *)citySearch
{
    if (!_citySearch) {
        _citySearch = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 0, kDeviceWidth - 100, 30)];
        [_citySearch setSearchBarStyle:UISearchBarStyleMinimal];
        [_citySearch setPlaceholder:@"  我是搜索栏  "];
        _citySearch.delegate = self;
        
        _mySearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_citySearch contentsController:self];
        _mySearchDisplayController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_mySearchDisplayController.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _mySearchDisplayController.searchResultsTableView.backgroundColor = [UIColor whiteColor];
        _mySearchDisplayController.delegate = self;
        _mySearchDisplayController.searchResultsDataSource = self;
        _mySearchDisplayController.searchResultsDelegate = self;
        _mySearchDisplayController.displaysSearchBarInNavigationBar = YES;
        _mySearchDisplayController.searchResultsTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
        _mySearchDisplayController.searchResultsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _citySearch;
}

- (HMSegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"  国  内  ", @"  国  际  "]];
        _segmentControl.frame = CGRectMake(0, 64, kDeviceWidth, 37);
        _segmentControl.selectedSegmentIndex = 0;
        _segmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        _segmentControl.selectedTextColor = kOrangeColor;
        _segmentControl.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _segmentControl.selectionIndicatorColor = kOrangeColor;
        _segmentControl.selectionIndicatorHeight = 2.0f;
        _segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        [self.segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        [_segmentControl addLineUp:NO andDown:YES];
       // _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    }
    return _segmentControl;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segmentControl.frame), kDeviceWidth, kDeviceHeight - CGRectGetMaxY(_segmentControl.frame))];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(2 * kDeviceWidth, _scrollView.frame.size.height);
        _scrollView.delegate = self;
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, kDeviceWidth, _scrollView.frame.size.height) animated:NO];
        
        [_scrollView addSubview:self.tableView];
        [_scrollView addSubview:self.tableView1];
    }
    return _scrollView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - CGRectGetMaxY(_segmentControl.frame)) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
       // _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[CityChooseCell class] forCellReuseIdentifier:[CityChooseCell reuseIdentifier]];
        [_tableView registerClass:[ChartCityGroupCell class] forCellReuseIdentifier:[ChartCityGroupCell reuseIdentifier]];
        _tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexColor = kOrangeColor;
    }
    return _tableView;
}

- (UITableView *)tableView1
{
    if (!_tableView1) {
        _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(kDeviceWidth, 0, kDeviceWidth, kDeviceHeight - CGRectGetMaxY(_segmentControl.frame)) style:UITableViewStylePlain];
        _tableView1.dataSource = self;
        _tableView1.delegate = self;
        //_tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView1 registerClass:[CityChooseCell class] forCellReuseIdentifier:[CityChooseCell reuseIdentifier]];
        [_tableView1 registerClass:[ChartCityGroupCell class] forCellReuseIdentifier:[ChartCityGroupCell reuseIdentifier]];
        _tableView1.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
        _tableView1.sectionIndexBackgroundColor = [UIColor clearColor];
        _tableView1.sectionIndexColor = kOrangeColor;
    }
    return _tableView1;
}

#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return self.searchResults.count;
    }

//    NSArray *letterArray = [self.fixArray objectAtIndex:section];
    if (section < 3) {
        return 1;
    }
    NSArray *fixArray = (tableView == _tableView1) ? _fixArray1 : _fixArray;

    return [fixArray[section - 3] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return 1;
    }
    NSArray *letterArray = (tableView == _tableView1) ? _letters1 : _letters;

    return 2 + letterArray.count;
}

//索引点击事件
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSLog(@"%@", title);
    return index;
}

//添加索引列
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return nil;
    }
    
    if (tableView == _tableView) {
        return _charArr;
    }
    
    if (tableView == _tableView1) {
        return _charArr1;
    }
    return nil;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (tableView == _mySearchDisplayController.searchResultsTableView) {
//        return nil;
//    }else
//        return _charArr[section];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return nil;
    }
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 15)];
    views.backgroundColor = [UIColor whiteColor];
    NSArray *letterArray = (tableView == _tableView1) ? _letters1 : _letters;

    UILabel *label = [UILabel new];
    switch (section) {
        case 0:
            label.text = @"当前城市";
            break;
        case 1:
            label.text = @"历史城市";
            break;
        case 2:
            label.text = @"热门城市";
            break;
        default:
            label.text = letterArray[section - 3];
            break;
    }

    label.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightRegular];
    [views addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(views).offset(10);
        make.centerY.equalTo(views);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = kSeperatorLineColor;
    [views addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(5);
        make.height.equalTo(@(kSeperatorHeight));
        make.right.equalTo(views).offset(-30);
        make.centerY.equalTo(label);
    }];
    
    return views;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return 0.1;
    }
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return 36.0f;
    }
    if (indexPath.section == 0) {
        return [ChartCityGroupCell getCellHeightOfCityArray:self.localCityData];
    }
    if (indexPath.section == 1) {
        return [ChartCityGroupCell getCellHeightOfCityArray:self.recentCityData];
    }
    return 36.0f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 30)];
    }
 
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }

    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityModel * city;

    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        city = [self.searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = city.CityName;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        return cell;
    }
    if (indexPath.section < 3) {
        ChartCityGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:[ChartCityGroupCell reuseIdentifier] forIndexPath:indexPath];
        cell.delegate = self;
        if (indexPath.section == 0) {
            cell.noDateLabel.text = @"无法定位当前城市，请稍后再试";
            cell.cityArray = self.localCityData;
        }
        
        if (indexPath.section == 1) {
            if ([CityModel recentCityIsSaved]) {
                self.recentCityData = [CityModel getRecentCityData];
            }else{
                cell.noDateLabel.text = @"没有数据";
            }
            cell.cityArray = self.recentCityData;
        }
        return cell;
    }
    CityChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:[CityChooseCell reuseIdentifier] forIndexPath:indexPath];
    NSArray *fixArray;
    fixArray = (tableView == _tableView1) ? _fixArray1 : _fixArray;
    
    NSArray * letterArray = [fixArray objectAtIndex:indexPath.section - 3];//对应字母所含城市数组
    city = [letterArray objectAtIndex:indexPath.row];
    cell.cityModel = city;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CityModel *cityModel;
    NSString *str;
    if (tableView == _tableView1 || tableView == _tableView) {
        if (indexPath.section > 2) {
            CityChooseCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            str = cell.cityName.text;
            cityModel = cell.cityModel;
        }
        else if (indexPath.section == 0 && self.localCityData.count <= 0) {
//            [self locationStart];
            return;
        }
    }
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        str = cell.textLabel.text;
        cityModel = [self.searchResults objectAtIndex:indexPath.row];
    }
    if (cityModel) {
        [self didSelctedCity:cityModel];
        
        
        [self.navigationController popViewControllerAnimated:YES];
    }
 
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.searchResults = [[NSMutableArray alloc]init];
    
    if (searchText.length>0 && ![ChineseInclude isIncludeChineseInString:searchText]) {
        for (CityModel *city in self.chineseCities) {
            if ([ChineseInclude isIncludeChineseInString:city.CityName]) {
                NSString *temPinYinStr = [PinYinForObjc chineseConvertToPinYin:city.CityName];
                NSRange titleResult=[temPinYinStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:city.CityName];
                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleHeadResult.length>0) {
                    [self.searchResults addObject:city];
                }else if (titleResult.length > 0) {
                    [self.searchResults addObject:city];
                }
             
            }
            else{
                NSRange titleResult=[city.CityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [self.searchResults addObject:city];
                }
            }
            
//            NSRange chinese = [city.CityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
//            NSRange letters = [city.SpellName rangeOfString:searchText options:NSCaseInsensitiveSearch];
//            if (chinese.location != NSNotFound) {
//                [self.tempArray addObject:city];
//            }else if (letters.location != NSNotFound){
//                [self.tempArray addObject:city];
//            }
        }
    }else if (searchText.length > 0&&[ChineseInclude isIncludeChineseInString:searchText]) {
        for (CityModel *city in self.chineseCities) {
            NSRange titleResult=[city.CityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (titleResult.length>0) {
                [self.searchResults addObject:city];
            }
        }
    }
    [self.mySearchDisplayController.searchResultsTableView reloadData];
}

#pragma mark -HMSegmentedControlDelegate
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    
    //[_tableView1 reloadData];
    [self.scrollView scrollRectToVisible:CGRectMake(kDeviceWidth * segmentedControl.selectedSegmentIndex, 0, kDeviceWidth, _scrollView.frame.size.height) animated:YES];
    
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentControl setSelectedSegmentIndex:page animated:YES];
}

#pragma mark GYZCityGroupCellDelegate
- (void)cityGroupCellDidSelectCity:(CityModel *)city
{
    if (!city) {
        return;
    }
    [self didSelctedCity:city];
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -requestData
- (void)requestData
{
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc]
                              initWithActivityIndicatorStyle:
                              UIActivityIndicatorViewStyleGray];
        CGSize captchaViewSize = self.view.bounds.size;
        _activityIndicator.hidesWhenStopped = YES;
        [_activityIndicator setCenter:CGPointMake(captchaViewSize.width/2, captchaViewSize.height/2)];
        [self.view addSubview:_activityIndicator];
    }
    [_activityIndicator startAnimating];
    HandleCityData *handle = [[HandleCityData alloc] init];

    
    [[AFApiManage sharedManager] request_GetCityListWithUserId:[Login getUserId] andBlock:^(id data, NSError *error) {
        [_activityIndicator stopAnimating];
        if (data) {
            for (NSDictionary *dic in [data objectForKey:@"China"]) {
                CityModel *model = [NSObject objectOfClass:@"CityModel" fromJSON:dic];
                [self.chineseCities addObject:model];
            }
            
            for (NSDictionary *dic in [data objectForKey:@"Foreign"]) {
                CityModel *model = [NSObject objectOfClass:@"CityModel" fromJSON:dic];
                [self.chineseCities addObject:model];
            }
          //里面包含两个数组，第一个数据数组，第0个为开头字母
            self.homeArray = [handle compareWithModelArray:[data objectForKey:@"China"]];
            self.letters = [_homeArray objectAtIndex:0];
            self.fixArray = [_homeArray objectAtIndex:1];
            
            self.interNationArray = [handle compareWithModelArray:[data objectForKey:@"Foreign"]];
            self.letters1 = [_interNationArray objectAtIndex:0];
            self.fixArray1 = [_interNationArray objectAtIndex:1];
            
            [self.charArr addObjectsFromArray:self.letters];
            [self.charArr1 addObjectsFromArray:self.letters1];
            
            [_tableView reloadData];
            [_tableView1 reloadData];
            
        }else{
            [NSObject showError:error];
        }
            
    }];
}


#pragma mark -location
//开始定位
-(void)locationStart{
    //判断定位操作是否被允许
  
    if([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init] ;
        self.locationManager.delegate = self;
        //设置定位精度
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;//每隔多少米定位一次（这里的设置为每隔百米)
        if (IsIOS8) {
            //使用应用程序期间允许访问位置数据
            [self.locationManager requestAlwaysAuthorization];
            [self.locationManager requestWhenInUseAuthorization];
        }
        // 开始定位
        [self.locationManager startUpdatingLocation];
    }else {
        //提示用户无法进行定位操作
        NSLog(@"%@",@"定位服务当前可能尚未打开，请设置打开！");
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
        ChartCityGroupCell *cell = [_tableView cellForRowAtIndexPath:index];
        cell.noDateLabel.text = @"无法定位当前城市，请稍后再试";

    }
}
#pragma mark - CoreLocation Delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations

{
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    ChartCityGroupCell *cell = [_tableView cellForRowAtIndexPath:index];
    cell.noDateLabel.text = @"正在定位中...";
    
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [self.locationManager stopUpdatingLocation];
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
    CLLocation *currentLocation = [locations lastObject];
    
    //获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *array, NSError *error)
     {
         if (array.count >0)
         {
             CLPlacemark *placemark = [array objectAtIndex:0];
             //获取城市
             NSString *currCity = placemark.locality;
             if (!currCity) {
                 //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                 currCity = placemark.administrativeArea;
             }
             currCity = [currCity substringToIndex:currCity.length - 1];
             if (self.localCityData.count <= 0) {
                 CityModel *city = [[CityModel alloc] init];
                 city.CityName = currCity;
                 [self.localCityData addObject:city];
                 
                 [_tableView reloadData];
                 [_tableView1 reloadData];
             }
             
         } else if (error ==nil && [array count] == 0)
         {
             NSLog(@"No results were returned.");
             cell.noDateLabel.text = @"无法定位当前城市，请稍后再试";

         }else if (error !=nil)
         {
             NSLog(@"An error occurred = %@", error);
             cell.noDateLabel.text = @"无法定位当前城市，请稍后再试";

         }
         
     }];
    
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    if (error.code ==kCLErrorDenied) {
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
        NSLog(@"%ld", (long)error.code);
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
        ChartCityGroupCell *cell = [_tableView cellForRowAtIndexPath:index];
        cell.noDateLabel.text = @"无法定位当前城市，请稍后再试";
    }
    
}



#pragma mark -Private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didSelctedCity:(CityModel *)cityModel
{
    //去重复和插入第一位
    [_recentCityData enumerateObjectsUsingBlock:^(CityModel *model, NSUInteger idx, BOOL *stop) {
        if ([cityModel.CityName isEqualToString: model.CityName]) {
            [_recentCityData removeObject:model];
            *stop = YES;
        }
    }];
    [_recentCityData insertObject:cityModel atIndex:0];
    if (_recentCityData.count >= 9) {
        [_recentCityData removeLastObject];
    }
    [CityModel saveRecentCityData:_recentCityData];
    
    //执行代理方法
    if ([_delegate respondsToSelector:@selector(didSelectRowWithIndexPath:andCityName:andButtonType:)]) {
        [_delegate didSelectRowWithIndexPath:self.indexpath andCityName:cityModel.CityName andButtonType:self.pushType];
    }
    
    if ([_delegate respondsToSelector:@selector(didSelectRowWithCityName:andButtonType:)]) {
        [_delegate didSelectRowWithCityName:cityModel.CityName andButtonType:self.pushType];
        
    }
}

@end
