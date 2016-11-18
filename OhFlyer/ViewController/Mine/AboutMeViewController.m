//
//  AboutMeViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/12/23.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AboutMeView.h"
#import "VersionInViewController.h"
#import "AFApiManage.h"
//#import "WeiboViewController.h"
#import "NSObject+Common.h"

@interface AboutMeViewController ()<AboutMeViewDelegate, UIAlertViewDelegate>
@property (nonatomic, strong) AboutMeView *aboutView;

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"关于飞享者";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    [self InitWithSubViews];
}

#pragma mark -InitWithSubViews
- (void)InitWithSubViews
{
    [self.view addSubview:self.aboutView];
}

- (AboutMeView *)aboutView
{
    if (!_aboutView) {
        _aboutView = [[AboutMeView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
        _aboutView.delegate = self;
    }
    return _aboutView;
}

#pragma mark -delegate
- (void)didSelectIndexpath:(NSIndexPath *)indexpath
{
    if (indexpath.row == 0) {
        
        VersionInViewController *vc = [[VersionInViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexpath.row == 1) {
        [[AFApiManage sharedManager] request_CheckVersionWithVersion:versionId andBlock:^(id data, NSError *error) {
            if (data) {
                if ([[data valueForKey:@"version"] isEqual:versionId]) {
                    kTipAlert(@"已是最新版本");
                }else{
                   // kTipAlert(@"有最新版本，请去商店更新!");
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"有最新版本，请去商店更新!" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"去商店" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[data valueForKey:@"pkgUrl"]]];
                    }];
                    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                    
                    [alertController addAction:cancelAction];
                    [alertController addAction:sureAction];
                    [self presentViewController:alertController animated:YES completion:nil];

                }
            }else{
                [NSObject showError:error];
            }
        }];
    }
    
    if (indexpath.row == 2) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"缓存清除" message:@"确定清除缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alertView show];
    }
    
}

- (void)attentionAction:(UIButton *)sender
{
//    if (sender.tag == 1001) {
//        [self.navigationController pushViewController:[WeiboViewController new] animated:YES];
//    }
    if (sender.tag == 1002){
        UIPasteboard *pboard = [UIPasteboard generalPasteboard];
        
        pboard.string = @"OhFlyer";
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"公共号\"OhFlyer\"已复制，您可以在微信中直接粘贴搜索。" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"去微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://"]];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:cancelAction];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - UIAlertViewDelegate方法实现
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //判断点击的是确认键
    if (buttonIndex == 1) {
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        [defaults removeObjectForKey:@"Message_MaxId"];
        [defaults removeObjectForKey:@"cityModel_RecentCity"];
        [defaults removeObjectForKey:@"bonus_maxId"];
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
//        [fileManager removeItemAtPath:cacheFilePath error:nil];
        
        
       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
       
       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
       for (NSString *p in files) {
           NSError *error;
           NSString *path = [cachPath stringByAppendingPathComponent:p];
           if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
           }
       }

        
        //04刷新第一行单元格
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:2 inSection:0];
        [_aboutView.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
