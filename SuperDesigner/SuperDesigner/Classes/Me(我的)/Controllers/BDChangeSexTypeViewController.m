//
//  BDChangeSexTypeViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/29.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDChangeSexTypeViewController.h"

@interface BDChangeSexTypeViewController ()
@property (nonatomic, weak) UIView *backView;
@property (nonatomic, weak) UILabel *manLabel;
@property (nonatomic, weak) UILabel *womanLabel;
@property (nonatomic, weak) UIView *lineView;

/**
 *manButton
 */
@property(nonatomic, strong) UIButton *manButton;
/**
 *womanButton
 */
@property(nonatomic, strong) UIButton *womanButton;



@end

@implementation BDChangeSexTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = rgb(245, 246, 246);
    self.title = @"性别";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(SaveSexBtn)];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    [self setUpUI];
    
}

-(void) SaveSexBtn {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void) setUpUI {
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.frame = CGRectMake(0, 80, KScreen_WIDTH, 105);
    [self.view addSubview:backView];
    self.backView = backView;
    
    UILabel *manLabel = [[UILabel alloc] init];
    [self.view addSubview:manLabel];
    [manLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).offset(10);
        make.left.equalTo(self.view).offset(20);
        make.size.mas_equalTo(CGSizeMake(43, 43));
        
    }];
    manLabel.text = @"男";
    manLabel.font = [UIFont systemFontOfSize:19];
    
    UIView *lineView = [[UIView alloc] init];
    [self.backView addSubview:lineView];
    lineView.frame = CGRectMake(0, 55, KScreen_WIDTH, 1);
    lineView.backgroundColor = [UIColor lightGrayColor];
    self.lineView = lineView;
    
    UILabel *womanLabel = [[UILabel alloc] init];
    [self.view addSubview:womanLabel];
    [womanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_top).offset(8);
        make.left.equalTo(self.view).offset(20);
        make.size.mas_equalTo(CGSizeMake(43, 43));
        
    }];
    womanLabel.text = @"女";
    womanLabel.font = [UIFont systemFontOfSize:19];
    
    UIButton *manButton = [[UIButton alloc] init];
    [self.backView addSubview:manButton];
    self.manButton = manButton;
    [manButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(10);
        make.right.equalTo(self.backView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    [manButton setBackgroundImage:[UIImage imageNamed:@"changSex"] forState:UIControlStateNormal];
    [manButton setBackgroundImage:[UIImage imageNamed:@"changeSex_sel"] forState:UIControlStateSelected];
    
    [manButton addTarget:self action:@selector(manButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *womanButton = [[UIButton alloc] init];
    [self.backView addSubview:womanButton];
    self.womanButton = womanButton;
    [womanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(10);
        make.right.equalTo(self.backView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    [womanButton setBackgroundImage:[UIImage imageNamed:@"changSex"] forState:UIControlStateNormal];
    [womanButton setBackgroundImage:[UIImage imageNamed:@"changeSex_sel"] forState:UIControlStateSelected];
    
    [womanButton addTarget:self action:@selector(womanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

-(void) manButtonClick : (UIButton *)sender{
    
    if ((sender.selected = ! sender.selected)) {
        
        self.womanButton.selected = NO;
        
    }
}

-(void) womanButtonClick : (UIButton *)sender {
    if ((sender.selected = ! sender.selected)) {
        
        self.manButton.selected = NO;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
