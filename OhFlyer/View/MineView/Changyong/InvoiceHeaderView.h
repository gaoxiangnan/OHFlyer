//
//  InvoiceHeaderView.h
//  FlyShare
//
//  Created by 向楠 on 16/5/31.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Invoice.h"

@protocol InvoiceHeaderDelegate <NSObject>
- (void)sureBt:(NSString *)ids withParams:(Invoice *)invoice;


@end
@interface InvoiceHeaderView : UIView

@property (nonatomic, strong) Invoice *invoice;
@property (nonatomic, weak) id<InvoiceHeaderDelegate> delegate;

@end
