//
//  ShadowView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/13.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "ShadowView.h"

@implementation ShadowView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
    }
    return self;
}
-(void)layoutSubviews
{
    self.layer.borderColor = [UIColor colorWithRed:197/255.f green:197/255.f blue:197/255.f alpha:1].CGColor;
    self.layer.borderWidth = 0.5f;
    self.layer.allowsEdgeAntialiasing = YES;
    self.layer.allowsGroupOpacity = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
