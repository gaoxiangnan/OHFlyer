//
//  FTSaleProduct.m
//  FlyShare
//
//  Created by zzxcc on 16/1/22.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "FTSaleProduct.h"

@implementation FTSaleProduct

- (instancetype)init
{
    self = [super init];
    if (self) {
        _propertyArrayMap = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"FTSaleProduct", @"mealData", @"FTSaleProduct", @"persons",
                             @"FTSaleProduct", @"seatData", @"FTSaleProduct", @"planePics", nil];
        
    }
    return self;
}

- (NSString *)getSeatImageSelected
{
    NSString *img = nil;
    if ([self.seatType integerValue] == 1) {
        if ([self.status integerValue] == 0) {
            img = @"icon_sofa_optional";
        }
        if ([self.status integerValue] == 1) {
            img = @"icon_sofa_locked";
        }
        if ([self.status integerValue] == 2) {
            img = @"icon_sofa_locked";
        }
    }
    
    if ([self.seatType integerValue] == 2) {
        if ([self.status integerValue] == 0) {
            img = @"icon_topSofa_optional";
        }
        if ([self.status integerValue] == 1) {
            img = @"icon_topSofa_locked";
        }
        if ([self.status integerValue] == 2) {
            img = @"icon_topSofa_locked";
        }
    }
    if ([self.seatType integerValue] == 3) {
        if ([self.status integerValue] == 0) {
            img = @"icon_chair_optional";
        }
        if ([self.status integerValue] == 1) {
            img = @"icon_chair_locked";
        }
        if ([self.status integerValue] == 2) {
            img = @"icon_chair_locked";
        }
    }
    if ([self.seatType integerValue] == 4) {
       img = @"icon_desktop";
    }
    return img;
}


- (NSString *)getSeatImageUnselected
{
    NSString *img = nil;
    if ([self.seatType integerValue] == 1) {
        if ([self.status integerValue] == 0) {
            img = @"icon_sofa_selected";
        }
    }
    
    if ([self.seatType integerValue] == 2) {
        if ([self.status integerValue] == 0) {
            img = @"icon_topSofa_selected";
        }
    }
    if ([self.seatType integerValue] == 3) {
        if ([self.status integerValue] == 0) {
            img = @"icon_chair_selected";
        }
    }
    return img;
}


@end
