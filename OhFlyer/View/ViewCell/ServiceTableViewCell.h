//
//  ServiceTableViewCell.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/12.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SelectGesBlock)(BOOL selected);
@interface ServiceTableViewCell : UITableViewCell

@property (nonatomic, copy) SelectGesBlock gesBlock;

+ (CGFloat)cellHeight:(NSString *)string;
@end
