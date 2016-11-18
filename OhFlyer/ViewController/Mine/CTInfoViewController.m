//
//  CTInfoViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/12/21.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#define kNotificationGetContacts @"notification_getContacts"

#import "CTInfoViewController.h"
#import "CTInfoView.h"
#import "AddTravelerViewController.h"
//#import "AFApiManage.h"
#import "Login.h"
#import "NSObject+Common.h"
#import "Contacts.h"
#import "NSObject+ObjectMap.h"
#import "InvoiceHeaderViewController.h"
#import "AddressViewController.h"

@interface CTInfoViewController ()<tableViewCellSelect>
//@property (nonatomic, strong) User *user;
@property (nonatomic, strong) CTInfoView *ctInfoView;
@property (nonatomic, strong) NSMutableArray *adultsArray;
@property (nonatomic, strong) NSMutableArray *childArray;
@property (nonatomic, strong) NSDictionary *areaDic;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation CTInfoViewController

#pragma mark -lifeCycle
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"常用信息";
    self.navigationController.navigationBar.hidden = NO;
//    self.user = [Login curLoginUser];
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    
    NSDictionary *areaDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"AREADATA"];
    if (areaDic) {
        self.areaDic = areaDic;
    }else{
        [self updataData];
    }
    
  
    
    [self initWithSubViews];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestData];

}
- (void)updataData
{
    
//    NSDictionary *params = @{@"userId" : self.user.id};
    
    
//    [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/getAreaList" andBlock:^(id data, NSError *error) {
//        if (data) {
//            self.areaDic = [data objectForKey:@"body"];
//            [[NSUserDefaults standardUserDefaults] setObject:self.areaDic forKey:@"AREADATA"];
//        }else{
//            [NSObject showError:error];
//        }
//    }];
}

#pragma mark -UI
- (void)initWithSubViews
{
    [self.view addSubview:self.ctInfoView];
}

- (CTInfoView *)ctInfoView
{
    if (!_ctInfoView) {
        _ctInfoView = [[CTInfoView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
        _ctInfoView.delegate = self;
     
        _ctInfoView.backgroundColor = [UIColor whiteColor];
    }
    return _ctInfoView;
}


#pragma mark -delegate
- (void)didSelectIndexPath:(NSIndexPath *)indexPath andTableView:(UITableView *)tableView andModel:(id)model
{
    AddTravelerViewController *vc = [[AddTravelerViewController alloc] init];
    AddressViewController *vc1 = [[AddressViewController alloc]init];
    InvoiceHeaderViewController *vc2 = [[InvoiceHeaderViewController alloc]init];
    
    
    if (indexPath.section == 0) {
        if (tableView == _ctInfoView.tableView) {
            vc.isChild = NO;
            vc.myContacts = nil;
            [self.navigationController pushViewController:vc animated:YES];
        }else if (tableView == _ctInfoView.tableView1){
            vc1.areaDic = self.areaDic;
            [self.navigationController pushViewController:vc1 animated:YES];
        }else{
            [self.navigationController pushViewController:vc2 animated:YES];
        }
        
    }else{
        if (tableView == _ctInfoView.tableView) {
            vc.isChild = NO;
            vc.myContacts = [NSObject objectOfClass:@"Contacts" fromJSON:model];//dic转换成对象
            [self.navigationController pushViewController:vc animated:YES];
        }else if (tableView == _ctInfoView.tableView1){
            vc1.myAddress = [NSObject objectOfClass:@"Address" fromJSON:model];
            vc1.areaDic = self.areaDic;
            [self.navigationController pushViewController:vc1 animated:YES];
        }else{
            vc2.myInvoice = [NSObject objectOfClass:@"Invoice" fromJSON:model];
            [self.navigationController pushViewController:vc2 animated:YES];
        }

    }
    
}

- (void)DeleteAction:(Contacts *)contact
{
    
//    NSDictionary *params = @{@"id" : [contact valueForKey:@"id"],
//                             @"userId" : self.user.id};
    //删除这个联系人
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
    
//    [[AFApiManage sharedManager] request_DeleteContactsWithParams:params andBlock:^(id data, NSError *error) {
//        [_activityIndicator stopAnimating];
//        if (data) {
//            
//        }else{
//            [NSObject showError:error];
//        }
//    }];
}



#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -requestData
- (void)requestData
{
    
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
   
    __unsafe_unretained typeof(self) weakSelf = self;
    

//    NSDictionary *params = @{
//                             @"userId" : self.user.id};
    
//    [[AFApiManage sharedManager] requestWithParams:params DataWithPath:@"?r=user/getPrivateInfoList" andBlock:^(id data, NSError *error) {
//        [weakSelf.activityIndicator stopAnimating];
//        if (data) {
//            weakSelf.ctInfoView.adultsArray = [NSMutableArray arrayWithArray:[[data objectForKey:@"body"] objectForKey:@"adult"]];
//            [weakSelf.ctInfoView.tableView reloadData];
//            
//            weakSelf.ctInfoView.adressArray = [NSMutableArray arrayWithArray:[[data objectForKey:@"body"] objectForKey:@"address"]];
//            [weakSelf.ctInfoView.tableView1 reloadData];
//            
//            weakSelf.ctInfoView.invoiceArray = [NSMutableArray arrayWithArray:[[data objectForKey:@"body"] objectForKey:@"invoice"]];
//            [weakSelf.ctInfoView.tableView2 reloadData];
//        }else{
//            [NSObject showError:error];
//        }
//    }];
    
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
