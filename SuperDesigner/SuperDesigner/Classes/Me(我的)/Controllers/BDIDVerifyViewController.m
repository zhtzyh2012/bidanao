//
//  BDIDVerifyViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/7.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDIDVerifyViewController.h"
#import "BDInsetLabel.h"
#import "BDSetUserCell.h"

@interface BDIDVerifyViewController ()<UITableViewDelegate, UITableViewDataSource>
//tableView
@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *arrayNum;

@end

@implementation BDIDVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ThemeGrayColor;
    [self setNav];
//    [self setUpUI];
    [self tableView];
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}



-(void)setNav {
    
    self.title = @"身份认证";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftArrow"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"rightQuestionIcon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    
}

-(void) backClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void) rightItemClick {
    
    NSLog(@"右边的按钮点击了");
    
}

-(NSArray *)arrayNum {
    
    if(_arrayNum == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"BDSetConfirmID" ofType:@"plist"];
        
        _arrayNum = [NSArray arrayWithContentsOfFile:path];
        
    }
    
    return _arrayNum;
    
}

-(UITableView *)tableView {
    
    if (_tableView == nil) {
        //_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, KScreen_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = rgb(239, 239, 244);
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
    }
    
    return _tableView;
    
}

#pragma mark -- tableView  的数据源方法

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arrayNum.count;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *dict = self.arrayNum[section];
    
    NSArray *items = dict[@"items"];
    
    return items.count;
    
    
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *group = self.arrayNum[indexPath.section];
    
    NSArray *items = group[@"items"];
    
    NSDictionary *itemss = items[indexPath.row];
    
    
    BDSetUserCell *userCell = [BDSetUserCell createCellWithTableView:tableView];
    
    userCell.selectionStyle = UITableViewCellSelectionStyleNone;
    userCell.item = itemss;
    
    return userCell;
    
}

#pragma mark -- 选中设置的cell的点击事件

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    //NSLog(@"cell点击了");
//    if ( indexPath.row == 0) {
//        NSLog(@"我是被点击的第一行");
//
//        BDPersonalInfoTableViewController *personInfo = [[BDPersonalInfoTableViewController alloc] init];
//        [self.navigationController pushViewController:personInfo animated:YES];
//
//
//    } else if (indexPath.row == 1) {
//        NSLog(@"我是被点击的第二行");
//        BDUserBindNumViewController *bindVC = [[BDUserBindNumViewController alloc] init];
//        [self.navigationController pushViewController:bindVC animated:YES];
//
//    } else if (indexPath.row == 2) {
//        NSLog(@"我是被点击的第2行");
//        BDChangePwdViewController *changeVC = [[BDChangePwdViewController alloc] init];
//        [self.navigationController pushViewController:changeVC animated:YES];
//
//    } else if (indexPath.row == 3) {
//        NSLog(@"我是被点击的第3行");
//        [self.view makeToast:@"缓存已清理!"
//                    duration:2.0
//                    position:CSToastPositionCenter];
//
//    } else if (indexPath.row == 4) {
//
//        NSLog(@"我是被点击的第4行");
//        [self.view makeToast:@"已设置!"
//                    duration:2.0
//                    position:CSToastPositionCenter];
//    }
//
//}
//



-(void) setUpUI {
    
    UIView *backV = [[UIView alloc] init];
    [self.view addSubview:backV];
    [backV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0.1);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(200);
        
    }];
    backV.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [backV addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(130, 20));
        
    }];
    nameLabel.text = @"实名认证";
    nameLabel.textColor = rgb(66, 66, 66);
    nameLabel.font = [UIFont systemFontOfSize:16];
    
    UIImageView *rignhArrow = [[UIImageView alloc] init];
    [backV addSubview:rignhArrow];
    [rignhArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.right.equalTo(self.view).offset(-10);
        make.size.mas_equalTo(CGSizeMake(8, 15));
        
    }];
    rignhArrow.image = [UIImage imageNamed:@"backArrow"];
    
    
    BDInsetLabel *confirmLabel = [[BDInsetLabel alloc] init];
    [backV addSubview:confirmLabel];
    [confirmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(14);
        make.right.equalTo(rignhArrow.mas_left).offset(-7);
        make.size.mas_equalTo(CGSizeMake(60, 20));
        
    }];
    confirmLabel.text = @"已实名";
    confirmLabel.font = [UIFont systemFontOfSize:15];
    confirmLabel.textColor = rgb(103, 165, 238);
    confirmLabel.layer.borderColor = [rgb(103, 165, 238) CGColor];
    confirmLabel.layer.borderWidth = 0.8;
    confirmLabel.layer.masksToBounds = YES;
    confirmLabel.layer.cornerRadius = 5;
    confirmLabel.insets = UIEdgeInsetsMake(2, 7, 2, 3);
    //confirmLabel.backgroundColor = [UIColor blueColor];
    
    UILabel *realNameLabel = [[UILabel alloc] init];
    [backV addSubview:realNameLabel];
    [realNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(14);
        make.right.equalTo(confirmLabel.mas_left).offset(-3);
        make.size.mas_equalTo(CGSizeMake(60, 20));
        
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
