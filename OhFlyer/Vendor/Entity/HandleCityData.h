//
//  HandleCityData.h
//  FlyShare
//
//  Created by zzxcc on 15/12/1.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HandleCityData : NSObject
@property (nonatomic, strong) NSMutableArray *storeCities; //存放所有封装好的城市信息,未排序
@property (nonatomic, strong) NSMutableArray *sectionHeadsKeys;//存放所有城市的开头字母

- (NSArray *)cityDataDidHandled; //数组存三个数组,第一个存放所有的字母,第二个存分类数组,第三个数组存放所有城市信息
- (NSArray *)compareWithModelArray:(NSArray *)array;

@end
