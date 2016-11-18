//
//  Config.h
//  FlyShare
//
//  Created by zzxcc on 15/11/17.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#ifndef Config_h
#define Config_h

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif



#ifdef DEBUG
#define FLYLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )//分别是方法地址，文件名，在文件的第几行，自定义输出内容
#else
#define FLYLog( s, ... )
#endif



#define versionId @"v1.0"
#define loginMessage @"您还未登陆"
#define UMAPPKey @"56cea236e0f55a0834000236"

#define head_Version @"1.0"
#define head_platform @"ios"
#define head_deviceId  [OpenUDID value]

#define head_timestamp [NSString stringWithFormat:@"%ld", time(NULL)]

#define DEF_PERSISTENT_GET_OBJECT(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define DEF_PERSISTENT_SET_OBJECT(value, key)   [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]


//画单线
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)


//常用变量
#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define kColorTableBG UIColorFromRGB(0xfafafa)

#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kSViewWidth self.bounds.size.width
#define kSViewHeight self.bounds.size.height
#define kScreen_Frame       (CGRectMake(0, 0 ,kDeviceWidth,kDeviceHeight))


#define kScaleFrom_iPhone5s_Desgin(_X_) (_X_ * (kDeviceWidth/375))


//设备
#define IsIOS7 ([[UIDevice currentDevice].systemVersion floatValue]>=7.0?(IsIOS8?NO:YES):NO)
#define IsIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)
#define GTIOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define MessageCellHeight  69.5
#define kSeperatorHeight 0.5

//精选占位图
#define kChosenPlaceHolderImage [UIImage imageNamed:@"chosen_bitmap_product"]
#define kTopImagePlaceHolderImage [UIImage imageNamed:@"chosen_bitmap_banner"]


#endif /* Config_h */
