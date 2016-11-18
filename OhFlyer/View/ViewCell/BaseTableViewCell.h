//
//  BaseTableViewCell.h
//  FlyShare
//
//  Created by zzxcc on 15/11/17.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;

+ (CGFloat)staticHeight;

@end
