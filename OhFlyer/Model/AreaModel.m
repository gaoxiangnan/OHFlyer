//
//  AreaModel.m
//  FlyShare
//
//  Created by 向楠 on 16/6/7.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "AreaModel.h"

@implementation AreaModel
- (id)initWithDataDic:(NSDictionary *)data
{
    
    if (self = [super initWithDataDic:data]) {
        
        _areaArr = [[NSArray alloc] init];
        
        
    }
    
    return self;
    
}

- (NSDictionary *)attributeMapDictionary
{
    
    return @{@"areaName" : @"area_name", @"areaId" : @"area_id", @"areaDic" : @"list"};
    
}
@end
