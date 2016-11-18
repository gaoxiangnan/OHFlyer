//
//  FZHTabbarController.m
//  03-FZHTabbarController
//
//  Created by 冯志浩 on 16/8/16.
//  Copyright © 2016年 FZH. All rights reserved.
//

#import "FZHTabbarController.h"
#import "FZHNavigationController.h"
#import "FZHTabBar.h"
#import "ViewController.h"
#import "ContentViewController.h"
#import "MineViewController.h"

@interface FZHTabbarController ()<FZHTabBarDelegate>
@property (nonatomic, weak) FZHTabBar *customTabBar;

@end

@implementation FZHTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
//    effectview.frame = self.tabBar.bounds;
//    
//    [[UITabBar appearance]insertSubview:effectview atIndex:0];
    
    
    // 初始化tabbar
    [self setupTabbar];
    //初始化子控制器
    [self initSubVC];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //删除系统自动生成的UITabBarButton
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    FZHTabBar * customTabBar = [[FZHTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(FZHTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

-(void)initSubVC
{
    /**将此处的控制器换成自己的即可**/
    ViewController * home=[[ViewController alloc]init];
    [self setupChildVC:home Title:@"首页" imageName:@"tabbar_icon_news_normal" selectedImageName:@"tabbar_icon_news_highlight"];
    
    ContentViewController * message=[[ContentViewController alloc]init];
    [self setupChildVC:message Title:@"发现" imageName:@"tabbar_icon_bar_normal" selectedImageName:@"tabbar_icon_bar_highlight"];
    
    MineViewController * descover=[[MineViewController alloc]init];
    [self setupChildVC:descover Title:@"我的" imageName:@"tabbar_icon_me_normal"  selectedImageName:@"tabbar_icon_me_highlight"];
    
    
    
}
//初始化所有子控制器
-(void)setupChildVC:(UIViewController *)childVC Title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //1.设置标题
    childVC.title=title;
    childVC.tabBarItem.title = title;
    //2.设置图片
    childVC.tabBarItem.image=[UIImage imageNamed:imageName];
    //3.设置选中图片
    childVC.tabBarItem.selectedImage=[UIImage imageNamed:selectedImageName];
    //不在渲染图片
    childVC.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //4.添加导航控制器
    FZHNavigationController * Nav=[[FZHNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:Nav];
    //5.添加tabbar内部的按钮
    NSLog(@"%@",childVC.tabBarItem.title);
    [self.customTabBar addTabBarButtonWithItem:childVC.tabBarItem];
}
@end
