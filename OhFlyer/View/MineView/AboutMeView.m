//
//  AboutMeView.m
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "AboutMeView.h"
#import "UIView+DrawLine.h"
#import "TravelerAddCell.h"

#define FS_AMAdimageHeight kScaleFrom_iPhone5s_Desgin(125)

@interface AboutMeView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIImageView *adImage;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UIView *footView;

@property (nonatomic, strong) UIButton *wechartBtn;
@property (nonatomic, strong) UIButton *weiboBtn;

@end

@implementation AboutMeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = [NSMutableArray arrayWithObjects:@"版本功能介绍", @"升级新版本", @"清除缓存", nil];
        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.bounces = NO;
        _tableView.tableHeaderView = self.adImage;
        _tableView.tableFooterView = self.footView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIImageView *)adImage
{
    if (!_adImage) {
        _adImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, FS_AMAdimageHeight)];
        _adImage.image = [UIImage imageNamed:@"about_me"];
    }
    return _adImage;
}


- (UIView *)footView
{
    if (!_footView) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - FS_AMAdimageHeight-kScaleFrom_iPhone5s_Desgin(150)-64)];
        _footView.backgroundColor = kTableViewBGColor;
        UIView *bgHead = [UIView new];
        bgHead.backgroundColor = [UIColor clearColor];
        [_footView addSubview:bgHead];
        [bgHead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_footView).offset(kScaleFrom_iPhone5s_Desgin(57));
            make.right.equalTo(_footView.mas_right).offset(-kScaleFrom_iPhone5s_Desgin(57));
            make.top.equalTo(_footView).offset(kScaleFrom_iPhone5s_Desgin(161));
            make.height.equalTo(_footView);
        }];
        
        UIImageView *showImg = [UIImageView new];
        showImg.image = [UIImage imageNamed:@"attention_us"];
        [bgHead addSubview:showImg];
        [showImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgHead);
            make.top.equalTo(bgHead);
        }];

        
        UIButton *weiboBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [weiboBtn setBackgroundImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
        weiboBtn.userInteractionEnabled = YES;
        weiboBtn.tag = 1001;
        [weiboBtn addTarget:self action:@selector(attentionAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgHead addSubview:weiboBtn];
        [weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgHead).offset(kScaleFrom_iPhone5s_Desgin(23));
            make.top.equalTo(bgHead).offset(kScaleFrom_iPhone5s_Desgin(37));
            make.width.equalTo(@(80));
            make.height.equalTo(@(34));
        }];
        
        UIButton *weixinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [weixinBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
        weixinBtn.userInteractionEnabled = YES;
        weixinBtn.tag = 1002;
        [weixinBtn addTarget:self action:@selector(attentionAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgHead addSubview:weixinBtn];
        [weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgHead.mas_right).offset(-kScaleFrom_iPhone5s_Desgin(23));
            make.top.equalTo(weiboBtn);
            make.width.equalTo(@(80));
            make.height.equalTo(@(34));
        }];
    }
    return _footView;
}

#pragma mark -tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kScaleFrom_iPhone5s_Desgin(50.0f);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(TravelerAddCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell addLineUp:NO andDown:YES andColor:kSeperatorLineColor andLeftSpace:20 andRightSpace:20];
    cell.rightArrow.hidden = NO;
    cell.typeLabel.text = _dataArr[indexPath.row];
    if (indexPath.row == 2) {
        cell.infoLabel.hidden = NO;
        cell.infoLabel.text = [self getCacheSize];
    }
    cell.inputField.userInteractionEnabled = NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TravelerAddCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TravelerAddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_delegate respondsToSelector:@selector(didSelectIndexpath:)]) {
        [_delegate didSelectIndexpath:indexPath];
    }
    
}

#pragma mark -private
- (NSString *)getCacheSize
{
    
//    //定义变量存储总的缓存大小
//    long long sumSize = 0;
//    
//    //01.获取当前图片缓存路径
//     NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
//    //02.创建文件管理对象
//     NSFileManager *filemanager = [NSFileManager defaultManager];
//
//    //获取当前缓存路径下的所有子路径
//     NSArray *subPaths = [filemanager subpathsOfDirectoryAtPath:cacheFilePath error:nil];
//    
//    //遍历所有子文件
//     for (NSString *subPath in subPaths) {
//        //1）.拼接完整路径
//         NSString *filePath = [cacheFilePath stringByAppendingFormat:@"/%@",subPath];
//        //2）.计算文件的大小
//         long long fileSize = [[filemanager attributesOfItemAtPath:filePath error:nil]fileSize];
//        //3）.加载到文件的大小
//        sumSize += fileSize;
//        }
//    float size_m = sumSize/(1000*1000);
//    return [NSString stringWithFormat:@"%.2fM",size_m];
    
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    CGFloat fileSize = [self folderSizeAtPath:cachPath];
    
    return [NSString stringWithFormat:@"%.2fMB",fileSize];
}

- (CGFloat)folderSizeAtPath:(NSString *)folderPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) {
        return 0;
    }
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString *fileName = nil;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

- (long long)fileSizeAtPath:(NSString *)filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
    
}

- (void)attentionAction:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(attentionAction:)]) {
        [_delegate attentionAction:sender];
    }
}

@end
