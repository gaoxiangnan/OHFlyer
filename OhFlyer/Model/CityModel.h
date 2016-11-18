//
//  CityModel.h
//  FlyShare
//
//  Created by zzxcc on 15/12/1.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject
@property (nonatomic, strong, nonnull) NSString *CityId;
@property (nonatomic, strong, nonnull) NSString *CityName;
@property (nonatomic, strong, nonnull) NSString *CityEnName;
@property (nonatomic, strong, nonnull) NSString *AirportId;
@property (nonatomic, strong, nonnull) NSString *AirportName;
@property (nonatomic, strong, nonnull) NSString *AirportEnName;
@property (nonatomic, strong, nonnull) NSMutableArray *PortList;
@property (nonnull, nonatomic, strong) NSDictionary *propertyArrayMap;

+ (void)saveRecentCityData:(NSMutableArray *)dataArray;

+ (NSMutableArray *)getRecentCityData;

+ (BOOL)recentCityIsSaved;

@end
