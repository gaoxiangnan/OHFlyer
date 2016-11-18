//
//  NumSelectView.m
//  OhFlyer
//
//  Created by 向楠 on 16/9/9.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "NumSelectView.h"
#define perWid (5)

@interface NumSelectView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UIImageView *selectImg;
@end

@implementation NumSelectView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        
    }
    return self;
}

-(void)createUI
{
    _bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _bgScrollView.backgroundColor = RGBCOLOR(246, 246, 246);
    _bgScrollView.showsVerticalScrollIndicator = NO;
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    _bgScrollView.contentSize = CGSizeMake(500+self.frame.size.width/2, self.frame.size.height);
    NSInteger count = (_bgScrollView.contentSize.width-self.frame.size.width/2)/perWid;
    
    for(NSInteger i=0;i<count;i++){
        if(i%10==0){
            UILabel *labe2 = [UILabel new];//initWithFrame:CGRectMake(perWid*i+self.frame.size.width/2, 20, 40, 20)];
            if (i/10 == 0) {
                labe2.text = @"不限";
            }else{
                labe2.text = [NSString stringWithFormat:@"%ld",i/10];
            }
//            labe2.text = [NSString stringWithFormat:@"%ld",i/10];
            labe2.textAlignment = NSTextAlignmentCenter;
            labe2.textColor = RGBACOLOR(0, 0, 0, 0.3);
            labe2.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
            [_bgScrollView addSubview:labe2];
            [labe2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_bgScrollView).offset(perWid*i+self.frame.size.width/2);
                make.centerY.equalTo(_bgScrollView);
                make.width.equalTo(@(40));
                make.height.equalTo(@(20));
            }];
        }
        
    }
    _bgScrollView.delegate = self;
    _bgScrollView.tag = 80;
    [self addSubview:_bgScrollView];
    
    UIView *cenView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-5, 0, 50, self.frame.size.height)];
    
    cenView.userInteractionEnabled = NO;
    cenView.backgroundColor = [UIColor clearColor];
    
    
    //    UIImageView *quan = [[UIImageView alloc]init];
    //
    //    quan.frame = CGRectMake(0, 0, 34, 34);
    //    quan.center = cenView.center;
    //    quan.image = [UIImage imageNamed:@"quan_quan"];
    //    [cenView addSubview:quan];
    
    
    [cenView addSubview:self.numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cenView);
    }];
    
    [cenView addSubview:self.selectImg];
    [_selectImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cenView);
//        make.width.height.equalTo(@(34));
    }];
    
    
    [self addSubview:cenView];
}
- (UIImageView *)selectImg
{
    if (!_selectImg) {
        _selectImg = [UIImageView new];
        _selectImg.image = [UIImage imageNamed:@"custom_daysImg"];
    }
    return _selectImg;
}
- (UILabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [UILabel new];
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.textColor = RGBCOLOR(233, 71, 9);
        _numLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        CGFloat kedu = (_bgScrollView.contentOffset.x)/(perWid*10);
        if (kedu == 0) {
            _numLabel.text = @"不限";
        }else{
            _numLabel.text = [NSString stringWithFormat:@"%d",(int)ceil(kedu)];
        }
        
    }
    return _numLabel;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.tag == 80){//i/10+40
        CGFloat kedu = (scrollView.contentOffset.x)/(perWid*10);
        NSString *keduStr = [NSString stringWithFormat:@"%d",(int)ceil(kedu)];
        if (kedu == 0) {
            _numLabel.text = @"不限";
        }else{
            _numLabel.text = keduStr;
        }
    }
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView.tag == 80){
        [self roundScrollview:scrollView];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(scrollView.tag == 80){
        [self roundScrollview:scrollView];
    }
}

-(void)roundScrollview:(UIScrollView *)scrollView{
    NSInteger ii = (NSInteger)(scrollView.contentOffset.x-30+scrollView.frame.size.width/2)*10/(perWid);
    NSLog(@"%ld %f",ii,scrollView.contentOffset.x);
    int bb = [self.numLabel.text intValue];
    [scrollView setContentOffset:CGPointMake(roundf(bb*50), 0) animated:YES];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
