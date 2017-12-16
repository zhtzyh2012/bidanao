//
//  BDMyBudgetViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/9/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyBudgetViewController.h"
#import "BDSendrequirementViewController.h"
//#import "QuartCore/QuartzCore.h"
#include <QuartzCore/QuartzCore.h>

@interface BDMyBudgetViewController ()


@end

@implementation BDMyBudgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = rgb(245, 246, 246);
    [self setNav];
    self.title = @"我的预算";
    [self setUpUI];
    
}

#pragma mark -- 设置导航栏
-(void)setNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"leftArrow" title:@"" target:self action:@selector(leftNavClick)];
    
}

-(void) leftNavClick {
    NSLog(@"发需求左边的按钮点击了");
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) setUpUI {
 
    UIView *backView = [[UIView alloc] init];
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor whiteColor];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(130);
        
    }];
    
    UITextField *textF = [[UITextField alloc] init];
    [self.view addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(44);
        
    }];
    textF.textColor = [UIColor redColor];
    textF.clearButtonMode = UITextFieldViewModeWhileEditing;
    textF.borderStyle = UITextBorderStyleLine;
    textF.placeholder = @"请输入您的预算金额(元)";
    textF.layer.borderColor = rgb(155, 154, 154).CGColor;
    textF.layer.borderWidth = 1.0;
    textF.keyboardType = UIKeyboardTypeNumberPad;
    self.moneyTextField = textF;
    
    UIButton *veriftBtn = [[UIButton alloc] init];
    [self.view addSubview:veriftBtn];
    [veriftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(60);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(45);
        
    }];
    veriftBtn.layer.cornerRadius = 5;
    veriftBtn.layer.masksToBounds = YES;
    [veriftBtn setBackgroundColor:ThemeColor];
    [veriftBtn setTitle:@"确认" forState:UIControlStateNormal];
    [veriftBtn addTarget:self action:@selector(verifyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imge = [[UIImageView alloc] init];
    [self.view addSubview:imge];
    [imge setImage:[UIImage imageNamed:@"qulityIcon"]];
    [imge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-138);
        make.left.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(18, 18));
        
    }];

    
    UILabel *textLabel = [[UILabel alloc] init];
    [self.view addSubview:textLabel];
    textLabel.textColor = rgb(137, 137, 136);
    textLabel.text = @"注: 设计师APP全程会对款项进行担保, 为确保需求方和设计方双方利益.在双方未确认完成要求前款项处于冻结状态并由设计师APP进行保管";
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.textAlignment = NSTextAlignmentLeft;
    //textLabel.backgroundColor = [UIColor whiteColor];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-80);
        make.right.equalTo(self.view).offset(-30);
        make.left.equalTo(self.view).offset(30);
        make.height.mas_equalTo(100);
        
    }];
    
    UIButton *checkBtn = [[UIButton alloc] init];
    [self.view addSubview:checkBtn];
    [checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-55);
        make.right.equalTo(self.view).offset(-30);
        make.left.equalTo(self.view).offset(30);
        make.height.mas_equalTo(30);
        
    }];
    [checkBtn setTitle:@"查看设计师APP担保交易流程" forState:UIControlStateNormal];
    [checkBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[checkBtn.titleLabel setTextColor:[UIColor blueColor]];
    checkBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [checkBtn addTarget:self action:@selector(checkBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void) checkBtnClick {
    NSLog(@"查看按钮点击了");
}

-(void) verifyBtnClick {

    NSLog(@"确认按钮点击了");
    [self.passDelegate passValue:self.moneyTextField.text];
    //界面跳转
    [self.navigationController popViewControllerAnimated:YES];
    
}




@end
