//
//  BDSendrequirementViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/9/1.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDSendrequirementViewController.h"
#import "BDMyBudgetViewController.h"

#define kDistance 20

@interface BDSendrequirementViewController ()<UITextViewDelegate, passValueDelagate>

@property(nonatomic, strong) UITextView *textView;
@property(nonatomic, strong) UILabel *placeHolderLabel;
@property(nonatomic, weak) UILabel *strLengthLabel;
@property(nonatomic, strong) UILabel *bugetLabel;

@end

@implementation BDSendrequirementViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = rgb(245, 246, 246);
    self.title = @"发布需求";
    [self setNav];
    [self setUpUI];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(sendButtonClick)];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark -- 设置导航栏
-(void)setNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"leftArrow" title:@"" target:self action:@selector(leftNavClick)];
    
}

-(void) leftNavClick {
    NSLog(@"发需求左边的按钮点击了");
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void) sendButtonClick {
    
    if (_textView.text.length == 0) {
        
        UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:@"请填写需求描述" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //[self.navigationController popToRootViewControllerAnimated:YES];
            
        }];
        [alertCtl addAction:action];
        [self presentViewController:alertCtl animated:YES completion:nil];
        
    } else if(_textView.text!= NULL) {
    
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:@"发布成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }];
    [alertCtl addAction:action];
    [self presentViewController:alertCtl animated:YES completion:nil];
        
    }
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}

//UI界面
-(void) setUpUI {
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:backView];
    backView.frame = CGRectMake(0, 15, KScreen_WIDTH, 200);
    
    UITextView *textV = [[UITextView alloc] init];
    textV.frame = CGRectMake(0, 15, KScreen_WIDTH, 200);
    [self.view addSubview:textV];
    self.textView = textV;
    self.textView.delegate = self;
    
    textV.backgroundColor = [UIColor whiteColor];
    textV.font = [UIFont systemFontOfSize:20];
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    self.placeHolderLabel = placeHolderLabel;
    [self.view addSubview:placeHolderLabel];
    placeHolderLabel.frame = CGRectMake(5, 15, KScreen_WIDTH-10, 40);
    placeHolderLabel.text = @"请输入您的需求详情描述";
    //placeHolderLabel.textAlignment = NSTextAlignmentCenter;
    placeHolderLabel.textColor = rgb(147, 147, 148);
    
    UILabel *strLengthLabel = [[UILabel alloc] init];
    self.strLengthLabel = strLengthLabel;
    [self.view addSubview:strLengthLabel];
    strLengthLabel.text = @"0/100";
    strLengthLabel.textAlignment = NSTextAlignmentRight;
    strLengthLabel.backgroundColor = [UIColor whiteColor];
    [strLengthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backView.mas_bottom).offset(-5);
        make.right.equalTo(self.view).offset(-7);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        
    }];
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, 200 + 25, KScreen_WIDTH, 40);
    [self.view addSubview:btnBack];
    btnBack.backgroundColor = [UIColor whiteColor];
    [btnBack addTarget:self action:@selector(btnBackClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(16, 226, 100, 42);
    [self.view addSubview:label];
    //label.backgroundColor = [UIColor blueColor];
    label.text = @"我的预算";
    label.textColor = rgb(61, 61, 58);
    
    
    UIImageView *rightImg = [[UIImageView alloc] init];
    rightImg.userInteractionEnabled = YES;
    rightImg.image = [UIImage imageNamed:@"backArrow"];
    rightImg.frame = CGRectMake(KScreen_WIDTH - 27, 235, 10, 20);
    [self.view addSubview:rightImg];
    
    UILabel *moneyLabel = [[UILabel alloc] init];
    moneyLabel.text = @"面议";
    self.bugetLabel = moneyLabel;
    moneyLabel.textColor = rgb(147, 147, 148);
    //moneyLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textV.mas_bottom).offset(15);
        make.right.equalTo(rightImg.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(150, 30));
        
    }];
    moneyLabel.textAlignment = NSTextAlignmentRight;
    
    
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
    
    
    
    

}


-(void) btnBackClick {
    NSLog(@"预算按钮点击了");
    BDMyBudgetViewController *budgetVC = [[BDMyBudgetViewController alloc] init];
    //设置代理
    budgetVC.passDelegate = self;
    NSString *text = _bugetLabel.text;
    budgetVC.moneyTextField.text = text;
    
    [self.navigationController pushViewController:budgetVC animated:YES];
    
}

#pragma mark -- 实现传值的dialing方法
-(void)passValue:(NSString *)strValues {
    
    self.bugetLabel.text = [NSString stringWithFormat:@"%@元", strValues];
    //self.bugetLabel.text = strValues;
    
    
}

//监听输入框的改变
- (void)textViewDidChange:(UITextView *)textView{
    
    self.placeHolderLabel.hidden = YES;
    self.strLengthLabel.text = [NSString stringWithFormat:@"%lu/100", (unsigned long)textView.text.length];
    //字数限制
    if (textView.text.length >= 100) {
        textView.text = [textView.text substringToIndex:100];
        self.strLengthLabel.text = @"100/100";
    }
    
    if (textView.text.length == 0) {
        
        self.placeHolderLabel.hidden = NO;
        
    }
    
}


@end

























