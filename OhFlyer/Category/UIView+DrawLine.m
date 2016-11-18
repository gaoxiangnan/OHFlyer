//
//  UIView+DrawLine.m
//  FlyShare
//
//  Created by zzxcc on 15/12/4.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "UIView+DrawLine.h"

#define kTagLineView 1007

@implementation UIView (DrawLine)

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown
{
    [self addLineUp:hasUp andDown:hasDown andColor:kSeperatorLineColor];
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color
{
    [self removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView = [UIView lineViewWithPointYY:0 andColor:color];
        upView.tag = kTagLineView;
        [self addSubview:upView];
    }
    if (hasDown) {
        UIView *downView = [UIView lineViewWithPointYY:(CGRectGetMaxY(self.bounds) - 0.5) andColor:color];
        downView.tag = kTagLineView;
        [self addSubview:downView];
    }
    return [self addLineUp:hasUp andDown:hasDown andColor:color andLeftSpace:0];
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace
{
    [self removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView = [UIView lineViewWithPointYY:0 andColor:color andLeftSpace:leftSpace];
        upView.tag = kTagLineView;
        [self addSubview:upView];
    }
    if (hasDown) {
        UIView *downView = [UIView lineViewWithPointYY:(CGRectGetMaxY(self.bounds) - 0.5) andColor:color andLeftSpace:leftSpace];
        downView.tag = kTagLineView;
        [self addSubview:downView];
    }
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace andRightSpace:(CGFloat)rightSpace
{
    [self removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView = [UIView lineViewWithPointYY:0 andColor:color andLeftSpace:leftSpace andRightSpace:rightSpace];
        upView.tag = kTagLineView;
        [self addSubview:upView];
    }
    if (hasDown) {
        UIView *downView = [UIView lineViewWithPointYY:(CGRectGetMaxY(self.bounds) - 0.5) andColor:color andLeftSpace:leftSpace andRightSpace:rightSpace];
        downView.tag = kTagLineView;
        [self addSubview:downView];
    }
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY
{
    return [self lineViewWithPointYY:pointY andColor:kSeperatorLineColor];
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color
{
    return [self lineViewWithPointYY:pointY andColor:color andLeftSpace:0];
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(leftSpace, pointY, kDeviceWidth - leftSpace, 0.5)];
    lineView.backgroundColor = color;
    return lineView;
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace andRightSpace:(CGFloat)rightSpace
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(leftSpace, pointY, kDeviceWidth - leftSpace - rightSpace, 0.5)];
    lineView.backgroundColor = color;
    return lineView;
}

- (void)removeViewWithTag:(NSInteger)tag{
    for (UIView *aView in [self subviews]) {
        if (aView.tag == tag) {
            [aView removeFromSuperview];
        }
    }
}

@end
