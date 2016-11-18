//
//  HandleCountryData.h
//  FlyShare
//
//  Created by zzxcc on 16/2/18.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HandleCountryData : NSObject
@property (nonatomic, strong) NSMutableArray *storeCities; //存放所有封装好的城市信息,未排序
@property (nonatomic, strong) NSMutableArray *sectionHeadsKeys;//存放所有城市的开头字母

- (NSArray *)compareWithModelArray:(NSMutableArray *)array;

@end
