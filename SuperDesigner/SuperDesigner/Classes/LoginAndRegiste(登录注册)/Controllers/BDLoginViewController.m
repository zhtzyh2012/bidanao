//
//  BDLoginViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/6/23.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDLoginViewController.h"
#import "Masonry.h"
#import <UIKit/UIKit.h>
#import "BDRegisterViewController.h"
#import "BDProfileViewController.h"
#import "BDResetPassViewController.h"

@interface BDLoginViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField * phoneTextFiled;
@property(nonatomic,strong)UITextField * passwordTextFiled;
@property(nonatomic,weak)UIImageView * numImageView;
@property(nonatomic,weak)UIImageView * passImageView;
@property(nonatomic,weak)UIView * numLineView;
@property(nonatomic,weak)UIView * passLineView;
@property(nonatomic,strong)UIButton * loginBtn;
@property(nonatomic,strong)UIButton * forgetBtn;
@property(nonatomic,strong)UIButton * registerBtn;
@property(nonatomic,strong)UIButton * closeBtn;

@property (nonatomic, copy) NSString *user_Id;
@property (nonatomic, copy) NSString *user_name;
/**
 *用户手机号
 */
@property(nonatomic, copy) NSString *user_phoneNum;
/**
 *用户的密码
 */
@property(nonatomic, copy) NSString *user_password;



@end

@implementation BDLoginViewController

//#define ThemeColor [UIColor colorWithRed:114/255.0 green:215/255.0 blue:209/255.0  alpha:1.000]
-(UITextField *)phoneTextFiled{
    if (_phoneTextFiled == nil) {
        _phoneTextFiled = [[UITextField alloc]init];
        [self.view addSubview:_phoneTextFiled];
        [_phoneTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(18);
            make.centerY.equalTo(self.view).offset(-50);
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
        numImageView.image = [UIImage imageNamed:@"账号-默认"];
        [numImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_phoneTextFiled.mas_left).offset(-16);
            make.centerY.equalTo(_phoneTextFiled);
           // make.size.mas_equalTo(CGSizeMake(20, 25));
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
            make.centerX.equalTo(self.view).offset(18);
            make.top.equalTo(self.numLineView.mas_bottom).offset(25);
            make.size.mas_equalTo(CGSizeMake(200, 40));
            
        }];
        _passwordTextFiled.borderStyle = UITextBorderStyleNone;
        _passwordTextFiled.placeholder = @"密码";
        _passwordTextFiled.font = [UIFont systemFontOfSize:17];
        _passwordTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextFiled.secureTextEntry = YES;
        _passwordTextFiled.delegate = self;
        UIImageView * passImageView = [[UIImageView alloc]init];
        [self.view addSubview:passImageView];
        self.passImageView = passImageView;
        passImageView.image = [UIImage imageNamed:@"密码-默认"];
        [passImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_passwordTextFiled.mas_left).offset(-16);
            make.centerY.equalTo(_passwordTextFiled);
            //make.size.mas_equalTo(CGSizeMake(20, 25));
        }];
        UIView * passLineView = [[UIView alloc]init];
        passLineView.backgroundColor = [UIColor grayColor];
        self.passLineView = passLineView;
        [self.view addSubview:passLineView];
        [passLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passwordTextFiled.mas_bottom).offset(7);
            make.left.equalTo(passImageView).offset(-20);
            make.right.equalTo(_passwordTextFiled.mas_right).offset(20);
            make.height.offset(1);
        }];
    }
    return _passwordTextFiled;
}
-(UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc]init];
        [self.view addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-100);
            make.size.mas_equalTo(CGSizeMake(180, 40));
        }];
        _loginBtn.layer.cornerRadius = 20;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.backgroundColor = [UIColor grayColor];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
-(UIButton *)forgetBtn{
    if (_forgetBtn == nil) {
        _forgetBtn = [[UIButton alloc]init];
        [self.view addSubview:_forgetBtn];
        [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.passLineView);
            make.top.equalTo(self.passLineView).offset(20);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        [_forgetBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:ThemeColor forState:UIControlStateHighlighted];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}
-(UIButton *)registerBtn{
    if (_registerBtn == nil) {
        _registerBtn = [[UIButton alloc]init];
        [self.view addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.passLineView);
            make.top.equalTo(self.passLineView).offset(20);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        [_registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_registerBtn setTitleColor:ThemeColor forState:UIControlStateHighlighted];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}
-(UIButton *)closeBtn{
    if (_closeBtn == nil) {
        _closeBtn = [[UIButton alloc]init];
        [self.view addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.view).offset(20);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        //[_closeBtn setBackgroundColor:[UIColor redColor]];
        [_closeBtn setImage:[UIImage imageNamed:@"closeArrow"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    self.view.layer.contents = (id)[UIImage imageNamed:@"背景"].CGImage;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(change)];
    
    [self phoneTextFiled];
    [self passwordTextFiled];
    [self loginBtn];
    [self forgetBtn];
    [self registerBtn];
    [self closeBtn];

}


-(void)change
 {

     [self.navigationController dismissViewControllerAnimated:YES completion:^{
                NSLog(@"移除模态窗口");
    }];
     
 }

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden = NO;
}
#pragma mark --- 登录的点击事件
-(void)loginBtnClick:(UIButton *)sender{
    
    sender.backgroundColor = ThemeColor;

    [self loginNetFunc];
    
    NSLog(@"登录按钮点击了");
    
//    
//    [self.navigationController dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"移除模态窗口");
//       
//    }];
    

}

#pragma mark -- 登录状态的标识
-(void)isLoginFunc {
    BOOL isLogin = YES;
    //首次登录的时候赋值非YES
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:@"isLogin"];
    //存入
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

#pragma mark -- 登录成功之后将用户的id号码也保存下来
-(void)keepUserIdFunc {

    [[NSUserDefaults standardUserDefaults] setValue:self.user_Id forKey:@"user_Id"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.user_name forKey:@"user_Name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //缓存用户的手机号和密码
    [[NSUserDefaults standardUserDefaults] setValue:self.user_phoneNum forKey:@"user_phoneNum"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.user_password forKey:@"user_password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


#pragma mark -- 登录按钮的接口请求
-(void)loginNetFunc {
    
    NSDictionary *dictParams = @{
                                 @"phonenum" : self.phoneTextFiled.text,
                                 @"pwd" : self.passwordTextFiled.text,
                                
                                 };
    
    
    NSString *loginUrl = url_loginUrl;
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:loginUrl parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"登录成功200");
            self.user_Id = json[@"user"][@"id"];
            self.user_name = json[@"user"][@"username"];
            self.user_phoneNum = json[@"user"][@"phonenum"];
            self.user_password = json[@"user"][@"password"];
            
            NSLog(@"用户的ID----%@",self.user_Id );
            NSLog(@"用户的昵称---%@", self.user_name);
            
            [self isLoginFunc];  /**存入登录的标识*/
            [self keepUserIdFunc]; /**存入用户的id名*/
            
            NSLog(@"登录成功了啊");
            
            
            [self.navigationController dismissViewControllerAnimated:YES completion:^{
                NSLog(@"移除模态窗口");
                //返回到根控制器
                BDProfileViewController *proVC = [[BDProfileViewController alloc] init];
                [self.navigationController pushViewController:proVC animated:YES];
            }];

        
        } else if ([json[@"code"] intValue] == 202) {
            
            [self.view makeToast:@"您输入的密码有误!" duration:2.0f position:CSToastPositionCenter];
            
        } else if ([json[@"code"] intValue] == 201) {
            [self.view makeToast:@"您输入的内容有误!" duration:2.0f position:CSToastPositionCenter];
            return;
        }
    } failure:^(NSError *error) {
        
        NSLog(@"登录失败%@", error);
        [self.view makeToast:@"服务器错误!"
                    duration:2.0
                    position:CSToastPositionCenter];
    }];
    
}

#pragma mark ---忘记密码点击事件
-(void)forgetBtnClick:(UIButton *)sender{
    
    BDRegisterViewController *registerVC = [[BDRegisterViewController alloc] init];
    registerVC.titleStr = @"忘记密码";
    [self.navigationController pushViewController:registerVC animated:YES];
    
}
#pragma mark ---注册按钮的点击事件
-(void)registerBtnClick:(UIButton *)sender{
    BDRegisterViewController *reVC = [[BDRegisterViewController alloc] init];
    reVC.titleStr = @"注册";
    [self.navigationController pushViewController:reVC animated:YES];
    
}
#pragma mark ---关闭按钮
-(void)closeBtnClick:(UIButton *)sender{
    
       [self.navigationController dismissViewControllerAnimated:YES completion:^{
          NSLog(@"移除模态窗口");
            [self.navigationController popViewControllerAnimated:YES];
        }];
    
   
}


#pragma mark ---UITextFiled代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == self.phoneTextFiled){
        self.numImageView.image = [UIImage imageNamed:@"账号"];
        self.numLineView.backgroundColor = ThemeColor;
    }else{
        self.passImageView.image = [UIImage imageNamed:@"密码"];
        self.passLineView.backgroundColor = ThemeColor;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    BOOL valid = [CheckString checkTelephone:self.phoneTextFiled.text];
    if (valid) {
        
    if(textField == self.phoneTextFiled){
        
        self.numImageView.image = self.phoneTextFiled.text.length>0 ?[UIImage imageNamed:@"账号"]:[UIImage imageNamed:@"账号-默认"];
        self.numLineView.backgroundColor = self.phoneTextFiled.text.length>0?ThemeColor:[UIColor grayColor];
    }else{
        self.passImageView.image = self.passwordTextFiled.text.length>0 ?[UIImage imageNamed:@"密码"]:[UIImage imageNamed:@"密码-默认"];
        self.passLineView.backgroundColor = self.passwordTextFiled.text.length>0?ThemeColor:[UIColor grayColor];
    }
    } else {
        [self.view makeToast:@"请输入有效的手机号!" duration:2.0 position:CSToastPositionCenter];
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end





























