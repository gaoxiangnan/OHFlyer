
//
//  UIView+Common.m
//  FlyShare
//
//  Created by zzxcc on 15/12/24.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "UIView+Common.h"
#import "UIBadgeView.h"

#define kTagBadgeView  1000
#define kTagBadgePointView  1001
#define kTagLineView 1007

static char  BlankPageViewKey;

@implementation UIView (Common)

- (UIViewController *)findViewController
{
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)addBadgePoint:(NSInteger)pointRadius withPosition:(BadgePositionType)type {
    
    if(pointRadius < 1)
        return;
    
    [self removeBadgePoint];
    
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = kTagBadgePointView;
    badgeView.layer.cornerRadius = pointRadius;
    badgeView.backgroundColor = [UIColor redColor];
    
    switch (type) {
            
        case BadgePositionTypeMiddle:
            badgeView.frame = CGRectMake(0, self.frame.size.height / 2 - pointRadius, 2 * pointRadius, 2 * pointRadius);
            break;
            
        default:
            badgeView.frame = CGRectMake(self.frame.size.width - 2 * pointRadius, 0, 2 * pointRadius, 2 * pointRadius);
            break;
    }
    
    [self addSubview:badgeView];
}

- (void)removeBadgePoint {
    
    for (UIView *subView in self.subviews) {
        
        if(subView.tag == kTagBadgePointView)
            [subView removeFromSuperview];
    }
}

- (void)addBadgeTip:(NSString *)badgeValue withCenterPosition:(CGPoint)center{
    if (!badgeValue || !badgeValue.length) {
        [self removeBadgeTips];
    }else{
        UIView *badgeV = [self viewWithTag:kTagBadgeView];
        if (badgeV && [badgeV isKindOfClass:[UIBadgeView class]]) {
            [(UIBadgeView *)badgeV setBadgeValue:badgeValue];
            badgeV.hidden = NO;
        }else{
            badgeV = [UIBadgeView viewWithBadgeTip:badgeValue];
            badgeV.tag = kTagBadgeView;
            [self addSubview:badgeV];
        }
        [badgeV setCenter:center];
    }
}

- (void)addBadgeTip:(NSString *)badgeValue{
    if (!badgeValue || !badgeValue.length) {
        [self removeBadgeTips];
    }else{
        UIView *badgeV = [self viewWithTag:kTagBadgeView];
        if (badgeV && [badgeV isKindOfClass:[UIBadgeView class]]) {
            [(UIBadgeView *)badgeV setBadgeValue:badgeValue];
        }else{
            badgeV = [UIBadgeView viewWithBadgeTip:badgeValue];
            badgeV.tag = kTagBadgeView;
            [self addSubview:badgeV];
        }
        CGSize badgeSize = badgeV.frame.size;
        CGSize selfSize = self.frame.size;
        CGFloat offset = 2.0;
        [badgeV setCenter:CGPointMake(selfSize.width- (offset+badgeSize.width/2),
                                      (offset +badgeSize.height/2))];
    }
}

- (void)addBadgePoint:(NSInteger)pointRadius withPointPosition:(CGPoint)point {
    
    if(pointRadius < 1)
        return;
    
    [self removeBadgePoint];
    
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = kTagBadgePointView;
    badgeView.layer.cornerRadius = pointRadius;
    badgeView.backgroundColor = [UIColor colorWithHex:0xf75388];
    badgeView.frame = CGRectMake(0, 0, 2 * pointRadius, 2 * pointRadius);
    badgeView.center = point;
    [self addSubview:badgeView];
}

- (void)removeBadgeTips{
    NSArray *subViews =[self subviews];
    if (subViews && [subViews count] > 0) {
        for (UIView *aView in subViews) {
            if (aView.tag == kTagBadgeView && [aView isKindOfClass:[UIBadgeView class]]) {
                aView.hidden = YES;
            }
        }
    }
}

- (void)doLayerFrame
{
    self.layer.shadowColor = RGBACOLOR(34, 23, 20, 0.3).CGColor;
    self.layer.masksToBounds = NO;
    //偏移量
    self.layer.shadowOffset = CGSizeMake(0, 1);
    //半径
    self.layer.shadowRadius = 1;
    //透明度
    self.layer.shadowOpacity = 0.5;
}

#pragma mark BlankPageView
- (void)setBlankPageView:(EaseBlankPageView *)blankPageView{
    [self willChangeValueForKey:@"BlankPageViewKey"];
    objc_setAssociatedObject(self, &BlankPageViewKey,
                             blankPageView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"BlankPageViewKey"];
}

- (EaseBlankPageView *)blankPageView{
    return objc_getAssociatedObject(self, &BlankPageViewKey);
}

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData) {
        if (self.blankPageView) {
            self.blankPageView.hidden = YES;
            [self.blankPageView removeFromSuperview];
        }
    }else{
        if (!self.blankPageView) {
            self.blankPageView = [[EaseBlankPageView alloc] initWithFrame:CGRectMake(0, 37, kDeviceWidth, kDeviceHeight - 37 - 64)];
        }
        self.blankPageView.hidden = NO;
        [self.blankPageContainer addSubview:self.blankPageView];
        
        //        [self.blankPageContainer insertSubview:self.blankPageView atIndex:0];
        //        [self.blankPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.size.equalTo(self);
        //            make.top.left.equalTo(self.blankPageContainer);
        //        }];
        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}

- (UIView *)blankPageContainer{
    UIView *blankPageContainer = self;
    for (UIView *aView in [self subviews]) {
        if ([aView isKindOfClass:[UITableView class]]) {
            blankPageContainer = aView;
        }
    }
    return blankPageContainer;
}

@end


@implementation EaseBlankPageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configWithType:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_loadAndShowStatusBlock) {
            _loadAndShowStatusBlock();
        }
    });
    
    if (hasData) {
        [self removeFromSuperview];
        return;
    }
    
    self.alpha = 1.0;
    
    if (!_centerImg) {
        _centerImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_centerImg];
    }
    
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightLight];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLabel];
    }
    
//    [_tipLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
//    }];
    
    _reloadButtonBlock = nil;
    
    if (hasError) {
        if (!_reloadButton) {
            _reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _reloadButton.frame = CGRectZero;
            [_reloadButton setImage:[UIImage imageNamed:@"blankpage_button_reload"] forState:UIControlStateNormal];
            _reloadButton.adjustsImageWhenHighlighted = YES;
            [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

            [self addSubview:_reloadButton];
        }
        _reloadButton.hidden = NO;
        _reloadButtonBlock = block;
    }else{
        if (_reloadButton) {
            _reloadButton.hidden = YES;
        }
        
        NSString *imageName, *tipStr;
        _curType=blankPageType;
        switch (blankPageType) {
            case EaseBlankPageTypeFlytogether://拼机
            {
                imageName = nil;
                tipStr = @"未搜索到符合条件的航班";
            }
                break;
            default://其它页面（这里没有提到的页面，都属于其它）
            {
                imageName = nil;
                tipStr = @"这里还什么都没有\n赶快起来弄出一点动静吧";
            }
                break;
        }
        [_centerImg setImage:[UIImage imageNamed:imageName]];
        _tipLabel.text = tipStr;
        
        if (blankPageType == EaseBlankPageTypeFlytogether) {
            
            //新增按钮
            UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [moreBtn setBackgroundColor:[UIColor clearColor]];
            moreBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin];
            [moreBtn setTitleColor:kOrangeColor forState:UIControlStateNormal];
            moreBtn.layer.cornerRadius = 3;
            moreBtn.layer.masksToBounds = YES;
            moreBtn.layer.borderWidth = 1.0f;
            moreBtn.layer.borderColor = kOrangeColor.CGColor;
            [moreBtn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];

            [self addSubview:moreBtn];
            
            [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(103 , 30));
//                make.bottom.equalTo(_tipLabel.top).offset(-20);
//                make.centerX.equalTo(self.centerX);
            }];
            
            NSString *titleStr;
            switch (blankPageType) {
                case EaseBlankPageTypeFlytogether:
                    titleStr = @"查看更多航班";
                    break;
                default:
                    break;
            }
            //            NSMutableAttributedString *titleFontStr=[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"+ %@",titleStr]];
            //            NSRange range;
            //            range.location=0;
            //            range.length=1;
            //            [titleFontStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:range];
            //            [actionBtn setAttributedTitle:titleFontStr forState:UIControlStateNormal];
            
            [moreBtn setTitle:titleStr forState:UIControlStateNormal];
            
        }
    }
}


- (void)reloadButtonClicked:(id)sender{
    self.hidden = YES;
    [self removeFromSuperview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_reloadButtonBlock) {
            _reloadButtonBlock(sender);
        }
    });
}

-(void)btnAction{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_clickButtonBlock) {
            _clickButtonBlock(_curType);
        }
    });
}


@end
