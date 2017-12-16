//
//  BDProfileViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/6/14.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDProfileViewController.h"
#import "BDProfileHeadView.h"
#import "BDSettingCell.h"
#import "BDMyAttentionViewController.h"
#import "BDWorkViewController.h"
#import "BDMyAdviceViewController.h"
#import "BDIDVerifyViewController.h"
#import "BDMyWalletViewController.h"
#import "BDMyNeedTableViewController.h"

#import "BDLoginViewController.h"
#import "BDSetViewController.h"
#import "BDAdviceFeedbackVC.h"
#import "BDCheckMyDemandViewController.h"
#import "BDCheckMySendViewController.h"
#import "BDAboutUsViewController.h"
//上传作品
#import "BDUpdateWorkViewController.h"
//我的收藏
#import "BDMyCollectViewController.h"
#import "BDMyCommentViewController.h"
#import "BDAdviceViewController.h"


@interface BDProfileViewController ()<UITableViewDelegate, UITableViewDataSource, BDProfileHeadViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

//headView
@property(nonatomic, strong) BDProfileHeadView *headView;

@property(nonatomic, strong) UITableView *tableView;

//plist 数组
@property(nonatomic, strong) NSArray *arrgroups;


@end

@implementation BDProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    
    //self.title = @"我的";
    self.navigationItem.title = @"个人中心";
    self.tableView.tableHeaderView = self.headView;
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航栏
    [self setNav];
    
}

#pragma mark -- 设置导航栏
-(void)setNav {

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"" title:@"设置" target:self action:@selector(setClickBtn)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];

}

-(void) setClickBtn {
    
    NSLog(@"设置按钮点击了");
    BDSetViewController *setVC = [[BDSetViewController alloc] init];
    [self.navigationController pushViewController:setVC animated:YES];
    
}

//显示和隐藏nav
-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.tabBar.hidden = NO;
    
    //rgb(49, 144, 250);
    self.navigationController.navigationBar.barTintColor = rgb(49, 144, 250);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    //去除导航栏下方的横线
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

}


-(void)viewWillDisappear:(BOOL)animated{
    

    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}


-(NSArray *)arrgroups {

    if(_arrgroups == nil) {
        
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"BDNSettings" ofType:@"plist"];
        _arrgroups = [NSArray arrayWithContentsOfFile:strPath];
        
    }
    return _arrgroups;
    
    
}

//头部的view
-(BDProfileHeadView *)headView {

    if (_headView == nil) {
        
        _headView = [[BDProfileHeadView alloc] init];
        _headView.delegate = self;
        
    }
    
    return _headView;
    
}

-(UITableView *)tableView {
    
    if (_tableView == nil) {
        //_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
        
         [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
    }
    
    return _tableView;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        //BDCheckMySendViewController *sendVC = [[BDCheckMySendViewController alloc] init];
        //[self.navigationController pushViewController:sendVC animated:YES];
        
        //上传作品
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

//调整tableView的头部视图的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 5;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    //headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

-(void)headViewBtnClick {
    
    NSLog(@"图像按钮响应了");
    
}

// 设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"offset---scroll:%f",self.tableView.contentOffset.y);
    UIColor *color= rgb(49, 144, 250);
    CGFloat offset=scrollView.contentOffset.y;
    if (offset < -64) {
        self.navigationController.navigationBar.backgroundColor = color;
        self.navigationController.navigationBar.translucent = NO;

    } else {

        CGFloat alpha= 1-((64-offset)/64);
        self.navigationController.navigationBar.backgroundColor=[color colorWithAlphaComponent:alpha];
        
    }
}


@end
