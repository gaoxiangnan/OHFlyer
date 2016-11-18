//
//  MessageDetailViewController.m
//  FlyShare
//
//  Created by zzxcc on 16/2/3.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "MessageDetailViewController.h"

@interface MessageDetailViewController ()
@property (nonatomic, strong) UITextView *myText;
@property (nonatomic, strong) NSString *str;

@end

@implementation MessageDetailViewController

- (instancetype)initWithString:(NSString *)text
{
    self = [super init];
    if (self) {
        self.str = text;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"消息详情";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];
    [self initWithSubViews];
}

- (void)initWithSubViews
{
    [self.view addSubview:self.myText];
    [_myText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(20);
        make.bottom.right.equalTo(self.view).offset(-20);
    }];
}

- (UITextView *)myText
{
    if (!_myText) {
        _myText = [UITextView new];
        _myText.editable = NO;
        _myText.text = _str;
        _myText.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightThin];
    }
    return _myText;
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
