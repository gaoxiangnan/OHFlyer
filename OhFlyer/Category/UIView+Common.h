//
//  UIView+Common.h
//  FlyShare
//
//  Created by zzxcc on 15/12/24.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EaseBlankPageView;


typedef NS_ENUM(NSInteger, BadgePositionType) {
    
    BadgePositionTypeDefault = 0,
    BadgePositionTypeMiddle
};

typedef NS_ENUM(NSInteger, EaseBlankPageType)
{
    EaseBlankPageTypeFlytogether = 0,
};

@interface UIView (Common)
@property (strong, nonatomic) EaseBlankPageView *blankPageView;

- (void)doLayerFrame;
- (UIViewController *)findViewController;
- (void)addBadgeTip:(NSString *)badgeValue withCenterPosition:(CGPoint)center;
- (void)addBadgeTip:(NSString *)badgeValue;
- (void)addBadgePoint:(NSInteger)pointRadius withPosition:(BadgePositionType)type;
- (void)addBadgePoint:(NSInteger)pointRadius withPointPosition:(CGPoint)point;
- (void)removeBadgePoint;
- (void)removeBadgeTips;

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;

@end

#pragma mark blankPageView
@interface EaseBlankPageView : UIView
@property (nonatomic, strong) UIImageView *centerImg;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *reloadButton;
@property (nonatomic, assign) EaseBlankPageType curType;

@property (copy, nonatomic) void(^reloadButtonBlock)(id sender);
@property (copy, nonatomic) void(^loadAndShowStatusBlock)();
@property (copy, nonatomic) void(^clickButtonBlock)(EaseBlankPageType curType);

- (void)configWithType:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;

@end
