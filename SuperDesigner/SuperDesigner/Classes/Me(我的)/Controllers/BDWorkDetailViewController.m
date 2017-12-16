//
//  BDWorkDetailViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/19.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDWorkDetailViewController.h"
#import "BDStatusToolBar.h"
#import "IWStatusToolBar.h"
typedef NS_ENUM(NSUInteger, IWStatusToolBarBtnType) {
    IWStatusToolBarBtnTypeRetweet = 1001,
    IWStatusToolBarBtnTypeComment = 1002,
    IWStatusToolBarBtnTypeAttitude = 1003,
};

@interface BDWorkDetailViewController ()
//背景
@property(nonatomic, weak) UIView *viewBack;
@property (nonatomic, strong) IWStatusToolBar *toolBar;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation BDWorkDetailViewController

- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    self.title = @"作品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
    
}

-(void) setUpUI {
    
    UIView *viewBack = [[UIView alloc] init];
    viewBack.backgroundColor = [UIColor greenColor];
     [self.view addSubview:viewBack];
    
    [viewBack mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.view).mas_offset(-0.1);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(KScreen_WIDTH);
    
    }];
    

}


-(void)setNav {
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftArrow"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
}

-(void) backClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
















































