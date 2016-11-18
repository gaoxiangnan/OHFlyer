//
//  CityModel.m
//  FlyShare
//
//  Created by zzxcc on 15/12/1.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#define cityModel_RecentCity @"cityModel_RecentCity"

#import "CityModel.h"

@implementation CityModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _propertyArrayMap = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"CityModel", @"PortList", nil];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.CityName forKey:@"CityName"];
    [aCoder encodeObject:self.CityId forKey:@"CityId"];
    [aCoder encodeObject:self.CityEnName forKey:@"CityEnName"];
    [aCoder encodeObject:self.AirportId forKey:@"AirportId"];
    [aCoder encodeObject:self.AirportName forKey:@"AirportName"];
    [aCoder encodeObject:self.AirportEnName forKey:@"AirportEnName"];
    [aCoder encodeObject:self.PortList forKey:@"PortList"];
#warning 这个地方存储数组有问题
    [aCoder encodeObject:self.propertyArrayMap forKey:@"propertyArrayMap"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.CityId = [aDecoder decodeObjectForKey:@"CityId"];
        self.CityName = [aDecoder decodeObjectForKey:@"CityName"];
        self.CityEnName = [aDecoder decodeObjectForKey:@"CityEnName"];
        self.AirportId = [aDecoder decodeObjectForKey:@"AirportId"];
        self.AirportName = [aDecoder decodeObjectForKey:@"AirportName"];
        self.AirportEnName = [aDecoder decodeObjectForKey:@"AirportEnName"];
        self.PortList = [aDecoder decodeObjectForKey:@"PortList"];
        self.propertyArrayMap = [aDecoder decodeObjectForKey:@"propertyArrayMap"];
    }
    return self;
}

+ (void)saveRecentCityData:(NSMutableArray *)dataArray
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (CityModel *model in dataArray) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
        [array addObject:data];
    }
    //转成不可变数组存储本地
    NSArray * localArray = [NSArray arrayWithArray:array];
    [[NSUserDefaults standardUserDefaults] setObject:localArray forKey:cityModel_RecentCity];
}

+ (NSMutableArray *)getRecentCityData
{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:cityModel_RecentCity];
    NSMutableArray *array1 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < array.count; i++) {
        CityModel *infoModel = [NSKeyedUnarchiver unarchiveObjectWithData:array[i]];
        [array1 addObject:infoModel];
    }
    return  array1;
}

+ (BOOL)recentCityIsSaved
{
    NSUserDefaults *usr = [NSUserDefaults standardUserDefaults];
    if ( [usr objectForKey:cityModel_RecentCity]) {
        return YES;
    }
    return NO;
}

@end
