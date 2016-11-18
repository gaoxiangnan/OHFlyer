//
//  AddTInfoViewController.m
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "AddTravelerViewController.h"
#import "CardTypeViewController.h"
//#import "AFApiManage.h"
#import "Contacts.h"
#import "NSObject+Common.h"
#import "ActionSheetDatePicker.h"
#import "NSDate+Helper.h"
#import "NSDate+Common.h"
//#import "User.h"
//#import "Login.h"
#import "CountrtyChooseViewController.h"

@interface AddTravelerViewController ()<pushDelegate>
//@property (nonatomic, strong) User *user;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) TravelerAddView *addView;

@end

@implementation AddTravelerViewController

#pragma mark -lifeCycle
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    if (!self.myContacts) {
        self.myContacts = [[Contacts alloc] init];
        self.title = @"添加常用旅客";
    }else{
        self.title = @"编辑常用旅客";
        [self rightWithText:@"删除" textColor:nil action:@selector(DeleteAction)];
    }
//    self.user = [Login curLoginUser];
    [self InitWithSubViews];
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.addView];
}

- (TravelerAddView *)addView
{
    if (!_addView) {
        _addView = [[TravelerAddView alloc] initWithFrame:self.view.frame withContacts:self.myContacts andIsChild:_isChild];
        _addView.delegate = self;
        _addView.myContacts = self.myContacts;
        _addView.backgroundColor = [UIColor whiteColor];
    }
    return _addView;
}

#pragma mark -private
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -delegate
- (void)didSelectAtIndexPath:(NSIndexPath *)indexPath andCardType:(NSInteger)cardType
{
    CardTypeViewController *vc = [CardTypeViewController new];
    if (cardType == 1 || cardType == 8) {
        
        if (indexPath.section == 1 && indexPath.row == 0) {
            vc.selectType = cardType;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }else{
        
        if (indexPath.section == 1 && indexPath.row == 0) {
            vc.selectType = cardType;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if (indexPath.row == 3) {
            vc.selectType = cardType;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 1 && indexPath.row == 2) {
            [self chooseDateSection:indexPath.section row:indexPath.row];
        }
        if (indexPath.section == 1 && indexPath.row == 3) {
            //选择国籍
            CountrtyChooseViewController *vc = [[CountrtyChooseViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 1 && indexPath.row == 4) {
            [self presentActionSheet];
        }
        if (indexPath.section == 1 && indexPath.row == 5) {
            [self chooseDateSection:indexPath.section row:indexPath.row];
        }
    }
   
}

#pragma mark -private
- (void)DeleteAction
{
//    NSDictionary *params = @{@"id" : [self.myContacts valueForKey:@"id"],
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
//            [self.navigationController popViewControllerAnimated:YES];
//            kTipAlert(@"删除成功");
//        }else{
//            [NSObject showError:error];
//        }
//    }];
}

//选择截止日期或者出生日
- (void)chooseDateSection:(NSInteger)section row:(NSInteger)row
{
    __unsafe_unretained typeof(self) weakSelf = self;
    NSDate *curDate;
    NSDate *birthDate = [NSDate dateFromString:self.myContacts.birthday withFormat:@"yyyy-MM-dd"];
    NSDate *endData = [NSDate dateFromString:self.myContacts.card_period withFormat:@"yyyy-MM-dd"];
    if (!birthDate) {
        birthDate = [NSDate dateFromString:@"1990-01-01" withFormat:@"yyyy-MM-dd"];
    }
    if (!endData) {
        endData = [NSDate date];
    }
    if (section == 1 && row == 2) {
        curDate = endData;
    }else if (section == 1 && row == 5){
        curDate = birthDate;
    }
    
    ActionSheetDatePicker *picker = [[ActionSheetDatePicker alloc] initWithTitle:nil datePickerMode:UIDatePickerModeDate selectedDate:curDate doneBlock:^(ActionSheetDatePicker *picker, NSDate *selectedDate, id origin) {
        // NSString *preValue = weakSelf.loginUser.birthday;
        if (section == 1 && row == 2) {
            weakSelf.myContacts.card_period = [selectedDate string_yyyy_MM_dd];
        }else if (section == 1 && row == 5){
            weakSelf.myContacts.birthday = [selectedDate string_yyyy_MM_dd];
        }

        [weakSelf postNotification];

    } cancelBlock:^(ActionSheetDatePicker *picker) {
        DebugLog(@"%@", picker.description);
    } origin:self.view];
    if (section == 1 && row == 2) {
        picker.minimumDate = [[NSDate date] offsetYear:0];
    }else if (section == 1 && row == 5){
        picker.minimumDate = [[NSDate date] offsetYear:-120];
    }
    
    picker.maximumDate = [[NSDate date] offsetYear:120];
    [picker showActionSheetPicker];
}

//选择男女
- (void)presentActionSheet
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: nil                                                                       message: nil                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    //添加Button
    __unsafe_unretained typeof(self) weakSelf = self;

    [alertController addAction: [UIAlertAction actionWithTitle: @"男" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        weakSelf.myContacts.sex = [NSNumber numberWithInt:1];
        [weakSelf postNotification];
    }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"女" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        weakSelf.myContacts.sex = [NSNumber numberWithInt:2];
        [weakSelf postNotification];

    }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController: alertController animated:YES completion: nil];
}

//发出通知更新界面
- (void)postNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTravelerInfo" object:self.myContacts];
}

#pragma mark -delegate
- (void)sureBt:(UIButton *)btn withParams:(Contacts *)contacts
{
    [self.view endEditing:YES];
    
   NSString *tipStr = [contacts validateInfo];
    if (tipStr) {
        kTipAlert(@"%@", tipStr);
        return;
    }
    
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
    
    //__unsafe_unretained typeof(self) weakSelf = self;
    btn.enabled = NO;
    
    //
    
//    if (!contacts.id) {
//        contacts.id = self.user.id;
//        [[AFApiManage sharedManager] request_AddContactsWithParams:[contacts toAddContactsParams] andBlock:^(id data, NSError *error) {
//            btn.enabled = YES;
//            [_activityIndicator stopAnimating];
//            if (data) {
//                [self.navigationController popViewControllerAnimated:YES];
//                kTipAlert(@"添加成功");
//            }else{
//                [NSObject showError:error];
//            }
//        }];
//    }else{
//        contacts.userId = self.user.id;
//        [[AFApiManage sharedManager] request_UpdateContactsWithParams:[contacts toUpdateContactParams] andBlock:^(id data, NSError *error) {
//            btn.enabled = YES;
//            [_activityIndicator stopAnimating];
//            if (data) {
//                kTipAlert(@"编辑成功");
//            }else{
//                [NSObject showError:error];
//            }
//        }];
//    }
    
   
    
   
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
