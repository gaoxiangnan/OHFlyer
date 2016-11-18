//
//  HandleCityData.m
//  FlyShare
//
//  Created by zzxcc on 15/12/1.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "HandleCityData.h"
#import "CityModel.h"
#import "JSONKit.h"
#import "NSObject+ObjectMap.h"

@implementation HandleCityData

//按字母排序
NSInteger nickNameSort1(id user1, id user2, void *context)
{
    CityModel *u1, *u2;
    //类型转换
    u1 = (CityModel *)user1;
    u2 = (CityModel *)user2;
    return [u1.CityEnName localizedCompare:u2.CityEnName];
}
//
//- (NSArray *)cityDataDidHandled
//{
//    self.storeCities = [[NSMutableArray alloc] init];
//    //读取本地文件
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BaiduMap_cityCenter1" ofType:@"txt"];
//    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//    
//    NSString *textFile = [NSString stringWithContentsOfFile:filePath encoding:enc error:nil];
//    NSDictionary * result = [textFile objectFromJSONString];
//
//    NSArray *keys = [result allKeys];
//    
//    for (NSString *key in keys) {
//        NSArray *firstArr = [result objectForKey:key];
//        //各省份的字典封装
//        if ([key isEqualToString:@"provinces"]) {
//            for (NSDictionary *city in firstArr) {
//                NSArray *cities = [city objectForKey:@"cities"];
//                for (NSDictionary *cityDetail in cities) {
//                    CityModel *newCity = [[CityModel alloc] init];
//                    NSString *degree = [cityDetail objectForKey:@"g"];
//                    NSArray *degreeArr = [degree componentsSeparatedByString:@","];
//                    newCity.longitude = [[degreeArr objectAtIndex:0] doubleValue];
//                    newCity.latitude = [[degreeArr objectAtIndex:1] doubleValue];
//                    newCity.cityName = [cityDetail objectForKey:@"n"];
//                    //汉字转拼音,比较排序时候用
//                    NSMutableString *ms = [[NSMutableString alloc] initWithString:newCity.cityName];
//                    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
//                    }
//                    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
//                        newCity.letter = ms;
//                    }
//                    //都存放在数组中
//                    [_storeCities addObject:newCity];
//                    
//                }
//            }
//        }else{
//            for (NSDictionary *cityDetail in firstArr) {
//                CityModel *newCity = [[CityModel alloc] init];
//                NSString *degree = [cityDetail objectForKey:@"g"];
//                NSArray *degreeArr = [degree componentsSeparatedByString:@","];
//                newCity.longitude = [[degreeArr objectAtIndex:0] doubleValue];
//                newCity.latitude = [[degreeArr objectAtIndex:1] doubleValue];
//                newCity.cityName = [cityDetail objectForKey:@"n"];
//                NSMutableString *ms = [[NSMutableString alloc] initWithString:newCity.cityName];
//                if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
//                }
//                if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
//                    newCity.letter = ms;
//                }
//                [_storeCities addObject:newCity];
//            }
//        }
//    }
//    //排序后的数组初始化
//    NSArray *newArr = [[NSArray alloc] init];
//    //排序
   // newArr = [_storeCities sortedArrayUsingFunction:nickNameSort context:NULL];
//    //分组数组初始化
//    NSMutableArray *arrayForArrays = [NSMutableArray array];
//    //开头字母初始化
//    _sectionHeadsKeys = [[NSMutableArray alloc] init];
//    BOOL checkValueAtIndex= NO;  //flag to check
//    NSMutableArray *TempArrForGrouping = nil;
//    for(int index = 0; index < [newArr count]; index++)
//    {
//        CityModel *chineseStr = (CityModel *)[newArr objectAtIndex:index];
//        NSMutableString *strchar= [NSMutableString stringWithString:chineseStr.letter];
//        //取首字母
//        NSString *sr= [strchar substringToIndex:1];
//        //bNSLog(@"%@",sr);        //sr containing here the first character of each string
//        //检查数组内是否有该首字母，没有就创建
//        if(![_sectionHeadsKeys containsObject:[sr uppercaseString]])//here I'm checking whether the character already in the selection header keys or not
//        {
//            //不存在就添加进去
//            [_sectionHeadsKeys addObject:[sr uppercaseString]];
//            TempArrForGrouping = [[NSMutableArray alloc] initWithObjects:nil];
//            checkValueAtIndex = NO;
//        }
//        //有就把数据添加进去
//        if([_sectionHeadsKeys containsObject:[sr uppercaseString]])
//        {
//            [TempArrForGrouping addObject:[newArr objectAtIndex:index]];
//            if(checkValueAtIndex == NO)
//            {
//                [arrayForArrays addObject:TempArrForGrouping];
//                checkValueAtIndex = YES;
//            }
//        }
//    }
//    NSArray * array = [NSArray arrayWithObjects:_sectionHeadsKeys,arrayForArrays,_storeCities, nil];
//    return array;
//    
//}

- (NSArray *)compareWithModelArray:(NSArray *)array
{
    NSMutableArray *storeModel = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        CityModel *model = [NSObject objectOfClass:@"CityModel" fromJSON:dic];
        [storeModel addObject:model];
    }
    
    //分组数组初始化
    NSMutableArray *arrayForArrays = [NSMutableArray array];
    NSArray *newArray = [[NSArray alloc] init];
    //对model进行排序
    newArray = [storeModel sortedArrayUsingFunction:nickNameSort1 context:NULL];
    //开头字母初始化
    _sectionHeadsKeys = [[NSMutableArray alloc] init];
    BOOL checkValueAtIndex= NO;  //flag to check
    NSMutableArray *TempArrForGrouping = nil;
    
    for (NSInteger index = 0; index < [newArray count]; index++) {
        CityModel *chineseStr = newArray[index];
        NSMutableString *strchar= [NSMutableString stringWithString:chineseStr.CityEnName];
        //取首字母,截取到指定位数字母，但是不包括该位
        NSString *firstStr = [strchar substringToIndex:1];
        //检测是否包含该字母
        if(![_sectionHeadsKeys containsObject:[firstStr uppercaseString]]){
            //不存在就添加进去
            [_sectionHeadsKeys addObject:[firstStr uppercaseString]];
            TempArrForGrouping = [[NSMutableArray alloc] initWithObjects:nil];
            checkValueAtIndex = NO;
        }
        //有就把数据添加进去
        if([_sectionHeadsKeys containsObject:[firstStr uppercaseString]])
        {
            [TempArrForGrouping addObject:[newArray objectAtIndex:index]];
            if(checkValueAtIndex == NO)
            {
                [arrayForArrays addObject:TempArrForGrouping];
                checkValueAtIndex = YES;
            }
        }
    }
    
    NSArray *totalArray = [NSArray arrayWithObjects:_sectionHeadsKeys,arrayForArrays, nil];
    
    return totalArray;
}



@end
