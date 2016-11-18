
//
//  BaseTableViewCell.m
//  FlyShare
//
//  Created by zzxcc on 15/11/17.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
    return self;
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (CGFloat)staticHeight {
    return 44.0f;
}

@end
