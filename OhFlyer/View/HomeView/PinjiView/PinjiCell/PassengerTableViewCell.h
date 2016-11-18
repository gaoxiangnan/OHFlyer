//
//  PassengerTableViewCell.h
//  OhFlyer
//
//  Created by 向楠 on 16/10/26.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DeletePassenger)();
@interface PassengerTableViewCell : UITableViewCell

@property (nonatomic, copy) DeletePassenger deleteBlock;

@end
