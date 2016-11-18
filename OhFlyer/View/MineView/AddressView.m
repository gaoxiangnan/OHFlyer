//
//  AddressView.m
//  FlyShare
//
//  Created by 向楠 on 16/5/31.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "AddressView.h"
#import "UIImage+Color.h"
#import "UIView+RGSize.h"
//#import "AFApiManage.h"
#import "AreaModel.h"
#import "NSObject+ObjectMap.h"


@interface AddressView()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) AreaModel *areaModel;

@property (nonatomic, strong) UILabel *nameShow;
@property (nonatomic, strong) UITextField *nametf;
@property (nonatomic, strong) UIView *line1;

@property (nonatomic, strong) UILabel *phoneShow;
@property (nonatomic, strong) UITextField *phonetf;
@property (nonatomic, strong) UIView *line2;

@property (nonatomic, strong) UILabel *addressShow;
@property (nonatomic, strong) UILabel *addressLb;
@property (nonatomic, strong) UIView *line3;

@property (nonatomic, strong) UILabel *detailAddressShow;
@property (nonatomic, strong) UITextField *detailtf;
@property (nonatomic, strong) UIView *line4;

@property (nonatomic, strong) UIButton *sureBtn;

@property (strong, nonatomic) NSArray *provinceArray;
@property (strong, nonatomic) NSArray *cityArray;
@property (strong, nonatomic) NSArray *townArray;

@property (strong, nonatomic) UIView *maskView;

@property (strong, nonatomic)  UIPickerView *myPicker;
@property (strong, nonatomic) UIView *pickerBgView;

@end

@implementation AddressView
- (instancetype)initWithFrame:(CGRect)frame andDictionary:(NSDictionary *)dic;
{
    self = [super initWithFrame:frame];
    self.address = [[Address alloc]init];
    self.provinceArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.cityArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.townArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    [self getAddressData:dic];
    [self initWithSubViews];
//    [self getCityData];
    [self initView];
    
    return self;
}

- (void)initView {
    
    
    self.maskView = [[UIView alloc] initWithFrame:kScreen_Frame];
    self.maskView.backgroundColor = [UIColor blackColor];
    self.maskView.alpha = 0;
    [self.maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideMyPicker)]];
    
    self.pickerBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kScaleFrom_iPhone5s_Desgin(255))];
    self.pickerBgView.backgroundColor = [UIColor whiteColor];
    
    self.myPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, kScaleFrom_iPhone5s_Desgin(34), kScaleFrom_iPhone5s_Desgin(320), kScaleFrom_iPhone5s_Desgin(216))];
    self.myPicker.delegate = self;
    self.myPicker.dataSource = self;
    self.myPicker.showsSelectionIndicator = YES;
    [self.pickerBgView addSubview:self.myPicker];
    
    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kScaleFrom_iPhone5s_Desgin(39))];
    bgV.backgroundColor = [UIColor blackColor];
    [self.pickerBgView addSubview:bgV];
    
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    [cancleBtn addTarget:self action:@selector(onCancleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:cancleBtn];
    [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgV).offset(20);
        make.centerY.equalTo(bgV);
        make.width.equalTo(@(80));
        make.height.equalTo(@(39));
    }];
    
    UIButton *sureCityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureCityBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureCityBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    sureCityBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    [sureCityBtn addTarget:self action:@selector(onSureCityBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:sureCityBtn];
    [sureCityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgV.mas_right).offset(-20);
        make.centerY.equalTo(bgV);
        make.width.equalTo(@(80));
        make.height.equalTo(@(39));
    }];
    
    UILabel *pickerLb = [[UILabel alloc]initWithFrame:CGRectMake(kScaleFrom_iPhone5s_Desgin(80), 0, 160, 39)];
    pickerLb.text = @"选择所在地区";
    pickerLb.textAlignment = NSTextAlignmentCenter;
    pickerLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    pickerLb.textColor = [UIColor whiteColor];
    [self.pickerBgView addSubview:pickerLb];
    [pickerLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(bgV);
    }];
    
    
}
- (void)hideMyPicker
{
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0;
        self.pickerBgView.tops = self.heights;
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [self.pickerBgView removeFromSuperview];
    }];
}
- (void)getAddressData:(NSDictionary *)dic
{
    [self endEditing:YES];
    
            NSArray *proArr = [dic objectForKey:@"List"];
            NSMutableArray *provinceArray = [[NSMutableArray alloc]initWithCapacity:0];
            NSMutableArray *cityArray = [[NSMutableArray alloc]initWithCapacity:0];
            NSMutableArray *townArray = [[NSMutableArray alloc]initWithCapacity:0];
            
            for (NSDictionary *proDic in proArr) {
                AreaModel *proModel = [[AreaModel alloc]initWithDataDic:proDic];
                proModel.areaArr = proDic[@"list"];
                [provinceArray addObject:proModel];
            }
            self.provinceArray = [NSArray arrayWithArray:provinceArray];
            
            NSArray *cityArr = [[proArr objectAtIndex:0] objectForKey:@"list"];
            for (NSDictionary *cityDic in cityArr) {
                AreaModel *cityModel = [[AreaModel alloc]initWithDataDic:cityDic];
                cityModel.areaArr = cityDic[@"list"];
                [cityArray addObject:cityModel];
            }
            self.cityArray = [NSArray arrayWithArray:cityArray];
            
            NSArray *townArr = [[cityArr objectAtIndex:0] objectForKey:@"list"];
            for (NSDictionary *townDic in townArr) {
                AreaModel *townModel = [[AreaModel alloc]initWithDataDic:townDic];
                townModel.areaArr = townDic[@"list"];
                [townArray addObject:townModel];
            }
            self.townArray = [NSArray arrayWithArray:townArray];
    
    
}
#pragma mark - UIPicker Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        AreaModel * model = [self.provinceArray objectAtIndex:row];
        return model.areaName;
    } else if (component == 1) {
        AreaModel * model = [self.cityArray objectAtIndex:row];
//        self.cityArray = nil;
        return model.areaName;
    } else {
        AreaModel * model = [self.townArray objectAtIndex:row];
        return model.areaName;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 110;
    } else if (component == 1) {
        return 100;
    } else {
        return 110;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0)
    {
        NSMutableArray *city = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *town = [[NSMutableArray alloc]initWithCapacity:0];
        AreaModel *model = [self.provinceArray objectAtIndex:row];
        for (NSDictionary *cityDic in model.areaArr) {
            AreaModel *model = [[AreaModel alloc]initWithDataDic:cityDic];
            model.areaArr = cityDic[@"list"];
            [city addObject:model];
        }
        self.cityArray = [NSArray arrayWithArray:city];
        
        NSArray *townArr = [[model.areaArr objectAtIndex:0] objectForKey:@"list"];
        for (NSDictionary *townDic in townArr) {
            AreaModel *townModel = [[AreaModel alloc]initWithDataDic:townDic];
            townModel.areaArr = townDic[@"list"];
            [town addObject:townModel];
        }
        self.townArray = [NSArray arrayWithArray:town];
    }
    [pickerView selectedRowInComponent:1];
    [pickerView reloadComponent:1];
    [pickerView selectedRowInComponent:2];
    
    if (component == 1) {
        NSMutableArray *town = [[NSMutableArray alloc]initWithCapacity:0];
        AreaModel *model = [self.cityArray objectAtIndex:row];
        for (NSDictionary *townDic in model.areaArr) {
            AreaModel *model = [[AreaModel alloc]initWithDataDic:townDic];
            [town addObject:model];
        }
        self.townArray = [NSArray arrayWithArray:town];
        [pickerView selectRow:1 inComponent:2 animated:YES];
    }
    
    [pickerView reloadComponent:2];
}


#pragma mark -UI
- (void)initWithSubViews
{
    [self addSubview:self.nameShow];
    [_nameShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(20));
        make.width.equalTo(@(kScaleFrom_iPhone5s_Desgin(60)));
    }];
    [self addSubview:self.nametf];
    [_nametf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameShow.mas_right).offset(kScaleFrom_iPhone5s_Desgin(40));
        make.top.equalTo(_nameShow);
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(120)));
    }];
    [self addSubview:self.line1];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kScaleFrom_iPhone5s_Desgin(97));
        make.top.equalTo(_nametf.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(10));
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(117)));
        make.height.equalTo(@(1));
    }];
    
    
    
    [self addSubview:self.phoneShow];
    [_phoneShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_nameShow);
        make.top.equalTo(_line1.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(10));
    }];
    [self addSubview:self.phonetf];
    [_phonetf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_nametf);
        make.top.equalTo(_phoneShow);
    }];
    [self addSubview:self.line2];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.width.equalTo(_line1);
        make.top.equalTo(_phonetf.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(10));;
    }];
    
    
    
    [self addSubview:self.addressShow];
    [_addressShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_phoneShow);
        make.top.equalTo(_line2.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(10));
    }];
    [self addSubview:self.addressLb];
    [_addressLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_phonetf);
        make.top.equalTo(_addressShow);
    }];
    [self addSubview:self.line3];
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.width.equalTo(_line2);
        make.top.equalTo(_addressShow.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(10));;
    }];
    
    
    
    
    [self addSubview:self.detailAddressShow];
    [_detailAddressShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_addressShow);
        make.top.equalTo(_line3.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(10));
    }];
    [self addSubview:self.detailtf];
    [_detailtf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_addressLb);
        make.top.equalTo(_detailAddressShow);
    }];
    [self addSubview:self.line4];
    [_line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(_line3);
        make.top.equalTo(_detailAddressShow.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(10));
    }];
    
    [self addSubview:self.sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kScaleFrom_iPhone5s_Desgin(30)));
        make.top.equalTo(_line4.mas_bottom).offset(kScaleFrom_iPhone5s_Desgin(60));
        make.width.equalTo(@(kDeviceWidth - kScaleFrom_iPhone5s_Desgin(60)));
        make.height.equalTo(@(kScaleFrom_iPhone5s_Desgin(39)));
    }];
}
- (void)setAddress:(Address *)address
{
    _address = address;
    if (![_address valueForKey:@"id"]) {
        return;
    }
    _nametf.text = [_address valueForKey:@"name"];
    _phonetf.text = [_address valueForKey:@"mobile"];
    _addressLb.text = [_address valueForKey:@"area_name"];
    _addressLb.textColor = [UIColor blackColor];
    _detailtf.text = [_address valueForKey:@"address"];
}

- (UILabel *)nameShow{
    if (!_nameShow) {
        _nameShow = [UILabel new];
        _nameShow.text = @"姓      名";
        _nameShow.textAlignment = NSTextAlignmentLeft;
        _nameShow.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _nameShow.textColor = [UIColor blackColor];
    }
    return _nameShow;
}
- (UITextField *)nametf{
    if (!_nametf) {
        _nametf = [UITextField new];
         _nametf.clearButtonMode = UITextFieldViewModeAlways;
        _nametf.placeholder = @"请输入姓名";
        _nametf.textAlignment = NSTextAlignmentLeft;
        _nametf.keyboardType = UIKeyboardTypeDefault;
        _nametf.borderStyle = UITextBorderStyleNone;
        _nametf.delegate = self;
        _nametf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _nametf;
}
- (UIView *)line1{
    if (!_line1) {
        _line1 = [UIView new];
        _line1.backgroundColor = [UIColor lightGrayColor];
    }
    return _line1;
}

- (UILabel *)phoneShow{
    if (!_phoneShow) {
        _phoneShow = [UILabel new];
        _phoneShow.text = @"手机号码";
        _phoneShow.textAlignment = NSTextAlignmentLeft;
        _phoneShow.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _phoneShow.textColor = [UIColor blackColor];
    }
    return _phoneShow;
}
- (UITextField *)phonetf{
    if (!_phonetf) {
        _phonetf = [UITextField new];
        _phonetf.placeholder = @"请输入手机号码";
         _phonetf.clearButtonMode = UITextFieldViewModeAlways;
        _phonetf.textAlignment = NSTextAlignmentLeft;
        _phonetf.keyboardType = UIKeyboardTypeDefault;
        _phonetf.borderStyle = UITextBorderStyleNone;
        _phonetf.delegate = self;
        _phonetf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _phonetf;
}
- (UIView *)line2{
    if (!_line2) {
        _line2 = [UIView new];
        _line2.backgroundColor = [UIColor lightGrayColor];
    }
    return _line2;
}

- (UILabel *)addressShow{
    if (!_addressShow) {
        _addressShow = [UILabel new];
        _addressShow.text = @"所在地区";
        _addressShow.textAlignment = NSTextAlignmentLeft;
        _addressShow.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _addressShow.textColor = [UIColor blackColor];
    }
    return _addressShow;
}
- (UILabel *)addressLb{
    if (!_addressLb) {
        _addressLb = [UILabel new];
        _addressLb.text = @"选择所在地区";
        _addressLb.textColor = [UIColor grayColor];
        _addressLb.textAlignment = NSTextAlignmentLeft;
        _addressLb.userInteractionEnabled = YES;
        _addressLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSelectCity)];
        [_addressLb addGestureRecognizer:tap];
    }
    return _addressLb;
}
- (UIView *)line3{
    if (!_line3) {
        _line3 = [UIView new];
        _line3.backgroundColor = [UIColor lightGrayColor];
    }
    return _line3;
}


- (UILabel *)detailAddressShow{
    if (!_detailAddressShow) {
        _detailAddressShow = [UILabel new];
        _detailAddressShow.text = @"详细地址";
        _detailAddressShow.textAlignment = NSTextAlignmentLeft;
        _detailAddressShow.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _detailAddressShow.textColor = [UIColor blackColor];
    }
    return _detailAddressShow;
}
- (UITextField *)detailtf{
    if (!_detailtf) {
        _detailtf = [UITextField new];
        _detailtf.placeholder = @"不必重复填写省市区信息";
         _detailtf.clearButtonMode = UITextFieldViewModeAlways;
        _detailtf.textAlignment = NSTextAlignmentLeft;
        _detailtf.keyboardType = UIKeyboardTypeDefault;
        _detailtf.borderStyle = UITextBorderStyleNone;
        _detailtf.delegate = self;
        _detailtf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
    }
    return _detailtf;
}
- (UIView *)line4{
    if (!_line4) {
        _line4 = [UIView new];
        _line4.backgroundColor = [UIColor lightGrayColor];
    }
    return _line4;
}
- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setBackgroundImage:[UIImage createImageWithColor:HEXCOLOR(@"#0a1232", 1)] forState:UIControlStateNormal];
        [_sureBtn setBackgroundImage:[UIImage createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
        _sureBtn.layer.cornerRadius = 3;
        _sureBtn.layer.masksToBounds = YES;
        [_sureBtn setTitle:@"提交" forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBt:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField == _nametf) {
        self.address.name = textField.text;
    }else if (textField == _phonetf){
        self.address.mobile = textField.text;
    }else if (textField == _detailtf){
        self.address.address  = textField.text;
    }
    return YES;
}

- (void)onSelectCity
{
    [self addSubview:self.maskView];
    [self addSubview:self.pickerBgView];
    self.maskView.alpha = 0;
    self.pickerBgView.tops = self.heights;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0.3;
        self.pickerBgView.bottoms = self.heights;
    }];
}
- (void)onCancleBtn:(id)sender {
    [self hideMyPicker];
}
- (void)onSureCityBtn:(id)sender {
    AreaModel *pro = [self.provinceArray objectAtIndex:[self.myPicker selectedRowInComponent:0]];
    AreaModel *city = [self.cityArray objectAtIndex:[self.myPicker selectedRowInComponent:1]];
    AreaModel *town = [self.townArray objectAtIndex:[self.myPicker selectedRowInComponent:2]];
    _addressLb.text = [NSString stringWithFormat:@"%@ %@ %@",pro.areaName,city.areaName,town.areaName];
    
    self.address.area_name = [NSString stringWithFormat:@"%@ %@ %@",pro.areaName,city.areaName,town.areaName];
    _addressLb.textColor = [UIColor blackColor];
    self.address.area_id = town.areaId;
    [self hideMyPicker];
}
- (void)sureBt:(id)sender
{
    if ([_delegate respondsToSelector:@selector(sureBt:withParams:)]) {
        [_delegate sureBt:[_address valueForKey:@"id"] withParams:self.address];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
