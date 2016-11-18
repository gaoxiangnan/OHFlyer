//
//  InvoiceHeaderViewController.m
//  FlyShare
//
//  Created by 向楠 on 16/5/31.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "InvoiceHeaderViewController.h"
#import "InvoiceHeaderView.h"
//#import "AFApiManage.h"
#import "Invoice.h"

@interface InvoiceHeaderViewController ()<InvoiceHeaderDelegate>
@property (nonatomic, strong) InvoiceHeaderView *invoiceView;
//@property (nonatomic, strong) User *user;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation InvoiceHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置常用发票抬头";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    if (!self.myInvoice) {
        self.myInvoice = [[Invoice alloc] init];
        self.title = @"添加常用旅客";
    }else{
        self.title = @"编辑常用旅客";
        [self rightWithText:@"删除" textColor:nil action:@selector(DeleteAction)];
    }
//    self.user = [Login curLoginUser];
    [self InitWithSubViews];
    // Do any additional setup after loading the view.
}
- (void)InitWithSubViews
{
    [self.view addSubview:self.invoiceView];
}
- (InvoiceHeaderView *)invoiceView{
    if (!_invoiceView) {
        _invoiceView = [[InvoiceHeaderView alloc]initWithFrame:self.view.frame];
        _invoiceView.backgroundColor = [UIColor whiteColor];
        _invoiceView.delegate = self;
        _invoiceView.invoice = self.myInvoice;
    }
    return _invoiceView;
}
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sureBt:(NSString *)ids withParams:(Invoice *)invoice
{
//    [self.view endEditing:YES];
//    User *user = [Login curLoginUser];
    
    NSString *tipStr = [invoice validateInfo];
    if (tipStr) {
        kTipAlert(@"%@", tipStr);
        return;
    }
    
    
    
    [self.view endEditing:YES];
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc]
                              initWithActivityIndicatorStyle:
                              UIActivityIndicatorViewStyleGray];
        CGSize captchaViewSize = self.view.bounds.size;
        _activityIndicator.hidesWhenStopped = YES;
        [_activityIndicator setCenter:CGPointMake(captchaViewSize.width/2, captchaViewSize.height/2)];
        [self.view addSubview:_activityIndicator];
    }
    [_activityIndicator startAnimating];
    
//    if (ids.length > 0) {
//        NSDictionary *params = @{@"title" : invoice.title,
//                                 @"userId" : user.id,
//                                 @"status" : invoice.status,
//                                 @"invoiceId" : invoice.id,
//                                 };
//        [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/editInvoice" andBlock:^(id data, NSError *error) {
//            [_activityIndicator stopAnimating];
//            if (data) {
//                [self.navigationController popViewControllerAnimated:YES];
//                kTipAlert(@"编辑成功");
//            }else{
//                [NSObject showError:error];
//            }
//        }];
//    }else{
//        NSDictionary *params = @{@"title" : invoice.title,
//                                 @"userId" : user.id,
//                                 };
//        [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/newInvoice" andBlock:^(id data, NSError *error) {
//            [_activityIndicator stopAnimating];
//            if (data) {
//                [self.navigationController popViewControllerAnimated:YES];
//                kTipAlert(@"添加成功");
//            }else{
//                [NSObject showError:error];
//            }
//        }];
//    }
    
    
}
- (void)DeleteAction
{
//    NSDictionary *params = @{@"id" : [self.myInvoice valueForKey:@"id"],
//                             @"userId" : self.user.id};
//    //删除这个联系人
//    [self.view endEditing:YES];
//    if (!_activityIndicator) {
//        _activityIndicator = [[UIActivityIndicatorView alloc]
//                              initWithActivityIndicatorStyle:
//                              UIActivityIndicatorViewStyleGray];
//        CGSize captchaViewSize = self.view.bounds.size;
//        _activityIndicator.hidesWhenStopped = YES;
//        [_activityIndicator setCenter:CGPointMake(captchaViewSize.width/2, captchaViewSize.height/2)];
//        [self.view addSubview:_activityIndicator];
//    }
//    [_activityIndicator startAnimating];
//    
//    [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/deleteInvoice" andBlock:^(id data, NSError *error) {
//        [_activityIndicator stopAnimating];
//        if (data) {
//            [self.navigationController popViewControllerAnimated:YES];
//            kTipAlert(@"删除成功");
//        }else{
//            [NSObject showError:error];
//        }
//    }];
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
