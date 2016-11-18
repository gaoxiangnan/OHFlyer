//
//  CountrtyChooseViewController.m
//  FlyShare
//
//  Created by zzxcc on 16/2/18.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "CountrtyChooseViewController.h"
#import "CityChooseCell.h"
#import "ChartCityGroupCell.h"
//#import "AFApiManage.h"
#import "NSObject+Common.h"
#import "NSObject+ObjectMap.h"
#import "Login.h"
#import "CountryModel.h"
#import "HandleCountryData.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"

@interface CountrtyChooseViewController ()<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, ChartCityGroupCell>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

//是否是搜索状态
@property (nonatomic, assign) BOOL isSearch;

@property (nonatomic, strong) NSMutableArray *arraySection;
@property (nonatomic, strong) NSMutableArray *searchCountry;
//未排序
@property (nonatomic, strong) NSMutableArray *dataArray;
//排序
@property (nonatomic, strong) NSMutableArray *countryArray;
//首字母
@property (nonatomic, strong) NSMutableArray *headLetters;

@end

@implementation CountrtyChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    self.title = @"选择国籍";
    self.isSearch = NO;
    
    [self initWithSubViews];
    [self getData];
}

- (NSMutableArray *) arraySection
{
    if (_arraySection == nil) {
        _arraySection = [[NSMutableArray alloc] initWithObjects:@"热门", nil];
    }
    return _arraySection;
}

- (NSMutableArray *)searchCountry
{
    if (_searchCountry == nil) {
        _searchCountry = [[NSMutableArray alloc] init];
    }
    return _searchCountry;
}

- (NSMutableArray *)countryArray
{
    if (_countryArray == nil) {
        _countryArray = [[NSMutableArray alloc] init];
    }
    return _countryArray;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)headLetters
{
    if (_headLetters == nil) {
        _headLetters = [[NSMutableArray alloc] init];
    }
    return _headLetters;
}

#pragma mark -UI
- (void)initWithSubViews
{
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0f)];
        //    self.searchBar.barStyle     = UIBarStyleDefault;
        _searchBar.translucent  = YES;
        _searchBar.delegate     = self;
        _searchBar.placeholder  = @"中文/英文";
        _searchBar.keyboardType = UIKeyboardTypeDefault;
        [_searchBar setBarTintColor:[UIColor colorWithWhite:0.95 alpha:1.0]];
        [_searchBar.layer setBorderWidth:0.5f];
        [_searchBar.layer setBorderColor:[UIColor colorWithWhite:0.7 alpha:1.0].CGColor];
    }
    return _searchBar;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_searchBar.frame), kDeviceWidth, kDeviceHeight -64 - CGRectGetMaxY(_searchBar.frame)) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        // _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[CityChooseCell class] forCellReuseIdentifier:[CityChooseCell reuseIdentifier]];
        [_tableView registerClass:[ChartCityGroupCell class] forCellReuseIdentifier:[ChartCityGroupCell reuseIdentifier]];
        _tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexColor = kOrangeColor;
    }
    return _tableView;
}

#pragma mark -tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isSearch) {
        return self.searchCountry.count;
    }
    if (section == 0) {
        return 1;
    }
    return [_countryArray[section - 1] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isSearch) {
        return 1;
    }
    return _headLetters.count + 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.isSearch) {
        return nil;
    }
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 15)];
    views.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel new];
    switch (section) {
        case 0:
            label.text = @"热门国家";
            break;
        default:
           label.text = _headLetters[section - 1];
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 36.0f;
    }
    return 36.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.isSearch) {
        return 0.1;
    }
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
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

#pragma mark -index
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (self.isSearch) {
        return nil;
    }
    return self.arraySection;
}

//索引点击事件
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (index == 0) {
        return -1;
    }
    return index - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CountryModel *city;
    if (self.isSearch) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        city = _searchCountry[indexPath.row];
        cell.textLabel.text = city.name;
        return cell;
    }
    if (indexPath.section == 0) {
        ChartCityGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:[ChartCityGroupCell reuseIdentifier] forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }
    CityChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:[CityChooseCell reuseIdentifier] forIndexPath:indexPath];
    
    NSArray * letterArray = [_countryArray objectAtIndex:indexPath.section - 1];//对应字母所含城市数组
    city = [letterArray objectAtIndex:indexPath.row];
    cell.countryModel = city;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *countryName;
    if (self.isSearch) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        countryName = cell.textLabel.text;
    }else if (indexPath.section != 0){
        CityChooseCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        countryName = cell.countryModel.name;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getCountryName" object:countryName];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -searchBarDelegate
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
    UIButton *btn=[searchBar valueForKey:@"_cancelButton"];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self.searchCountry removeAllObjects];
    if (searchText.length == 0) {
        self.isSearch = NO;
    }else{
        self.isSearch = YES;
        if (searchText.length>0 && ![ChineseInclude isIncludeChineseInString:searchText]) {
            for (CountryModel *city in self.dataArray) {
                if ([ChineseInclude isIncludeChineseInString:city.name]) {
                    NSString *temPinYinStr = [PinYinForObjc chineseConvertToPinYin:city.name];
                    NSRange titleResult=[temPinYinStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                    NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:city.name];
                    NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                    if (titleHeadResult.length>0) {
                        [self.searchCountry addObject:city];
                    }else if (titleResult.length > 0) {
                        [self.searchCountry addObject:city];
                    }
                    
                }
                else{
                    NSRange titleResult=[city.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
                    if (titleResult.length>0) {
                        [self.searchCountry addObject:city];
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
            for (CountryModel *city in self.dataArray) {
                NSRange titleResult=[city.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [self.searchCountry addObject:city];
                }
            }
        }

        
    }
    [_tableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    searchBar.text=@"";
    [searchBar resignFirstResponder];
    self.isSearch = NO;
    [self.tableView reloadData];
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getData
{
    HandleCountryData *handle = [[HandleCountryData alloc] init];

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
    
    __unsafe_unretained typeof(self) weakSelf = self;

//    [[AFApiManage sharedManager] request_GetCountryListWithUserId:[Login getUserId] andBlock:^(id data, NSError *error) {
//        [_activityIndicator stopAnimating];
//        if (data) {
//            data = [data objectForKey:@"Countrys"];
//            for (NSDictionary *dic in data) {
//                CountryModel *model = [NSObject objectOfClass:@"CountryModel" fromJSON:dic]; //使用第三方库 直接把请求到的数据放到 model里
//                [weakSelf.dataArray addObject:model];
//            }
//            
//            //排序后
//            NSArray *paixuArray = [handle compareWithModelArray:weakSelf.dataArray];
//            self.headLetters = [paixuArray objectAtIndex:0];
//            self.countryArray = [paixuArray objectAtIndex:1];
//            
//            [self.arraySection addObjectsFromArray:self.headLetters];
//            
//            [_tableView reloadData];
//            
//        }else{
//            [NSObject showError:error];
//        }
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
