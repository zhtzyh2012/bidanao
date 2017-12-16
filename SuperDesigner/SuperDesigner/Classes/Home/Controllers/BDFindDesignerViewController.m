//
//  BDFindDesignerViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/9/12.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDFindDesignerViewController.h"

@interface BDFindDesignerViewController ()

//最上面的背景
@property(nonatomic, strong) UIView *backView;


@end

@implementation BDFindDesignerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = rgb(245, 246, 246);
    self.title = @"需求";
    
    [self setNav];
    [self backView];
    
    
}

#pragma mark -- 设置导航栏
-(void)setNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"leftArrow" title:@"" target:self action:@selector(leftNavClick)];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}

-(void) leftNavClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}


-(UIView *)backView {
    if(_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(205);
            
        }];
        
        //找设计师的label
        UILabel *findLabel = [[UILabel alloc] init];
        findLabel.text = @"找设计师";
        findLabel.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:findLabel];
        [findLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(5);
            make.left.equalTo(self.view).offset(15);
            make.size.mas_equalTo(CGSizeMake(120, 30));
            
        }];
        
        //预算的label
        UILabel *bugetLabel = [[UILabel alloc] init];
        bugetLabel.text = @"预算:";
        bugetLabel.font = [UIFont systemFontOfSize:14];
        bugetLabel.textColor = rgb(124, 125, 125);
        bugetLabel.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bugetLabel];
        [bugetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-86);
            make.size.mas_equalTo(CGSizeMake(40, 25));
            
        }];
        
        //预算label的金钱数
        UILabel *moneyLabel = [[UILabel alloc] init];
        moneyLabel.text = @"¥27000元";
        moneyLabel.textAlignment = NSTextAlignmentRight;
        moneyLabel.textColor = ThemeColor;
        [self.view addSubview:moneyLabel];
        moneyLabel.backgroundColor = [UIColor whiteColor];
        [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-15);
            make.size.mas_equalTo(CGSizeMake(80, 25));
            
        }];
        
        //需求编号
        UILabel *demandnumLabel = [[UILabel alloc] init];
        demandnumLabel.text = @"需求编号: 93574";
        demandnumLabel.font = [UIFont systemFontOfSize:14];
        demandnumLabel.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:demandnumLabel];
        [demandnumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(findLabel.mas_bottom).offset(0);
            make.left.equalTo(self.view).offset(15);
            make.size.mas_equalTo(CGSizeMake(130, 30));
            
        }];
        
        //时间日期编号
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.text = @"2017-07-12";
        timeLabel.backgroundColor = [UIColor whiteColor];
        timeLabel.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(moneyLabel.mas_bottom).offset(0);
            make.right.equalTo(self.view).offset(-15);
            make.size.mas_equalTo(CGSizeMake(100, 30));
            
        }];
        timeLabel.textAlignment = NSTextAlignmentRight;
        
        //文本的label
        UILabel *textLabel = [[UILabel alloc] init];
        [self.view addSubview:textLabel];
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(demandnumLabel.mas_bottom).offset(-5);
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.mas_equalTo(100);
            
        }];
        textLabel.text = @"文教类型的建筑,地点在朝阳区,需要根据我的需求先画出草图,效果图,完成建筑地点周边的分析";
        textLabel.numberOfLines = 0;
        textLabel.backgroundColor = [UIColor whiteColor];
        
        //分割线
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = rgb(176, 176, 176);
        [self.view addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(textLabel.mas_bottom).offset(1);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.height.mas_equalTo(1);
        }];
        
        
        UIView *sepLineView = [[UIView alloc] init];
        [self.view addSubview:sepLineView];
        sepLineView.backgroundColor = rgb(190, 189, 189);
        [sepLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).offset(3);
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(1, 30));
        }];
        
        UIButton *leftBtn = [[UIButton alloc] init];
        [self.view addSubview:leftBtn];
        leftBtn.backgroundColor = [UIColor whiteColor];
        [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).offset(5);
            make.right.equalTo(sepLineView.mas_left).offset(-30);
            make.size.mas_equalTo(CGSizeMake(100, 30));
            
        }];
        [leftBtn setTitle:@"需求可申请" forState:UIControlStateNormal];
        [leftBtn setTitleColor:rgb(69, 69, 69) forState:UIControlStateNormal];
        
        UIImageView *leftImg = [[UIImageView alloc] init];
        leftImg.image = [UIImage imageNamed:@"replyClick"];
        [self.view addSubview:leftImg];
        leftImg.backgroundColor = [UIColor whiteColor];
        [leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).offset(5);
            make.right.equalTo(leftBtn.mas_left).offset(-3);
            make.size.mas_equalTo(CGSizeMake(20, 26));
            
        }];
        
       
        
        
        UIImageView *rightImg = [[UIImageView alloc] init];
        rightImg.image = [UIImage imageNamed:@"checkClick"];
        [self.view addSubview:rightImg];
        rightImg.backgroundColor = [UIColor whiteColor];
        [rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).offset(8);
            make.left.equalTo(sepLineView.mas_right).offset(25);
            make.size.mas_equalTo(CGSizeMake(24, 22));
            
        }];
        
        UIButton *rightBtn = [[UIButton alloc] init];
        [self.view addSubview:rightBtn];
        rightBtn.backgroundColor = [UIColor whiteColor];
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).offset(5);
            make.left.equalTo(rightImg.mas_right).offset(5);
            make.size.mas_equalTo(CGSizeMake(120, 30));
            
        }];
        [rightBtn setTitle:@"有1024人看过" forState:UIControlStateNormal];
        [rightBtn setTitleColor:rgb(69, 69, 69) forState:UIControlStateNormal];
        
        UIView *secondView = [[UIView alloc] init];
        secondView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:secondView];
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_backView.mas_bottom).offset(10);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(90);
            
        }];
        
        UIView *centerLineV = [[UIView alloc] init];
        centerLineV.backgroundColor = rgb(222, 221, 221);
        [self.view addSubview:centerLineV];
        [centerLineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(secondView.mas_top).offset(45);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.height.mas_equalTo(1);
        }];
        
        UIImageView *bookImg = [[UIImageView alloc] init];
        [self.view addSubview:bookImg];
        [bookImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(centerLineV.mas_top).offset(-30);
            make.left.equalTo(self.view).offset(15);
            make.size.mas_equalTo(CGSizeMake(20, 25));
            
        }];
        bookImg.image = [UIImage imageNamed:@"bookImg"];
        
        UIImageView *phoneImg = [[UIImageView alloc] init];
        [self.view addSubview:phoneImg];
        [phoneImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(centerLineV.mas_top).offset(10);
            make.left.equalTo(self.view).offset(15);
            make.size.mas_equalTo(CGSizeMake(20, 25));
            
        }];
        phoneImg.image = [UIImage imageNamed:@"phoneImg"];
        
        UIButton *checkProcessBtn = [[UIButton alloc] init];
        [self.view addSubview:checkProcessBtn];
        [checkProcessBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(centerLineV.mas_top).offset(-30);
            make.left.equalTo(bookImg.mas_right).offset(10);
            make.size.mas_equalTo(CGSizeMake(250, 25));
        }];
        [checkProcessBtn setTitle:@"查看设计师APP担保交易流程" forState:UIControlStateNormal];
        [checkProcessBtn setTitleColor:rgb(77, 77, 77) forState:UIControlStateNormal];
        
        
        UIButton *phoneBtn = [[UIButton alloc] init];
        [self.view addSubview:phoneBtn];
        [phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(centerLineV.mas_top).offset(10);
            make.left.equalTo(bookImg.mas_right).offset(5);
            make.size.mas_equalTo(CGSizeMake(100, 25));
        }];
        [phoneBtn setTitle:@"客服电话" forState:UIControlStateNormal];
        [phoneBtn setTitleColor:rgb(77, 77, 77) forState:UIControlStateNormal];
        
        [phoneBtn addTarget:self action:@selector(phoneBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *applyButton = [[UIButton alloc] init];
        applyButton.backgroundColor = ThemeColor;
        [applyButton setTitle:@"我要申请接单" forState:UIControlStateNormal];
        [self.view addSubview:applyButton];
        [applyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).mas_offset(-5);
            make.centerX.equalTo(self.view);
            make.left.equalTo(self.view).offset(50);
            make.right.equalTo(self.view).offset(-50);
            make.height.mas_equalTo(40);
            
            
        }];
        [applyButton setAdjustsImageWhenHighlighted:YES];
        applyButton.layer.cornerRadius = 5;
        applyButton.layer.masksToBounds = YES;
        [applyButton addTarget:self action:@selector(applydBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
        
        
    return _backView;
}

-(void)applydBtnClick {
    
    NSLog(@"申请接单按钮点击了");
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"温馨提示"
                          message:@"您需要先开启认证"
                          delegate:nil
                          cancelButtonTitle:@"好的"
                          otherButtonTitles:nil, nil];
    [alert show];
    
    
}

-(void) phoneBtnClick {
    
    NSString *phone = @"010-82896726";
    
    if (phone != nil) {
        
        NSString *telURL = [NSString stringWithFormat:@"telprompt:%@", phone];
        NSURL *url = [[NSURL alloc] initWithString:telURL];
        
        [[UIApplication sharedApplication] openURL:url];
        
    }
    

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
