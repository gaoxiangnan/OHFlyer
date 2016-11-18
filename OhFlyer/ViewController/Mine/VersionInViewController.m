//
//  VersionInViewController.m
//  FlyShare
//
//  Created by zzxcc on 16/1/29.
//  Copyright © 2016年 Vutumn. All rights reserved.
//

#import "VersionInViewController.h"

@interface VersionInViewController ()

@end

@implementation VersionInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"版本功能介绍";
    [self leftWithButtonImage:[UIImage imageNamed:@"btn_back"] action:@selector(backBtn)];

    
    UITextView *myText = [UITextView new];
    
//    NSString * text =
//    @"\n"
//    @"OhFlyer版本功能介绍\n"
//    @"\n"
//    @"\n"
//    @"首部及导言\n"
//    @"\n"
//    @"本服务条款是您与OhFlyer信息服务平台（OhFlyer手机终端软件）的所有者-----科技有限公司及其关联公司之间就OhFlyer提供的信息服务等相关事宜所订立的合约或合同。  请您仔细阅读本条款，您勾选""我已了解并接受《注册服务条款》""并点击【立即注册】按钮注册成功后成为OhFlyer的正式会员，本服务条款即构成了对双方具有法律约束力的文件。\n"
//    @"\n"
//    @"一、定义\n"
//    @"\n"
//    @"OhFlyer信息服务平台，为提供及维护信息发布的服务平台。其为平台注册用户（信息发布方和接收方）提供飞机服务，为用户发布和飞机信息提供便利与支持。  用户，包含注册用户和非注册用户。注册用户是指通过OhFlyer移动端APP完成全部注册程序后，使用OhFlyer服务的用户。非注册用户是指未进行注册、直接登录OhFlyer移动端APP使用同城OhFlyer服务的用户。信息接受方，是指在OhFlyer服务平台上浏览、搜索已发布的帮助信息寻求服务者。\n"
//    @"\n"
//    @"二、协议的效力\n"
//    @"\n"
//    @"1、在您按照注册页面提示填写信息、阅读并同意本协议并完成全部注册程序后或以其他OhFlyer允许的方式实际使用OhFlyer服务时，您即受本协议的约束。在注册时，您应当按照法律法规要求，或注册页面的提示，准确填写并及时更新您提供的电子邮件地址、联系电话、联系地址、邮政编码等联系方式，以便OhFlyer或其他会员与您进行有效联系。\n\n如您的资料发生变更，您应及时更新您的资料，以使之真实、及时，完整和准确。如有合理理由怀疑您提供的资料错误、不实、过时或不完整的，OhFlyer有权向您发出询问及/或要求改正的通知，并有权直接做出删除相应资料的处理，直至中止、终止对您提供部分或全部服务。由此导致您在使用同城互助平台服务过程中产生任何损失或增加费用的，应由您完全独自承担。\n";
//    NSMutableAttributedString * att =  [[NSMutableAttributedString alloc]initWithString:text];
//    
//    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18.0f weight:UIFontWeightRegular]} range:[text rangeOfString:@"OhFlyer版本功能介绍"]];
//    
//    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin]} range:[text rangeOfString:@"首部及导言"]];
//    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f]} range:[text rangeOfString:@"一、定义"]];
//    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f weight:UIFontWeightThin]} range:[text rangeOfString:@"二、协议的效力"]];
//    
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    
//    paragraphStyle.lineSpacing = 5;// 字体的行间距
//    
//    
//    
//    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor,NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"本服务条款是您与OhFlyer信息服务平台（OhFlyer手机终端软件）的所有者-----科技有限公司及其关联公司之间就OhFlyer提供的信息服务等相关事宜所订立的合约或合同。  请您仔细阅读本条款，您勾选""我已了解并接受《注册服务条款》""并点击【立即注册】按钮注册成功后成为OhFlyer的正式会员，本服务条款即构成了对双方具有法律约束力的文件。"]];
//    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor, NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"OhFlyer信息服务平台，为提供及维护信息发布的服务平台。其为平台注册用户（信息发布方和接收方）提供飞机服务，为用户发布和飞机信息提供便利与支持。  用户，包含注册用户和非注册用户。注册用户是指通过OhFlyer移动端APP完成全部注册程序后，使用OhFlyer服务的用户。非注册用户是指未进行注册、直接登录OhFlyer移动端APP使用同城OhFlyer服务的用户。信息接受方，是指在OhFlyer服务平台上浏览、搜索已发布的帮助信息寻求服务者。"]];
//    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor, NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"1、在您按照注册页面提示填写信息、阅读并同意本协议并完成全部注册程序后或以其他OhFlyer允许的方式实际使用OhFlyer服务时，您即受本协议的约束。在注册时，您应当按照法律法规要求，或注册页面的提示，准确填写并及时更新您提供的电子邮件地址、联系电话、联系地址、邮政编码等联系方式，以便OhFlyer或其他会员与您进行有效联系。\n\n如您的资料发生变更，您应及时更新您的资料，以使之真实、及时，完整和准确。如有合理理由怀疑您提供的资料错误、不实、过时或不完整的，OhFlyer有权向您发出询问及/或要求改正的通知，并有权直接做出删除相应资料的处理，直至中止、终止对您提供部分或全部服务。由此导致您在使用同城互助平台服务过程中产生任何损失或增加费用的，应由您完全独自承担。"]];
//
    
    NSString *text =
    @"\n"
    @"   作为一款优质的公务机出行预定平台，OhFlyer为您提供安全、便捷和享受的一站式公务机出行服务，目前航线已遍布全球各大机场，无论您想去那个国家OhFlyer都能为您满足。\n"
    @"\n"
    @"【拼机】以低廉的价格享受公务机出行的舒适、便捷和安全\n"
    @"\n"
    @"【包机】由国内资深公务机航空团队为您服务，打造一站式极致包机服务体验\n"
    @"\n"
    @"【旅行】全方位满足个性化需求，让您在发现、感悟、寻找中体验旅行的快乐与享受\n"
    @"\n"
    @"【购机】提供一年365天，每天24小时的服务，并由超过20年经验的专家给您服务。";
    
    NSMutableAttributedString * att =  [[NSMutableAttributedString alloc]initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor,NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"  作为一款优质的公务机出行预定平台，OhFlyer为您提供安全、便捷和享受的一站式公务机出行服务，目前航线已遍布全球各大机场，无论您想去那个国家OhFlyer都能为您满足。"]];
    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor,NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"【拼机】以低廉的价格享受公务机出行的舒适、便捷和安全"]];
    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor,NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"【包机】由国内资深公务机航空团队为您服务，打造一站式极致包机服务体验"]];
    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor,NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"【旅行】全方位满足个性化需求，让您在发现、感悟、寻找中体验旅行的快乐与享受"]];
    [att addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f weight:UIFontWeightThin], NSForegroundColorAttributeName : kLightGrayTextColor,NSParagraphStyleAttributeName:paragraphStyle} range:[text rangeOfString:@"【购机】提供一年365天，每天24小时的服务，并由超过20年经验的专家给您服务。"]];



    
    myText.textAlignment = NSTextAlignmentRight;
    myText.attributedText = att;
    myText.editable = NO;
    myText.showsVerticalScrollIndicator = NO;
    [self.view addSubview:myText];
    [myText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];

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
