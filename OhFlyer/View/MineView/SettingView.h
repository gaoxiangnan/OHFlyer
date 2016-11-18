//
//  SettingView.h
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pushView <NSObject>

- (void)didSelectIndexPath:(NSIndexPath *)indexPath;
- (void)loginOut;

@end

@interface SettingView : UIView
@property (nonatomic, weak) id<pushView>delegate;

@end
