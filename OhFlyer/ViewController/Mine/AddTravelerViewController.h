//
//  AddTInfoViewController.h
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"
#import "TravelerAddView.h"

@interface AddTravelerViewController : BaseViewController
@property (nonatomic, strong) Contacts *myContacts;
@property BOOL isChild;

@end
