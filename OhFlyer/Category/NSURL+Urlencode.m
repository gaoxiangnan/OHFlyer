//
// Created by lovejia on 14-7-1.
// Copyright (c) 2014 waqu. All rights reserved.
//

#import "NSURL+Urlencode.h"

@implementation NSURL (Urlencode)

+ (NSURL *)URLPercentEncodedString:(NSString *)url
{
    return [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

+ (NSURL *)URLEncodedString:(NSString *)url
{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
            NULL, (CFStringRef)url, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 ));
    return [NSURL URLWithString:encodedString];
}

@end