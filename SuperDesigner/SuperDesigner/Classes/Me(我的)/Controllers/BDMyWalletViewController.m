//
//  BDMyWalletViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/10.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyWalletViewController.h"

@interface BDMyWalletViewController ()

@end

@implementation BDMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self setUpUI];
    
    
}

-(void)setNav {
    
    self.title = @"钱包";
    
    self.navigationController.navigationBar.barTintColor = rgb(56, 177, 177);
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftBackArrow"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"明细" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = rgb(49, 144, 250);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
}


-(void)viewWillDisappear:(BOOL)animated{
    //在页面消失的时候去掉导航栏下面的线条
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];

}


-(void) backClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void) rightItemClick {
    
    NSLog(@"右边的按钮点击了");
    
}

-(void) setUpUI {
    
    UIView *backView = [[UIView alloc] init];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0.001);
        make.right.left.equalTo(self.view).offset(0);
        make.height.mas_equalTo(180);
        
    }];
    backView.backgroundColor = rgb(49, 144, 250);
    
    UILabel *textLabel = [[UILabel alloc] init];
    [self.view addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(150, 25));
        
    }];
    textLabel.text = @"当前余额(元)";
    textLabel.textColor = rgb(189, 220, 250);
    
    //隐藏金额的按钮
    UIButton *hideButton = [[UIButton alloc] init];
    [self.view addSubview:hideButton];
    [hideButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.size.mas_equalTo(CGSizeMake(30, 20));
        
        
    }];
    [hideButton setImage:[UIImage imageNamed:@"hideMoneyNum"] forState:UIControlStateNormal];
    [hideButton setImage:[UIImage imageNamed:@"showMoneyNum"] forState:UIControlStateSelected];
    
    
    
    UILabel *moneyLabel = [[UILabel alloc] init];
    [self.view addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textLabel.mas_bottom).offset(31);
        make.left.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(300, 70));
        
    }];
    moneyLabel.textColor = [UIColor whiteColor];
    moneyLabel.text = @"¥100000";
    moneyLabel.font = [UIFont systemFontOfSize:60];
    
    UIButton *chargeButton = [[UIButton alloc] init];
    [self.view addSubview:chargeButton];
    [chargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(85);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(47);
        
    }];
    chargeButton.backgroundColor = rgb(49, 144, 250);
    [chargeButton setTitle:@"充    值" forState:UIControlStateNormal];
    chargeButton.layer.masksToBounds = YES;
    chargeButton.layer.cornerRadius = 5;
    
    UIButton *withdrawButton = [[UIButton alloc] init];
    [self.view addSubview:withdrawButton];
    [withdrawButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chargeButton.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(47);
        
    }];
    withdrawButton.backgroundColor = rgb(194, 194, 194);
    [withdrawButton setTitle:@"提    现" forState:UIControlStateNormal];
    [withdrawButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    withdrawButton.layer.masksToBounds = YES;
    withdrawButton.layer.cornerRadius = 5;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
