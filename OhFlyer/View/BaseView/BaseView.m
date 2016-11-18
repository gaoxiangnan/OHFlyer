//
//  BaseView.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = HEXCOLOR(@"＃F6F6F6", 1);
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
