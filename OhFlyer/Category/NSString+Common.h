//
//  NSString+Common.h
//  FlyShare
//
//  Created by zzxcc on 15/12/24.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (NSString *)md5Str;

- (NSString*) sha1Str;

+ (NSString*)countNumAndChangeformat:(NSString*)num;


@end
