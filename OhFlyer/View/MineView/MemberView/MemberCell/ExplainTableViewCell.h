//
//  ExplainTableViewCell.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/10.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExplainTableViewCell : UITableViewCell
{
    CGSize _labelSize;
}

+ (CGFloat)cellHeight:(NSString *)string;
@end
