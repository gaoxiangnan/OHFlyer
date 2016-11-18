//
//  CityChooseViewController.h
//  FlyShare
//
//  Created by zzxcc on 15/11/25.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, pushType){
    pushTypeStartPlace,
    pushTypeEndPlace,
};

typedef NS_ENUM(NSInteger, pushControllerType){
    pushControllerTypeCharter,
    pushControllerTypeFlytogether,
    PushControllerTypeSelective,
};

@protocol CityChooseViewControllerDelegate <NSObject>

@optional
- (void) didSelectRowWithIndexPath:(NSIndexPath *)indexpath andCityName:(NSString *)cityName andButtonType:(pushType)type;

@required
- (void) didSelectRowWithCityName:(NSString *)cityName andButtonType:(pushType)type;

@end

@interface CityChooseViewController : BaseViewController
@property (nonatomic, weak) id<CityChooseViewControllerDelegate>delegate;
@property (nonatomic, assign) pushType pushType;
@property (nonatomic, assign) pushControllerType pushController;
@property (nonatomic, strong) NSIndexPath *indexpath;

@end
