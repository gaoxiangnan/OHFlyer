//
//  BaseWebViewController.m
//  FlyShare
//
//  Created by zzxcc on 16/2/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "BaseWebViewController.h"
#import "NSObject+Common.h"

@interface BaseWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *myWebView;
@property (nonatomic, strong) NSString *urlStr;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation BaseWebViewController

- (instancetype)initWithUrl:(NSString *)url
{
    self = [super init];
    if (self) {
        self.urlStr = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"活动详情";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    [self initWithSubViews];
}

#pragma mark -UI
- (void)initWithSubViews
{
    [self.view addSubview:self.myWebView];
}

- (UIWebView *)myWebView
{
    if (!_myWebView) {
        _myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
        _myWebView.backgroundColor = [UIColor clearColor];
        _myWebView.delegate = self;
        _myWebView.opaque = NO;
        _myWebView.scalesPageToFit = YES;
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlStr]
                                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                  timeoutInterval:10];
        [_myWebView loadRequest:request];
        _activityIndicator = [[UIActivityIndicatorView alloc]
                              initWithActivityIndicatorStyle:
                              UIActivityIndicatorViewStyleGray];
        _activityIndicator.hidesWhenStopped = YES;
        [_activityIndicator setCenter:CGPointMake(CGRectGetWidth(_myWebView.frame)/2, CGRectGetHeight(_myWebView.frame)/2)];
        [_myWebView addSubview:_activityIndicator];
    }
    return _myWebView;
}

#pragma mark -UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if([error code] == NSURLErrorCancelled)
        return;
    else{
        DebugLog(@"%@", error.description);
        [NSObject showError:error];
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
