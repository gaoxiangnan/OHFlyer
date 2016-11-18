//
//  GXNAleartView.m
//  AddViewText
//
//  Created by xngao on 14-5-13.
//  Copyright (c) 2014年 xngao. All rights reserved.
//

#import "GXNAleartView.h"
#define APPWINDOW   [[UIApplication sharedApplication].delegate window]
#define DEFAULT_MARGIN_TOP  30
#define CORNER_RADIUS  3
#define kSizeArk(text,font,c) [text sizeWithFont:[UIFont systemFontOfSize:font] constrainedToSize:CGSizeMake(c, 999) lineBreakMode:NSLineBreakByWordWrapping]
@interface GXNAleartView()
{
    
}
@property (strong, nonatomic) UIControl *bgControl;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation GXNAleartView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    CGRect bounds =[APPWINDOW bounds];
    _bgControl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(bounds), CGRectGetWidth(bounds))];
    _bgControl.backgroundColor = [UIColor blackColor];
    _bgControl.alpha = 0.5;
    [_bgControl addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    self.layer.cornerRadius = CORNER_RADIUS;
}

+ (id)loadViewFromXibNamed
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    if (array && [array count]) {
        return array[0];
    }else {
        return nil;
    }
}


+ (void)GXNAleartWithView:(UIView *)views message:(NSString *)message
{
    GXNAleartView *aleartView = [GXNAleartView loadViewFromXibNamed];
    [aleartView shouInViews:views message:message];
}
- (void)shouInViews:(UIView *)view message:(NSString *)message
{
    [view addSubview:_bgControl];
    _bgControl.frame = view.bounds;
    [view addSubview:self];
    
    UIImageView *headImg = [UIImageView new];
    headImg.image = [UIImage imageNamed:@"pinji_head"];
    [self addSubview:headImg];
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(self);
    }];
    
    
    
    
    CGPoint origin = CGPointMake((CGRectGetWidth(view.bounds) - CGRectGetWidth(self.bounds))/2, (CGRectGetHeight(view.bounds) - CGRectGetHeight(self.bounds))/2 - DEFAULT_MARGIN_TOP);
    CGRect frame = self.bounds;
    frame.origin.x = origin.x;
    frame.origin.y = origin.y;
    self.frame = frame;
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.alpha = 1.0;
                         [self.layer addAnimation:[self scaleAnimation:YES] forKey:@"ITTALERTVIEWWILLAPPEAR"];
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                         }
                     }];
    
    
}


- (void)hide
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.alpha = 0.0;
                         [self.layer addAnimation:[self scaleAnimation:NO] forKey:@"ITTALERTVIEWWILLDISAPPEAR"];
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             [_bgControl removeFromSuperview];
                             [self removeFromSuperview];
                         }
                     }];
}

- (CAKeyframeAnimation*)scaleAnimation:(BOOL)show
{
    CAKeyframeAnimation *scaleAnimation = nil;
    scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.delegate = self;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    if (show){
        scaleAnimation.duration = 0.5;
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.85, 0.85, 0.85)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1.05)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 0.95)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    }else{
        scaleAnimation.duration = 0.3;
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 0.8)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 0.6)]];
    }
    scaleAnimation.values = values;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.removedOnCompletion = TRUE;
    return scaleAnimation;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
