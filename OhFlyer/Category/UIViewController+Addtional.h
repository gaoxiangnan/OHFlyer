//
//  UIViewController+Addtional.h
//  Dream
//
//  Created by 江明 赵 on 7/6/14.
//  Copyright (c) 2014 江明 赵. All rights reserved.
//

@import UIKit;

@interface UIViewController (Addtional)

//设置返回按钮
- (void)createNavBarBackButtonItem;

- (void)rightWithText:(NSString *)text textColor:(UIColor *)textColor action:(SEL)sel;

- (void)leftWithText:(NSString *)text action:(SEL)sel;

- (void)rightWithImage:(UIImage *)image action:(SEL)sel;

- (void)leftWithImage:(UIImage *)image action:(SEL)sel;

- (CGRect)bounds;

- (CGRect)statusNavBounds;

- (CGRect)statusNavTabBarStaticBounds;

- (CGRect)tabBarBounds;

- (CGRect)segmentTabBarVisiableBounds;

- (CGRect)segmentVisiableBounds;

- (CGRect)segmentStaticViewBounds;

- (void)leftWithButtonImage:(UIImage *)image action:(SEL)sel;

- (void)rightWithButtonImage:(UIImage *)image action:(SEL)sel;

- (void)rightFullWithImage:(UIImage *)image action:(SEL)sel;

- (NSUInteger)supportedOrientationMasks;

- (UIInterfaceOrientation)supportedOrientations;

- (void)rightWithText:(NSString *)text action:(SEL)sel ;

@end
