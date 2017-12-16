//
//  BDMeCenterViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/8.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMeCenterViewController.h"
#import "BDSettingCell.h"
#import "BDProfileHeadView.h"
#import "BDMyNeedTableViewController.h"
#import "BDCheckMyDemandViewController.h"
#import "BDMyAttentionViewController.h"
#import "BDMyWalletViewController.h"
#import "BDMyCommentViewController.h"
#import "BDAdviceViewController.h"
#import "BDIDVerifyViewController.h"
#import "BDWorkViewController.h"
#import "BDMyCollectViewController.h"
#import "BDSetViewController.h"


@interface BDMeCenterViewController ()<UITableViewDelegate, UITableViewDataSource, BDProfileHeadViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
//plist 数组
@property(nonatomic, strong) NSArray *arrgroups;
//头部视图
@property(nonatomic, strong) BDProfileHeadView *headView;


@end

@implementation BDMeCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ThemeGrayColor;
    self.navigationItem.title = @"个人中心";
    
    [self tableView];
    
}

-(NSArray *)arrgroups {
    
    if(_arrgroups == nil) {
        
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"BDNSettings" ofType:@"plist"];
        _arrgroups = [NSArray arrayWithContentsOfFile:strPath];
        
    }
    return _arrgroups;
    
    
}

-(void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = rgb(49, 144, 250);
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = YES;
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.tabBar.hidden = NO;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    //去除导航栏下方的横线
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

}

#pragma mark -- 将去掉的黑线再设置回来
-(void)viewWillDisappear:(BOOL)animated{
    
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}


-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.x, self.view.y, KScreen_WIDTH, KScreen_HEIGHT-64) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}


//头部的view
-(BDProfileHeadView *)headView {
    
    if (_headView == nil) {
        
        _headView = [[BDProfileHeadView alloc] init];
        _headView.delegate = self;
        
    }
    
    return _headView;
    
}

-(void)headViewBtnClick {
    
    NSLog(@"嗨呀这个头像按钮响应了");
    
}


#pragma mark -- tableView  的数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arrgroups.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //根据组号来获取段
    NSDictionary *dic = self.arrgroups[section];
    //获取行
    NSArray *items = dic[@"items"];
    
    return items.count;
    
}

//调整tableView的头部视图的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 5;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *group = self.arrgroups[indexPath.section];
    
    //获取行
    NSArray *items = group[@"items"];
    
    NSDictionary *itemss = items[indexPath.row];
    
    BDSettingCell *cell = [BDSettingCell createCellWithTableView:tableView];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.item = itemss;
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        //cell.detailTextLabel.text = @"1/2";
    }
    
    return cell;
    
}

#pragma mark -- 点击cell的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        //BDCheckMySendViewController *sendVC = [[BDCheckMySendViewController alloc] init];
        //[self.navigationController pushViewController:sendVC animated:YES];
        
        //我的钱包
        BDMyWalletViewController *walletVC = [[BDMyWalletViewController alloc] init];
        [self.navigationController pushViewController:walletVC animated:YES];
        
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        
        BDCheckMyDemandViewController *checkVC = [[BDCheckMyDemandViewController alloc] init];
        [self.navigationController pushViewController:checkVC animated:YES];
        
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        
        BDMyNeedTableViewController *needVC = [[BDMyNeedTableViewController alloc] init];
        [self.navigationController pushViewController:needVC animated:YES];
        
        
    }else if (indexPath.section == 0 && indexPath.row == 3) {
        
        
        BDCheckMyDemandViewController *checkVC = [[BDCheckMyDemandViewController alloc] init];
        [self.navigationController pushViewController:checkVC animated:YES];
        
        
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        //BDWorkViewController.h
        BDWorkViewController *workVC = [[BDWorkViewController alloc] init];
        [self.navigationController pushViewController:workVC animated:YES];
        
        
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        
        BDMyCollectViewController *collectVC = [[BDMyCollectViewController alloc] init];
        [self.navigationController pushViewController:collectVC animated:YES];
        
        //BDAboutUsViewController *aboutVC = [[BDAboutUsViewController alloc] init];
        //[self.navigationController pushViewController:aboutVC animated:YES];
        
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        //我的关注
        BDMyAttentionViewController *attentionVC = [[BDMyAttentionViewController alloc] init];
        [self.navigationController pushViewController:attentionVC animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 3) {
        //我的点评
        NSLog(@"我的点评点击了");
        BDMyCommentViewController *commentVC = [[BDMyCommentViewController alloc] init];
        [self.navigationController pushViewController:commentVC animated:YES];
        
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        
        BDIDVerifyViewController *idVC = [[BDIDVerifyViewController alloc] init];
        [self.navigationController pushViewController:idVC animated:YES];
        
    } else if (indexPath.section == 2 && indexPath.row == 1) {
        //意见反馈
        BDAdviceViewController *adVC = [[BDAdviceViewController alloc] init];
        [self.navigationController pushViewController:adVC animated:YES];
        
        //BDMyAdviceViewController *adVC = [[BDMyAdviceViewController alloc] init];
        //[self.navigationController pushViewController:adVC animated:YES];
        
    } else if (indexPath.section == 2 && indexPath.row == 2) {
        //个人设置界面
        BDSetViewController *setVC = [[BDSetViewController alloc] init];
        [self.navigationController pushViewController:setVC animated:YES];
    }
    
}

@end



















































