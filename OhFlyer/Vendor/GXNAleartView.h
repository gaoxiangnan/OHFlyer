//
//  GXNAleartView.h
//  AddViewText
//
//  Created by xngao on 14-5-13.
//  Copyright (c) 2014年 xngao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GXNAleartView : UIView

@property (nonatomic,assign) CGFloat dltime;




+ (id)loadViewFromXibNamed;





+ (void)GXNAleartWithView:(UIView *)views message:(NSString *)message;


@end
