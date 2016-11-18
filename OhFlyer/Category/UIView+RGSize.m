//
//  UIView+RGSize.m
//  YouZhi
//
//  Created by roroge on 15/3/19.
//  Copyright (c) 2015年 com.roroge. All rights reserved.
//

#import "UIView+RGSize.h"

@implementation UIView (RGSize)

- (CGFloat)lefts {
    return self.frame.origin.x;
}
- (void)setLefts:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)leftAdd:(CGFloat)add{
    CGRect frame = self.frame;
    frame.origin.x += add;
    self.frame = frame;
}


- (CGFloat)tops {
    return self.frame.origin.y;
}
- (void)setTops:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)topAdd:(CGFloat)add{
    CGRect frame = self.frame;
    frame.origin.y += add;
    self.frame = frame;
}


- (CGFloat)rights {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRights:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottoms {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottoms:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}




- (CGFloat)widths {
    return self.frame.size.width;
}
- (void)setWidths:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)widthAdd:(CGFloat)add {
    CGRect frame = self.frame;
    frame.size.width += add;
    self.frame = frame;
}


- (CGFloat)heights {
    return self.frame.size.height;
}
- (void)setHeights:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)heightAdd:(CGFloat)add {
    CGRect frame = self.frame;
    frame.size.height += add;
    self.frame = frame;
}


- (CGPoint)origins {
    return self.frame.origin;
}
- (void)setOrigins:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGSize)sizes {
    return self.frame.size;
}
- (void)setSizes:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
