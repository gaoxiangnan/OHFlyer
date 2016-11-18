//
//  HomeView.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/17.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "BaseView.h"

typedef enum
{
    Pinji = 0,
    Baoji,
    
}AirPlane;
typedef void (^onSelectBlock)(AirPlane);
typedef void (^onSelectActivityBlock)();
@interface HomeView : BaseView
@property (nonatomic, copy) onSelectBlock airBlock;
@property (nonatomic, copy) onSelectActivityBlock activityBlock;
@property (nonatomic, assign) float tabbarHeight;

@end
