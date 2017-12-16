//
//  BDRegisterViewController.m
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/6/26.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDRegisterViewController.h"
#import <UIKit/UIKit.h>
#import "JKCountDownButton.h"
#import "BDResetPassViewController.h"
#import "BDRegisterTwoViewController.h"
#import "UIView+Toast.h"
#import "BDBaseHttpTool.h"

@interface BDRegisterViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField * phoneTextFiled;
@property(nonatomic,strong)UITextField * passwordTextFiled;
@property(nonatomic,weak)UIImageView * numImageView;
@property(nonatomic,weak)UIImageView * passImageView;
@property(nonatomic,weak)UIView * numLineView;
@property(nonatomic,weak)UIView * passLineView;
@property(nonatomic,strong)UIButton * nextBtn;
@property(nonatomic,strong)JKCountDownButton * senderCodeBtn;

//验证码的返回值
@property(nonatomic, strong) NSString *messageStr;

//@property(nonatomic, assign) NSInteger *messageStr;


@end

@implementation BDRegisterViewController

-(UITextField *)phoneTextFiled{
    if (_phoneTextFiled == nil) {
        _phoneTextFiled = [[UITextField alloc]init];
        [self.view addSubview:_phoneTextFiled];
        [_phoneTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(18);
            make.top.equalTo(self.view).offset(150);
            make.size.mas_equalTo(CGSizeMake(200, 40));
            
        }];
        _phoneTextFiled.borderStyle = UITextBorderStyleNone;
        _phoneTextFiled.keyboardType = UIKeyboardTypePhonePad;
        _phoneTextFiled.placeholder = @"手机号";
        _phoneTextFiled.font = [UIFont systemFontOfSize:17];
        _phoneTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextFiled.delegate = self;
        
        UIImageView * numImageView = [[UIImageView alloc]init];
        [self.view addSubview:numImageView];
        self.numImageView = numImageView;
        numImageView.image = [UIImage imageNamed:@"手机-默认"];
        [numImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_phoneTextFiled.mas_left).offset(-16);
            make.centerY.equalTo(_phoneTextFiled);
            //make.size.mas_equalTo(CGSizeMake(24, 29));
        }];
        UIView * numLineView = [[UIView alloc]init];
        numLineView.backgroundColor = [UIColor grayColor];
        self.numLineView = numLineView;
        [self.view addSubview:numLineView];
        [numLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_phoneTextFiled.mas_bottom).offset(7);
            make.left.equalTo(numImageView).offset(-20);
            make.right.equalTo(_phoneTextFiled.mas_right).offset(20);
            
            make.height.offset(1);
            
        }];
    }
    return _phoneTextFiled;
}
-(UITextField *)passwordTextFiled{
    if (_passwordTextFiled == nil) {
        _passwordTextFiled = [[UITextField alloc]init];
        [self.view addSubview:_passwordTextFiled];
        [_passwordTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneTextFiled.mas_left);
            make.top.equalTo(self.numLineView.mas_bottom).offset(25);
            make.size.mas_equalTo(CGSizeMake(120, 40));
            
        }];
        _passwordTextFiled.borderStyle = UITextBorderStyleNone;
        _passwordTextFiled.placeholder = @"验证码";
        _passwordTextFiled.font = [UIFont systemFontOfSize:17];
        _passwordTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextFiled.secureTextEntry = NO;
        _passwordTextFiled.delegate = self;
        UIImageView * passImageView = [[UIImageView alloc]init];
        [self.view addSubview:passImageView];
        self.passImageView = passImageView;
        passImageView.image = [UIImage imageNamed:@"验证码-默认"];
        [passImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_numImageView.mas_left);
            make.centerY.equalTo(_passwordTextFiled);
            //make.size.mas_equalTo(CGSizeMake(29, 29));
        }];
        
        //发送验证码按钮
        _senderCodeBtn = [[JKCountDownButton alloc]init];
        [self.view addSubview:_senderCodeBtn];
        [_senderCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        _senderCodeBtn.layer.borderWidth = 1;
        _senderCodeBtn.layer.cornerRadius = 5;
        _senderCodeBtn.layer.masksToBounds = YES;
        _senderCodeBtn.layer.borderColor = ThemeColor.CGColor;
        _senderCodeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_senderCodeBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        [_senderCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_passwordTextFiled.mas_right).offset(5);
            make.width.offset(95);
            make.top.equalTo(self.numLineView.mas_bottom).offset(25);
            make.height.offset(40);
        }];
        
        
        [_senderCodeBtn countDownButtonHandler:^(JKCountDownButton*sender, NSInteger tag) {
            
            BOOL isValid = [CheckString checkTelephone:self.phoneTextFiled.text];
            
            if (isValid) {
                
            sender.enabled = NO;
            
            [sender startCountDownWithSecond:60];
            
            //短信验证网络请求
            [self verifyCodeNetFunc];
                
              //  [self verifyCodeNetFuncTwo];
                
            [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
                NSString *title = [NSString stringWithFormat:@"%zd秒",second];
                return title;
            }];
                
            [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
                countDownButton.enabled = YES;
                return @"重新获取";
                
            }];}
            
            
            
            else {
                    [self.view makeToast:@"手机号码格式不对!"
                                duration:2.0
                                position:CSToastPositionCenter];
                }
            
        }];
        
        UIView * passLineView = [[UIView alloc]init];
        passLineView.backgroundColor = [UIColor grayColor];
        self.passLineView = passLineView;
        [self.view addSubview:passLineView];
        [passLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passwordTextFiled.mas_bottom).offset(7);
            make.left.equalTo(_numLineView);
            make.right.equalTo(_numLineView.mas_right);
            make.height.offset(1);
        }];
    }
    
         
    return _passwordTextFiled;
}

#pragma mark --短信验证码网络请求接口
-(void) verifyCodeNetFunc {
    
    NSDictionary *dictParams = @{
                                 @"phonenum": self.phoneTextFiled.text
                                 
                                 };
    
    NSString *verifyCodeUrl = url_verifyCodeUrl;
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:verifyCodeUrl parameters:dictParams sucess:^(id json) {
        NSLog(@"短信验证码请求成功了%@", json[@"msg"]);
        
        NSString *msgInt = json[@"msg"];
        int intMsg = [msgInt intValue];
        NSString *msgStr = [NSString stringWithFormat:@"%d", intMsg];
        
        self.messageStr = msgStr;
        
    } failure:^(NSError *error) {
        
        NSLog(@"请求失败");
    }];
    
}



-(UIButton *)nextBtn{
    
    if (_nextBtn == nil) {
        _nextBtn = [[UIButton alloc]init];
        [self.view addSubview:_nextBtn];
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-180);
            make.size.mas_equalTo(CGSizeMake(180, 40));
        }];
        _nextBtn.layer.cornerRadius = 20;
        _nextBtn.layer.masksToBounds = YES;
        _nextBtn.backgroundColor = [UIColor grayColor];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(loginBtnClickJump:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    [self phoneTextFiled];
    [self passwordTextFiled];
    
    self.title = self.titleStr;
    
    [self nextBtn];
}

#pragma mark -- 设置导航栏
-(void)setNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"leftArrow" title:@"" target:self action:@selector(leftNavClick)];
    
}

-(void) leftNavClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark --- 下一步的点击事件
-(void)loginBtnClickJump:(UIButton *)sender{
    
    sender.backgroundColor = ThemeColor;
    
    BDRegisterTwoViewController *registerTwo = [[BDRegisterTwoViewController alloc] init];
    [self.navigationController pushViewController:registerTwo animated:YES];
    
//    if (self.passwordTextFiled.text == 0) {
//        self.nextBtn.enabled = NO;
//        return;
//
//    }
//    if (self.messageStr == nil){
//        self.nextBtn.enabled = NO;
//    }
//
//
////    if (self.passwordTextFiled.text.length == 0 || self.phoneTextFiled.text.length == 0 || self.messageStr == nil ) {
////
////        self.nextBtn.enabled = NO;
////
////    } else if(self.passwordTextFiled.text.length != 0 || self.phoneTextFiled.text.length != 0 || self.messageStr != NULL) {
////
////         self.nextBtn.enabled = YES;
////    }
//
//
//    NSLog(@"输入的是是是%@", self.passwordTextFiled.text);
//    NSLog(@"验证码的字符串%@", self.messageStr);
//
//
//    if ([self.passwordTextFiled.text isEqualToString:self.messageStr]) {
//        [self rememberUserPhoneNum];
//
//        if ([self.title isEqualToString:@"忘记密码"]) {
//            NSLog(@"跳转忘记密码的界面");
//            BDResetPassViewController *resetVC = [[BDResetPassViewController alloc] init];
//            [self.navigationController pushViewController:resetVC animated:YES];
//
//        }else if ([self.title isEqualToString:@"注册"]){
//
//        //注册的时候下一步
//        BDRegisterTwoViewController *registerTwo = [[BDRegisterTwoViewController alloc] init];
//        [self.navigationController pushViewController:registerTwo animated:YES];
//
//        }
//
//    } else {
//
//        [self.view makeToast:@"验证码不对!"
//                    duration:2.0
//                    position:CSToastPositionCenter];
//    }

}

#pragma mark -- 成功点击下一步之后将用户的手机号保存到沙盒方便调用
-(void) rememberUserPhoneNum {
    
    [[NSUserDefaults standardUserDefaults] setValue:self.phoneTextFiled.text forKey:@"User_Phonenum"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark ---UITextFiled代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == self.phoneTextFiled){
        self.numImageView.image = [UIImage imageNamed:@"手机"];
        self.numLineView.backgroundColor = ThemeColor;
    }else{
        self.passImageView.image = [UIImage imageNamed:@"验证码"];
        self.passLineView.backgroundColor = ThemeColor;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField == self.phoneTextFiled){
        self.numImageView.image = self.phoneTextFiled.text.length>0 ?[UIImage imageNamed:@"手机"]:[UIImage imageNamed:@"手机-默认"];
        self.numLineView.backgroundColor = self.phoneTextFiled.text.length>0?ThemeColor:[UIColor grayColor];
    }else{
        self.passImageView.image = self.passwordTextFiled.text.length>0 ?[UIImage imageNamed:@"验证码"]:[UIImage imageNamed:@"验证码-默认"];
        self.passLineView.backgroundColor = self.passwordTextFiled.text.length>0?ThemeColor:[UIColor grayColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end







