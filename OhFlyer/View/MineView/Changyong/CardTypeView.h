//
//  CardTypeView.h
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardTypeViewDelegate <NSObject>

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CardTypeView : UIView


@property (nonatomic, assign) NSInteger selectType;
@property (nonatomic, weak) id<CardTypeViewDelegate>delegate;


- (instancetype)initWithFrame:(CGRect)frame selectType:(NSInteger)selectType;
@end
