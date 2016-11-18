//
//  AddressView.h
//  FlyShare
//
//  Created by 向楠 on 16/5/31.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"
@protocol AddressDelegate <NSObject>
- (void)sureBt:(NSString *)ids withParams:(Address *)address;
@end

@interface AddressView : UIView
@property (nonatomic, strong) Address *address;
@property (nonatomic, weak)id<AddressDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame andDictionary:(NSDictionary *)dic;
- (void)getAddressData:(NSDictionary *)dic;

@end
