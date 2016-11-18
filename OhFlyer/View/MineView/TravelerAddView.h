//
//  TravelerAddView.h
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"

@protocol pushDelegate <NSObject>

- (void)didSelectAtIndexPath:(NSIndexPath *)indexPath andCardType:(NSInteger)cardType;
- (void)sureBt:(UIButton *)sender withParams:(Contacts *)contacts;

@end

@interface TravelerAddView : UIView
@property (nonatomic, weak) id<pushDelegate>delegate;
@property (nonatomic, strong) Contacts *myContacts;
@property (nonatomic, assign) NSInteger cardType;
@property (nonatomic, strong) UIButton *checkButton;

- (instancetype)initWithFrame:(CGRect)frame withContacts:(Contacts *)contact andIsChild:(BOOL)isChild;

@end
