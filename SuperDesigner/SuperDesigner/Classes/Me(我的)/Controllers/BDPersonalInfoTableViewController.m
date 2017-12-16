//
//  BDPersonalInfoTableViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/28.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDPersonalInfoTableViewController.h"
#import "BDPersonalInfoCell.h"
#import "BDChangeUserNameViewController.h"
#import "BDUserBindNumViewController.h"
#import "BDChangeSexTypeViewController.h"
#import "BDIconHeadView.h"
#import "BDUserAdvantageViewController.h"
#import "BDDetailIntroductionVC.h"
#import "BDApplyAddVipViewController.h"
#import "BDUserLocationViewController.h"
#import "BDUserSingViewController.h"
#import "BDChangeUserHeigheViewController.h"
#import "BDChangeWeightViewController.h"
#import "BDChangeBirthdayViewController.h"
#import "BDChageCarreraViewController.h"
#import "BDUserBasicModel.h"
#import "MJExtension.h"
#import "BDChangeHobbyViewController.h"

#import "CityPickerVeiw.h"
#import "CityNameModel.h" //省市区模型
#import "ZSAnalysisClass.h"  // 数据转模型类


@interface BDPersonalInfoTableViewController ()<UITableViewDelegate, UITableViewDataSource, BDIconHeadViewDelegate, passNickNameDelagate>

@property(nonatomic, strong) UITableView *tableView;
//数组
@property(nonatomic, strong) NSArray *arr;
//头view
@property(nonatomic, strong) BDIconHeadView *iconView;

//昵称的值
@property (nonatomic, copy) NSString *user_nickName;

//城市的值
@property(nonatomic, copy) NSString *cityNameText;

//个性签名
@property(nonatomic, copy) NSString *singText;

//身高
@property(nonatomic, copy) NSString *userHight;

//体重
@property(nonatomic, copy) NSString *userWeight;

//生日
@property(nonatomic, copy) NSString *userBirth;

//职业
@property(nonatomic, copy) NSString *userJob;

//爱好
@property(nonatomic, copy) NSString *userHobby;



//tableViewCell
@property(nonatomic, strong) BDPersonalInfoCell *dCell;

@end

@implementation BDPersonalInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //[self iconView];
    
    self.tableView.tableHeaderView = self.iconView;
    self.title = @"编辑资料";
    
    [self setNav];
    [self tableView];
    
    [self.tableView reloadData];
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self user_infoNetwork];
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

-(void) user_infoNetwork {
    //根据ID查询用户的基本信息
    NSString *ID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    
    NSDictionary *dict = @{
                           @"id": ID
                           
                           };
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_chenkUserBasicInfo parameters:dict sucess:^(id json) {
        
        if ([json[@"code"] intValue] == 200) {
            
            NSLog(@"查询成功");
            
            //[self.navigationController popViewControllerAnimated:YES];
            self.user_nickName = json[@"user"][@"username"];
            self.cityNameText = json[@"user"][@"area"];
            self.singText = json[@"user"][@"sign"];
            self.userWeight =  json[@"user"][@"weight"];
            self.userHight = json[@"user"][@"height"];
            self.userBirth = json[@"user"][@"birthday"];
            self.userJob =  json[@"user"][@"vocation"];
            self.userHobby =   json[@"user"][@"hobby"];
            
            [self.tableView reloadData];
            
            
            
        } if ([json[@"code"] intValue] == 202) {
            
            NSLog(@"异常~~~");
            
        } if ([json[@"code"] intValue] == 201) {
            
            NSLog(@"空的参数--");
            
        }
        
        
    } failure:^(NSError *error) {
        
    }];
}

-(BDIconHeadView *)iconView {
    if (_iconView == nil) {
        _iconView = [[BDIconHeadView alloc] init];
        _iconView.delegate = self;
        
    }
    return _iconView;
}

-(NSArray *)arr {
    if (_arr == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"BDEditUserInf" ofType:@"plist"];
        _arr = [NSArray arrayWithContentsOfFile:path];
        
        
        
    }
    return _arr;
}

-(UITableView *)tableView {
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
    }
    
    return _tableView;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = self.arr[section];
    NSArray *items = dict[@"items"];
    
    return items.count;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
    
}

//实现代理方法
-(void)passString:(NSString *)strValues {
    self.user_nickName = strValues;
    
    NSLog(@"昵称%@ --", self.user_nickName);
    [self.tableView reloadData];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"这个昵称啊--->%@", self.user_nickName);
    NSDictionary *group = self.arr[indexPath.section];
    
    //获取行
    NSArray *items = group[@"items"];
    
    NSDictionary *itemss = items[indexPath.row];
    
    BDPersonalInfoCell *cell = [BDPersonalInfoCell createCellWithTableView:tableView];


    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.item = itemss;
    
   
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        if (cell.detailTextLabel.text == NULL) {
            
            cell.detailTextLabel.text = @"请输入昵称";

        } else if (cell.detailTextLabel.text != NULL){

            cell.detailTextLabel.text = self.user_nickName;
        }
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        //性别
        cell.detailTextLabel.text = @"女";
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        //地区
       // cell.detailTextLabel.text = self.cityNameText;
        if (cell.detailTextLabel.text == NULL) {

            cell.detailTextLabel.text = @"请选择地区";
            
        } else if (cell.detailTextLabel.text != NULL){
            
            cell.detailTextLabel.text = self.cityNameText;
            NSLog(@"标签地区---%@", cell.detailTextLabel.text);
        }
        
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        //签名
        if (cell.detailTextLabel.text == NULL) {
            
            cell.detailTextLabel.text = @"未完善";
            
        } else if (cell.detailTextLabel.text != NULL){
            
            cell.detailTextLabel.text = self.singText;
           
        }
        
        
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        //身高
        
        if (cell.detailTextLabel.text == NULL) {
            
            cell.detailTextLabel.text = @"未完善";
            
        } else if (cell.detailTextLabel.text != NULL){
            
            cell.detailTextLabel.text = self.userHight;
            
        }
        
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        //体重
        
        if (cell.detailTextLabel.text == NULL) {
            
            cell.detailTextLabel.text = @"未完善";
            
        } else if (cell.detailTextLabel.text != NULL){
            
            cell.detailTextLabel.text = self.userWeight;
            
        }
        
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        //生日
        if (cell.detailTextLabel.text == NULL) {
            
            cell.detailTextLabel.text = @"未完善";
            
        } else if (cell.detailTextLabel.text != NULL){
            
            cell.detailTextLabel.text = self.userBirth;
            
        }
        
    } else if (indexPath.section == 1 && indexPath.row == 3) {
        //职业
        if (cell.detailTextLabel.text == NULL) {
            
            cell.detailTextLabel.text = @"未完善";
            
        } else if (cell.detailTextLabel.text != NULL){
            
            cell.detailTextLabel.text = self.userJob;
            NSLog(@"瞅瞅这个职业%@", self.userJob);
            
        }
        
    } else if (indexPath.section == 1 && indexPath.row == 4) {
        //爱好
        if (cell.detailTextLabel.text == NULL) {
            
            cell.detailTextLabel.text = @"未完善";
            
        } else if (cell.detailTextLabel.text != NULL){
            
            cell.detailTextLabel.text = self.userHobby;
            
        }
    }
    
    return cell;
}


#pragma mark -- 选中设置的cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if ( indexPath.section == 0 && indexPath.row == 0) {
        //修改昵称
        BDChangeUserNameViewController *personInfo = [[BDChangeUserNameViewController alloc] init];
//        personInfo.delegate = self;
//        NSString *text = self.user_nickName;
//        personInfo.nickName.text = text;
        
        [self.navigationController pushViewController:personInfo animated:YES];
        
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
       //修改性别
        BDChangeSexTypeViewController *personInfo = [[BDChangeSexTypeViewController alloc] init];
        [self.navigationController pushViewController:personInfo animated:YES];
    
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        //修改地区
        BDUserLocationViewController *userLocation = [[BDUserLocationViewController alloc] init];
        [self.navigationController pushViewController:userLocation animated:YES];
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        //修改个性签名
        BDUserSingViewController *singVC = [[BDUserSingViewController alloc] init];
        [self.navigationController pushViewController:singVC animated:YES];
        
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        //跳转个人主页
        BDDetailIntroductionVC *introVC = [[BDDetailIntroductionVC alloc] init];
        [self.navigationController pushViewController:introVC animated:YES];
        
                            
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        //修改用户身高
        BDChangeUserHeigheViewController *userVC = [[BDChangeUserHeigheViewController alloc] init];
        [self.navigationController pushViewController:userVC animated:YES];
        
        
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        
        //修改用户体重
        BDChangeWeightViewController *userVC = [[BDChangeWeightViewController alloc] init];
        [self.navigationController pushViewController:userVC animated:YES];
        
        
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        
        //修改用户生日
        BDChangeBirthdayViewController *userVC = [[BDChangeBirthdayViewController alloc] init];
        [self.navigationController pushViewController:userVC animated:YES];
        
    } else if (indexPath.section == 1 && indexPath.row == 3) {
        
        //修改用户职业
        BDChageCarreraViewController *userVC = [[BDChageCarreraViewController alloc] init];
        [self.navigationController pushViewController:userVC animated:YES];
        
    }  else if (indexPath.section == 1 && indexPath.row == 4) {
        
        //修改用户爱好
        BDChangeHobbyViewController *userVC = [[BDChangeHobbyViewController alloc] init];
        [self.navigationController pushViewController:userVC animated:YES];
        
    }
    
}

#pragma mark -- 点击修改用户图像的代理方法

-(void)pushPickControllerWithSourCeType:(UIImagePickerController *)imagePickerController {
    
    [self presentViewController:imagePickerController animated:YES completion:^{}];
    
}



@end



























