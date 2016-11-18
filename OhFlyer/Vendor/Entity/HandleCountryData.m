//
//  HandleCountryData.m
//  FlyShare
//
//  Created by zzxcc on 16/2/18.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "HandleCountryData.h"
#import "CountryModel.h"
#import "JSONKit.h"
#import "NSObject+ObjectMap.h"
#import "PinYinForObjc.h"

@implementation HandleCountryData

//按字母排序
NSInteger nickNameSort(id user1, id user2, void *context)
{
    CountryModel *u1, *u2;
    //类型转换
    u1 = (CountryModel *)user1;
    u2 = (CountryModel *)user2;
    return [[PinYinForObjc chineseConvertToPinYinHead:u1.name] localizedCompare:[PinYinForObjc chineseConvertToPinYinHead:u2.name]];
}

- (NSArray *)compareWithModelArray:(NSMutableArray *)array
{
    //分组数组初始化
    NSMutableArray *arrayForArrays = [NSMutableArray array];
    NSArray *newArray = [[NSArray alloc] init];
    //对model进行排序
    newArray = [array sortedArrayUsingFunction:nickNameSort context:NULL];
    //开头字母初始化
    _sectionHeadsKeys = [[NSMutableArray alloc] init];
    BOOL checkValueAtIndex= NO;  //flag to check
    NSMutableArray *TempArrForGrouping = nil;
    
    for (NSInteger index = 0; index < [newArray count]; index++) {
        CountryModel *chineseStr = newArray[index];
        NSMutableString *strchar= [NSMutableString stringWithString:[PinYinForObjc chineseConvertToPinYinHead:chineseStr.name]];
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
