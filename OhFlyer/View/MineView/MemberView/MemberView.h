//
//  MemberView.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/9.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"
typedef enum {
    integralTap = 0,
    memberGrade
}TapGesture;

typedef void (^pricilegeBlock)(NSInteger index);
typedef void (^gesBlock)(TapGesture tapGesture);


@interface MemberView : BaseView
@property (nonatomic, copy) pricilegeBlock pricilegeBlock;
@property (nonatomic, copy) gesBlock gesBlock;
@property (nonatomic, assign) TapGesture tapGestures;

@end
