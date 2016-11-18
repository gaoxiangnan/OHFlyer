//
//  UIBadgeView.h
//  FlyShare
//
//  Created by zzxcc on 15/12/24.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBadgeView : UIView

@property (nonatomic, copy) NSString *badgeValue;

+ (UIBadgeView *)viewWithBadgeTip:(NSString *)badgeValue;
+ (CGSize)badgeSizeWithStr:(NSString *)badgeValue font:(UIFont *)font;

- (CGSize)badgeSizeWithStr:(NSString *)badgeValue;

@end
