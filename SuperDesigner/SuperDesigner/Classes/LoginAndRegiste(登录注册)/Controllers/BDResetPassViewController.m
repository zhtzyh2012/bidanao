

#import "BDResetPassViewController.h"
#import "BDLoginViewController.h"
@interface BDResetPassViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * passwordTextFiled;
@property(nonatomic,weak)UIImageView * passImageView;
@property(nonatomic,weak)UIView * passLineView;
@property(nonatomic,strong)UIButton * nextBtn;
@end

@implementation BDResetPassViewController
-(UITextField *)passwordTextFiled{
    if (_passwordTextFiled == nil) {
        _passwordTextFiled = [[UITextField alloc]init];
        [self.view addSubview:_passwordTextFiled];
        [_passwordTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(18);
            make.top.equalTo(self.view).offset(120);
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
            //make.size.mas_equalTo(CGSizeMake(23, 28));
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
        UILabel * label = [[UILabel alloc]init];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(passLineView.mas_bottom).offset(10);
        }];
        label.textColor = [UIColor grayColor];
        label.text = @"密码由6-16数字和字母组成";
        label.textAlignment = NSTextAlignmentCenter;
    }
    return _passwordTextFiled;
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
        [_nextBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(doneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

#pragma mark ---UITextFiled代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.passImageView.image = [UIImage imageNamed:@"密码"];
    self.passLineView.backgroundColor = ThemeColor;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
  
    self.passImageView.image = self.passwordTextFiled.text.length>5 ?[UIImage imageNamed:@"密码"]:[UIImage imageNamed:@"密码-默认"];
    self.passLineView.backgroundColor = self.passwordTextFiled.text.length>5?ThemeColor:[UIColor grayColor];

}
#pragma mark --- 完成按钮的点击事件
-(void)doneBtnClick:(UIButton *)sender{
    sender.backgroundColor = ThemeColor;
    
    [self resetCodeNetFunc];
    
    for (UIViewController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[BDResetPassViewController class]]) {
            [self.navigationController popToViewController:temp animated:YES];
        }
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    [self setNav];
    //self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    //self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    [self passwordTextFiled];
    
    [self nextBtn];
}

#pragma mark -- 设置导航栏
-(void)setNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"leftArrow" title:@"" target:self action:@selector(leftNavClick)];
    
}

-(void) leftNavClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

//-(void) rememberUserPhoneNum {
//    
//    [[NSUserDefaults standardUserDefaults] setValue:self.phoneTextFiled.text forKey:@"User_Phonenum"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}


//找回密码
//http://192.168.1.3:8080/sjs_webserver/getpwd
//phonenum
//code  200  成功
//code  201  空参
//code  202  手机格式不正确

-(void)resetCodeNetFunc {
    

    id userPhonenum = [[NSUserDefaults standardUserDefaults] objectForKey:@"User_Phonenum"];
    
    NSLog(@"电话%@", userPhonenum);
    
    NSDictionary *dictParams = @{
                                 @"phonenum" : userPhonenum,
                                 };
    
    NSString *url_resetPwd = url_resetPwdUrl;
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_resetPwd parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"返回到登录成功200");
            //返回到登录界面
            BDLoginViewController *loginVC = [[BDLoginViewController alloc] init];
            [self.navigationController pushViewController:loginVC animated:YES];
            
            //返回到根控制器
            //[self.navigationController popToRootViewControllerAnimated:YES];
            
        } else if ([json[@"code"] intValue] == 202) {
            [self.view makeToast:@"手机格式不正确!" duration:2.0f position:CSToastPositionCenter];
            
        } else if ([json[@"code"] intValue] == 201) {
            [self.view makeToast:@"您输入的内容有误!" duration:2.0f position:CSToastPositionCenter];
            return;
        }
    } failure:^(NSError *error) {
        
    }];
    
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
