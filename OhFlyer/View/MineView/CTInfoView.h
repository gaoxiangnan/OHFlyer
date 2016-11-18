//
//  CTInfoView.h
//  FlyShare
//
//  Created by zzxcc on 15/12/21.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"
#import "Invoice.h"
#import "Address.h"

@protocol tableViewCellSelect <NSObject>

- (void)didSelectIndexPath:(NSIndexPath *)indexPath andTableView:(UITableView *)tableView andModel:(id)model;
- (void)DeleteAction:(Contacts *)contact;

@end

@interface CTInfoView : UIView
@property (nonatomic, strong) NSMutableArray *adultsArray;
@property (nonatomic, strong) NSMutableArray *adressArray;
@property (nonatomic, strong) NSMutableArray *invoiceArray;
@property (nonatomic, weak) id<tableViewCellSelect>delegate;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView1;
@property (nonatomic, strong) UITableView *tableView2;


@end
