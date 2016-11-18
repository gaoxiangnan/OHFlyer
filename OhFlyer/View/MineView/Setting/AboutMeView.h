//
//  AboutMeView.h
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AboutMeViewDelegate <NSObject>

- (void)didSelectIndexpath:(NSIndexPath *)indexpath;
- (void)attentionAction:(UIButton *)sender;

@end

@interface AboutMeView : UIView
@property (nonatomic, weak) id<AboutMeViewDelegate>delegate;
@property (nonatomic, strong) UITableView *tableView;

@end
