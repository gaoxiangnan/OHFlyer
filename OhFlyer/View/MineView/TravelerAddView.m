
//
//  TravelerAddView.m
//  FlyShare
//
//  Created by zzxcc on 15/12/22.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "TravelerAddView.h"
#import "UIView+Helpers.h"
#import "UIView+DrawLine.h"
#import "TravelerAddCell.h"
#import "UIImage+Color.h"

@interface TravelerAddView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr1;
@property (nonatomic, strong) NSArray *dataArr2;
@property (nonatomic, strong) UIView *bottomButton;
@property BOOL isChild;

@end

@implementation TravelerAddView
#pragma mark -init
- (instancetype)initWithFrame:(CGRect)frame withContacts:(Contacts *)contact andIsChild:(BOOL)isChild
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //婴儿进来的
        self.cardType = isChild ? 8 : 1;
        _isChild = isChild;
        
        
        //通过选择不同的cardtype来reload不同的plist文件
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reload:) name:@"changeView" object:nil];
        //这个是添加旅客信息的时候选择男女等触发方法，而触发的通知来更新这个界面信息
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTravelerInfo:) name:@"refreshTravelerInfo" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCountry:) name:@"getCountryName" object:nil];
        if (contact.name) {
            self.myContacts = contact;
            self.cardType = [self.myContacts.card_type intValue];
            
        }
        [self getDataArrFromPlist];
        
        
        [self InitWithSubViews];
        
    }
    return self;
}
#pragma mark -notification method
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)reload:(NSNotification *)object
{
    //当获得证件类型时，判断是否和现在的selecttype一致，因为是textfield，push时其值并未保存到model中，主要解决pop，textfield的值不会改变的问题。
    NSInteger curType = self.cardType;
    
    self.cardType = [object.object integerValue];
    [self getDataArrFromPlist];
    self.myContacts = [[Contacts alloc] init];
    if ([object.object integerValue] != curType) {
        [self.tableView reloadData];
    }
}

- (void)refreshTravelerInfo:(NSNotification *)object
{
    Contacts *contacts = object.object;
    //更新那些有触发方法的值。
    if (contacts.card_period) {
        self.myContacts.card_period = contacts.card_period;
    }
    if (contacts.sex) {
        self.myContacts.sex = contacts.sex;
    }
    if (contacts.birthday) {
        self.myContacts.birthday = contacts.birthday;
    }
    [self.tableView reloadData];
}

- (void)refreshCountry:(NSNotification *)object
{
//    NSIndexPath *path = [NSIndexPath indexPathForRow:6 inSection:0];
//    TravelerAddCell *cell = [_tableView cellForRowAtIndexPath:path];
//    cell.inputField.text = object.object;
    self.myContacts.country = object.object;
    [self.tableView reloadData];
}



#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frameSizeWidth, self.frameSizeHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = self.bottomButton;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [_tableView registerClass:[TravelerAddCell class] forCellReuseIdentifier:[TravelerAddCell reuseIdentifier]];
    }
    return _tableView;
}

- (UIView *)bottomButton
{
    if (!_bottomButton) {
        CGFloat kCheckButtonMarginTop = _isChild ? kScaleFrom_iPhone5s_Desgin(78) : kScaleFrom_iPhone5s_Desgin(38);
        _bottomButton = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kScaleFrom_iPhone5s_Desgin(120))];
         self.checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.checkButton.frame = CGRectMake(kScaleFrom_iPhone5s_Desgin(30), kCheckButtonMarginTop, kDeviceWidth - kScaleFrom_iPhone5s_Desgin(60), kScaleFrom_iPhone5s_Desgin(39));
        [self.checkButton setBackgroundImage:[UIImage createImageWithColor:HEXCOLOR(@"#0a1232", 1)] forState:UIControlStateNormal];
        [self.checkButton setBackgroundImage:[UIImage createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
        self.checkButton.layer.cornerRadius = 3;
        self.checkButton.layer.masksToBounds = YES;
        [self.checkButton setTitle:@"提交" forState:UIControlStateNormal];
        self.checkButton.titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        [self.checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.checkButton addTarget:self action:@selector(sureBt:) forControlEvents:UIControlEventTouchUpInside];

        [_bottomButton addSubview:self.checkButton];
    }
    return _bottomButton;
}

#pragma mark -tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataArr1 objectAtIndex:section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr1.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TravelerAddCell cellHeight:UITableViewCellType50];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(TravelerAddCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell addLineUp:NO andDown:YES andColor:kSeperatorLineColor andLeftSpace:kScaleFrom_iPhone5s_Desgin(97) andRightSpace:kScaleFrom_iPhone5s_Desgin(20)];
    
    cell.typeLabel.text = [[self.dataArr1 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if (self.cardType == 1){
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.rightArrow.hidden = NO;
                cell.inputField.text = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
                cell.inputField.clearButtonMode = UITextFieldViewModeNever;
                cell.inputField.userInteractionEnabled = NO;
            }else{
                cell.rightArrow.hidden = YES;;
                cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            }
        }else{
            cell.rightArrow.hidden = YES;;
            cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        }
        
    }else if (self.cardType == 8){
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0 ) {
                cell.rightArrow.hidden = NO;
                cell.inputField.text = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
                cell.inputField.clearButtonMode = UITextFieldViewModeNever;
                cell.inputField.userInteractionEnabled = NO;
            }else if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 5){
                cell.rightArrow.hidden = NO;
                cell.inputField.clearButtonMode = UITextFieldViewModeNever;
                cell.inputField.userInteractionEnabled = NO;
                cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            }else{
                cell.rightArrow.hidden = YES;;
                cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            }
        }else{
            cell.rightArrow.hidden = YES;;
            cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        }
        
        
    }else  {
        if (indexPath.section == 1) {
            if (indexPath.row == 0 ) {
                cell.rightArrow.hidden = NO;
                cell.inputField.text = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
                cell.inputField.clearButtonMode = UITextFieldViewModeNever;
                cell.inputField.userInteractionEnabled = NO;
            }else if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5){
                cell.rightArrow.hidden = NO;
                cell.inputField.clearButtonMode = UITextFieldViewModeNever;
                cell.inputField.userInteractionEnabled = NO;
                cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            }else{
                cell.rightArrow.hidden = YES;;
                cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            }
        }else{
            cell.rightArrow.hidden = YES;;
            cell.inputField.placeholder = [[self.dataArr2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        }
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TravelerAddCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TravelerAddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    __unsafe_unretained typeof(self) weakSelf = self;
    
    
    if (self.cardType == 1 || self.cardType == 8) {
       
        if (indexPath.section == 1 && indexPath.row == 0) {
            
        }else{
            if (self.cardType == 1) {
                cell.inputField.text = weakSelf.myContacts.mobile;
                cell.textValueChangee = ^(UITextField *text){
                    weakSelf.myContacts.mobile = text.text;
                    weakSelf.cardType == 1 ? (weakSelf.myContacts.mobile = text.text) : (weakSelf.myContacts.mobile = text.text);
                };
            }else if (self.cardType == 8){
                cell.inputField.text = weakSelf.myContacts.birthday;
            }
        }
        
    }else{
        
        if (indexPath.section == 1 && indexPath.row == 0 && indexPath.row == 2 && indexPath.row == 3 && indexPath.row == 4 && indexPath.row == 5 ) {
            
        }
        
        
        if (indexPath.section == 0 && indexPath.row == 0) {
            cell.inputField.text = weakSelf.myContacts.name;
            cell.textValueChangee = ^(UITextField *text){
                weakSelf.myContacts.name = text.text;
            };
        }
        if (indexPath.section == 0 && indexPath.row == 1) {
            cell.inputField.text = weakSelf.myContacts.last_name;
            cell.textValueChangee = ^(UITextField *text){
                weakSelf.myContacts.last_name = text.text;
            };

        }
        if (indexPath.section == 0 && indexPath.row == 2) {
            cell.inputField.text = weakSelf.myContacts.first_name;
            cell.textValueChangee = ^(UITextField *text){
                weakSelf.myContacts.first_name = text.text;
            };

        }
        if (indexPath.section == 0 && indexPath.row == 3) {
            cell.inputField.text = weakSelf.myContacts.first_name;
            cell.textValueChangee = ^(UITextField *text){
                weakSelf.myContacts.first_name = text.text;
            };
            
        }
        if (indexPath.section == 1 && indexPath.row == 0) {
            cell.inputField.text = [Contacts convertToStringWithCardType:weakSelf.myContacts.card_type];
            cell.textValueChangee = ^(UITextField *text){
                weakSelf.myContacts.card_type = [NSNumber numberWithInteger:self.cardType];
            };
        }
        //填写证件号码
        if (indexPath.section == 1 && indexPath.row == 1) {
            cell.inputField.text = weakSelf.myContacts.card_no;
            cell.textValueChangee = ^(UITextField *text){
                weakSelf.myContacts.card_no = text.text;
            };
        }
        //选择证件有效期
        if (indexPath.section == 1 && indexPath.row == 2) {
            cell.inputField.text = weakSelf.myContacts.card_period;
            if (self.myContacts.card_period) {
                cell.inputField.text = self.myContacts.card_period;
            }
        }
        //选择国籍
        if (indexPath.section == 1 && indexPath.row == 3) {
            //cell.inputField.text = @"中国";
            cell.inputField.text = self.myContacts.country;

        }
        //选择性别
        if (indexPath.section == 1 && indexPath.row == 4) {
            if (self.myContacts.sex) {
                cell.inputField.text = [Contacts convertToStringWithSexType:weakSelf.myContacts.sex];
            }else if ([cell.inputField.text isEqualToString:@"男"]) {
                self.myContacts.sex = [NSNumber numberWithInteger:1];
            }else{
                self.myContacts.sex = [NSNumber numberWithInteger:2];

            }
        }
        //选择出生日期
        if (indexPath.section == 1 && indexPath.row == 5) {
            cell.inputField.text = weakSelf.myContacts.birthday;
            if (self.myContacts.birthday) {
                cell.inputField.text = self.myContacts.birthday;
            }
        }
    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectAtIndexPath:andCardType:)]) {
        [_delegate didSelectAtIndexPath:indexPath andCardType:self.cardType];
    }
}

#pragma mark -private
- (void)sureBt:(UIButton *)sender
{
    self.myContacts.card_type = [NSNumber numberWithInteger:self.cardType];
    if ([_delegate respondsToSelector:@selector(sureBt:withParams:)]) {
        [_delegate sureBt:sender withParams:self.myContacts];
    }
}

- (void)getDataArrFromPlist
{
    NSString *valuePath = [[NSBundle mainBundle] pathForResource:@"CardTypeValue" ofType:@"plist"];
    NSString *keyPath = [[NSBundle mainBundle] pathForResource:@"CardTypeKey" ofType:@"plist"];
    
    self.dataArr2 = [[NSArray arrayWithContentsOfFile:valuePath] objectAtIndex:self.cardType];
    self.dataArr1 = [[NSArray arrayWithContentsOfFile:keyPath] objectAtIndex:self.cardType];
}

@end
