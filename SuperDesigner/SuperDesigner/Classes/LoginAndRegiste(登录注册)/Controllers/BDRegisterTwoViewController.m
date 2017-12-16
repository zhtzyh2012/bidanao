//
//  BDRegisterTwoViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/7/31.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDRegisterTwoViewController.h"
#import "BDResetPassViewController.h"
#import "BDProfileViewController.h"
#import "BDRegisterViewController.h"
#import "BDLoginViewController.h"
#import "UIView+Toast.h"

#import "MHRadioButton.h"
#import "UIButton+MHExtra.h"

@interface BDRegisterTwoViewController ()<UITextFieldDelegate, MHRadioButtonDelegate>

//密码输入框
@property(nonatomic, strong) UITextField *passwordTF;

@property(nonatomic,strong)UITextField * passwordTextFiled;
@property(nonatomic,weak)UIImageView * numImageView;
@property(nonatomic,weak)UIImageView * passImageView;
@property(nonatomic,weak)UIView * numLineView;
@property(nonatomic,weak)UIView * passLineView;
@property(nonatomic,strong)UIButton * nextBtn;

//选择角色的背景
@property(nonatomic, strong) UIImageView *backImageView;

//全局的接收变量
@property(nonnull, copy) NSString *ruleId;


@end

@implementation BDRegisterTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.navigationController.navigationBar.tintColor = [UIColor grayColor];

    [self setNav];
    
    [self passwordTF];
    [self passwordTextFiled];
    [self backImageView];
    [self nextBtn];
    
    //self.title = self.titleStr;
    
    
}
#pragma mark -- 设置导航栏
-(void)setNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"leftArrow" title:@"" target:self action:@selector(leftNavClick)];
    
}

-(void) leftNavClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


-(UITextField *)passwordTF {
    
    if (_passwordTF == nil) {
        _passwordTF = [[UITextField alloc]init];
        [self.view addSubview:_passwordTF];
        [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(18);
            make.top.equalTo(self.view).offset(90);
            make.size.mas_equalTo(CGSizeMake(200, 40));
            
        }];
        _passwordTF.borderStyle = UITextBorderStyleNone;
        //_passwordTF.keyboardType = UIKeyboardTypePhonePad;
        _passwordTF.placeholder = @"设置登录密码";
        _passwordTF.font = [UIFont systemFontOfSize:17];
        _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTF.delegate = self;
        
        UIImageView * numImageView = [[UIImageView alloc]init];
        [self.view addSubview:numImageView];
        self.numImageView = numImageView;
        numImageView.image = [UIImage imageNamed:@"密码-默认"];
        [numImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_passwordTF.mas_left).offset(-13);
            make.centerY.equalTo(_passwordTF);
            //make.size.mas_equalTo(CGSizeMake(27, 28));
        }];
        UIView * numLineView = [[UIView alloc]init];
        numLineView.backgroundColor = [UIColor grayColor];
        self.numLineView = numLineView;
        [self.view addSubview:numLineView];
        [numLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passwordTF.mas_bottom).offset(7);
            make.left.equalTo(numImageView).offset(-20);
            make.right.equalTo(_passwordTF.mas_right).offset(20);
            make.height.offset(1);
        }];
    }
    return _passwordTF;



}

-(UITextField *)passwordTextFiled{
    if (_passwordTextFiled == nil) {
        _passwordTextFiled = [[UITextField alloc]init];
        [self.view addSubview:_passwordTextFiled];
        [_passwordTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_passwordTF.mas_left);
            make.top.equalTo(self.numLineView.mas_bottom).offset(25);
            make.size.mas_equalTo(CGSizeMake(200, 40));
            
        }];
        _passwordTextFiled.borderStyle = UITextBorderStyleNone;
        _passwordTextFiled.placeholder = @"昵称";
        _passwordTextFiled.font = [UIFont systemFontOfSize:17];
        _passwordTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextFiled.secureTextEntry = YES;
        _passwordTextFiled.delegate = self;
        UIImageView * passImageView = [[UIImageView alloc]init];
        [self.view addSubview:passImageView];
        self.passImageView = passImageView;
        passImageView.image = [UIImage imageNamed:@"昵称-默认"];
        [passImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_numImageView.mas_left);
            make.centerY.equalTo(_passwordTextFiled);
            //make.size.mas_equalTo(CGSizeMake(29, 29));
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
        
        UILabel *textLabel = [[UILabel alloc] init];
        [self.view addSubview:textLabel];
        textLabel.text = @"请选择您的身份";
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(passLineView.mas_bottom).offset(20);
            make.left.equalTo(self.backImageView.mas_left).offset(10);
        }];
        textLabel.textColor = [UIColor darkGrayColor];
        
        
//        for (int i = 0; i < 6; i++) {
//            MHRadioButton *rb = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:i];
//            rb.frame = CGRectMake(90, 280 + 40 * i, 50, 50);
//            [self.view addSubview:rb];
//
//        }
//        [MHRadioButton addObserver:self forFroupId:@"group"];
        
        
        MHRadioButton *rbOne = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:8 ];
        rbOne.frame = CGRectMake(90, 280 + 40 * 0, 50, 50);
        rbOne.tag = 8;
        [self.view addSubview:rbOne];
        NSLog(@"第一个的tag-->%ld", (long)rbOne.tag);
        
        
        MHRadioButton *rbTwo = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:2 ];
        rbTwo.frame = CGRectMake(90, 280 + 40 * 1, 50, 50);
        rbTwo.tag = 2;
        [self.view addSubview:rbTwo];
        NSLog(@"第一个的tag-->%ld", (long)rbTwo.tag);
        
        
        MHRadioButton *rbThree = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:5 ];
        rbThree.frame = CGRectMake(90, 280 + 40 * 2, 50, 50);
        rbThree.tag = 5;
        [self.view addSubview:rbThree];
        NSLog(@"第一个的tag-->%ld", (long)rbThree.tag);
        
        MHRadioButton *rbFour = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:4 ];
        rbFour.frame = CGRectMake(90, 280 + 40 * 3, 50, 50);
        rbFour.tag = 4;
        [self.view addSubview:rbFour];
        NSLog(@"第一个的tag-->%ld", (long)rbFour.tag);
        
        MHRadioButton *rbFive = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:9 ];
        rbFive.frame = CGRectMake(90, 280 + 40 * 4, 50, 50);
        rbFive.tag = 9;
        [self.view addSubview:rbFive];
        NSLog(@"第一个的tag-->%ld", (long)rbFive.tag);
        
        MHRadioButton *rbSix = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:1 ];
        rbSix.frame = CGRectMake(90, 280 + 40 * 5, 50, 50);
        rbSix.tag = 1;
        [self.view addSubview:rbSix];
        NSLog(@"第一个的tag-->%ld", (long)rbSix.tag);
        
        
        [MHRadioButton addObserver:self forFroupId:@"group"];
        
        
        
//        MHRadioButton *rbTwo = [[MHRadioButton alloc] initWithGroupId:@"group" atIndex:2 ];
//        rbTwo.frame = CGRectMake(90, 280 + 40 * 1, 50, 50);
//        [self.view addSubview:rbTwo];
        
        
        
        UILabel *oneLabel = [[UILabel alloc] init];
        [self.view addSubview:oneLabel];
        oneLabel.frame = CGRectMake(120, 270, 200, 45);
        oneLabel.text = @"房地产开发商";
        oneLabel.textColor = [UIColor grayColor];
        
        UILabel *twoLabel = [[UILabel alloc] init];
        [self.view addSubview:twoLabel];
        twoLabel.frame = CGRectMake(120, 270 + 40, 200, 45);
        twoLabel.text = @"建筑设计师";
        twoLabel.textColor = [UIColor grayColor];
        
        UILabel *threeLabel = [[UILabel alloc] init];
        [self.view addSubview:threeLabel];
        threeLabel.frame = CGRectMake(120, 270 + 40*2, 200, 45);
        threeLabel.text = @"建筑设计院";
        threeLabel.textColor = [UIColor grayColor];
        
        
        UILabel *fourLabel = [[UILabel alloc] init];
        [self.view addSubview:fourLabel];
        fourLabel.frame = CGRectMake(120, 270 + 40*3, 200, 45);
        fourLabel.text = @"工程公司";
        fourLabel.textColor = [UIColor grayColor];
        
        
        UILabel *fiveLabel = [[UILabel alloc] init];
        [self.view addSubview:fiveLabel];
        fiveLabel.frame = CGRectMake(120, 270 + 40*4, 200, 45);
        fiveLabel.text = @"材料供应厂家";
        fiveLabel.textColor = [UIColor grayColor];
        
        
        UILabel *sixLabel = [[UILabel alloc] init];
        [self.view addSubview:sixLabel];
        sixLabel.frame = CGRectMake(120, 270 + 40*5, 200, 45);
        sixLabel.text = @"其他";
        sixLabel.textColor = [UIColor grayColor];
    }

    return _passwordTextFiled;
}


#pragma mark -- 角色选择框框
-(UIImageView *)backImageView {
    
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] init];
        [self.view addSubview:_backImageView];
        _backImageView.image = [UIImage imageNamed:@"xiankuang"];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passLineView).offset(50);
            make.centerX.equalTo(self.view);
        }];
    }
    return _backImageView;
    
}


#pragma mark -- 点击完成的按钮
-(UIButton *)nextBtn{
    if (_nextBtn == nil) {
        _nextBtn = [[UIButton alloc]init];
        [self.view addSubview:_nextBtn];
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-60);
            make.size.mas_equalTo(CGSizeMake(300, 40));
        }];
        _nextBtn.layer.cornerRadius = 5;
        _nextBtn.layer.masksToBounds = YES;
        _nextBtn.backgroundColor = [UIColor grayColor];
        [_nextBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(loginBtnClickV) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}


#pragma mark ---UITextFiled代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == self.passwordTF){
        self.numImageView.image = [UIImage imageNamed:@"密码"];
        self.numLineView.backgroundColor = ThemeColor;
    }else{
        self.passImageView.image = [UIImage imageNamed:@"昵称"];
        self.passLineView.backgroundColor = ThemeColor;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField == self.passwordTF){
        
        BOOL valid = [CheckString checkPassword:self.passwordTF.text];
        if (valid) {
        self.numImageView.image = self.passwordTF.text.length>0 ?[UIImage imageNamed:@"密码"]:[UIImage imageNamed:@"密码-默认"];
        self.numLineView.backgroundColor = self.passwordTF.text.length>0?ThemeColor:[UIColor grayColor];
        } else {
            
            [self.view makeToast:@"请输入6-16位数字和字母组合的密码!"
                        duration:2.0
                        position:CSToastPositionCenter];
        }
        
    }else{
        
        self.passImageView.image = self.passwordTextFiled.text.length>0 ?[UIImage imageNamed:@"昵称"]:[UIImage imageNamed:@"昵称-默认"];
        self.passLineView.backgroundColor = self.passwordTextFiled.text.length>0?ThemeColor:[UIColor grayColor];
    }
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

-(void) loginBtnClickV {
    
    NSLog(@"注册页面二按钮下一步点击了");
    if (self.passwordTF.text.length != 0 && self.passwordTextFiled.text.length != 0) {
        self.nextBtn.enabled = YES;
        
        [self registNetFunc];
        
        
    } else {
        self.nextBtn.enabled = NO;
        [self.view makeToast:@"请输入完整!" duration:2.0 position:CSToastPositionCenter];
    }
}

#pragma mark -- 注册按钮的网络请求接口类
-(void) registNetFunc {
    
    /***
     注册接口：
     http://192.168.1.2:8080/sjs_webserver/regist{登录地址}
     phonenum{请求参数}
     pwd{请求参数}
     username{请求参数}
     */
    
    id userPhonenum = [[NSUserDefaults standardUserDefaults] objectForKey:@"User_Phonenum"];
    
    NSDictionary *dictParams = @{
                                 @"phonenum":userPhonenum,
                                 @"pwd" : self.passwordTF.text,
                                 @"username" : self.passwordTextFiled.text,
                                 @"user_state" : self.ruleId
                                 
                                 };
    NSString *registURL = url_registUrl;
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:registURL parameters:dictParams sucess:^(id json) {
        
        
        if ([json[@"code"] intValue] == 200) {
            
            [self keepUserNameFunc];
            
            [self.view makeToast:@"恭喜注册成功!" duration:2.0 position:CSToastPositionCenter];
            
            BDLoginViewController * passVc = [[BDLoginViewController alloc]init];
            [self.navigationController pushViewController:passVc animated:YES];
        }
        else if ([json[@"code"] intValue] == 202) {
            //[self keepUserNameFunc];
            [self.view makeToast:@"您已经注册!请登录" duration:2.0 position:CSToastPositionCenter];
        }
        
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark -- 注册成功之后将用户名字也保存下来
-(void)keepUserNameFunc {
    
    [[NSUserDefaults standardUserDefaults] setValue:self.passwordTextFiled.text forKey:@"user_Nickname"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.passwordTF.text forKey:@"user_password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

// 代理方法 监控按钮选中状态的改变
- (void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupID {
    NSLog(@"%@ %lu", groupID, (unsigned long)index);
    
    NSLog(@"%lu", (unsigned long)[MHRadioButton getIndexWithGroupId:@"group"]);
    
    NSString *strId = [NSString stringWithFormat:@"%ld", (long)[MHRadioButton getIndexWithGroupId:@"group"]];
    self.ruleId = strId;
    
    NSLog(@"选中了的按钮%@", self.ruleId);
    
}



@end














































































































