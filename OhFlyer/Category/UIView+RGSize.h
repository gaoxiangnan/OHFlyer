//
//  UIView+RGSize.h
//  YouZhi
//
//  Created by roroge on 15/3/19.
//  Copyright (c) 2015年 com.roroge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RGSize)

@property (nonatomic) CGFloat lefts;
@property (nonatomic) CGFloat tops;
@property (nonatomic) CGFloat rights;
@property (nonatomic) CGFloat bottoms;
@property (nonatomic) CGFloat widths;
@property (nonatomic) CGFloat heights;

@property (nonatomic) CGPoint origins;
@property (nonatomic) CGSize sizes;

- (void)topAdd:(CGFloat)add;
- (void)leftAdd:(CGFloat)add;
- (void)widthAdd:(CGFloat)add;
- (void)heightAdd:(CGFloat)add;

@end
