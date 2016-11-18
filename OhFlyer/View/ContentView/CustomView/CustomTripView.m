//
//  CustomTripView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/6.
//  Copyright © 2016年 向楠. All rights reserved.
//


#import "CustomTripView.h"
#import "BottomShadowView.h"
#import "CustomTripTableViewCell.h"


@interface CustomTripView ()



@property (nonatomic, strong) UIView *bgStepView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *resetBtn;
@property (nonatomic, strong) UIButton *destination;
@property (nonatomic, strong) UIButton *tripReference;
@property (nonatomic, strong) UIButton *submitDemand;

@property (nonatomic, strong) UIImageView *lineOne;
@property (nonatomic, strong) UIImageView *lineTwo;




@end

@implementation CustomTripView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self InitWithSubViews];
    }
    return self;
}
- (void)InitWithSubViews
{
    
    __weak CustomTripView *cus = self;
    self.countryView = [[TripCountrySelectView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    self.countryView.nextBlock = ^(){
        [cus bringSubviewToFront:cus.referView];
    };
    
    [self addSubview:self.countryView];
    


    self.referView = [[JourneyReferView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight )];
    self.referView.nextBlock = ^(){
        [cus bringSubviewToFront:cus.submitView];
    };
    self.referView.journeyBack = ^(){
        [cus bringSubviewToFront:cus.countryView];
    };
    [self addSubview:self.referView];
    
    
    
    
    self.submitView = [[SubmitView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight )];
    self.submitView.nextBlock = ^(){
        NSLog(@"哈哈哈哈");
    };
    self.submitView.submitBack = ^(){
        [cus bringSubviewToFront:cus.referView];
    };
    [self addSubview:self.submitView];
    
    
    
    
    [self bringSubviewToFront:self.countryView];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
