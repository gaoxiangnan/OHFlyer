//
//  AddressViewController.h
//  FlyShare
//
//  Created by 向楠 on 16/5/31.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"

@interface AddressViewController : BaseViewController
@property (nonatomic, strong) Address *myAddress;
@property (nonatomic, strong) NSDictionary *areaDic;
@end
