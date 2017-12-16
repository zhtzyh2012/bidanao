//
//  BDMyHomeViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyHomeViewController.h"
#import "BDHomeHeadView.h"
#import "BDMyHomeTableViewCell.h"
#import "BDHomeSearchView.h"
#import "BDHomeFindProjectViewController.h"
#import "BDFindConstructionViewController.h"
#import "BDFindDesignerWorkViewController.h"
#import "BDFindConstMaterialViewController.h"
#import "BDUpdateWorkViewController.h"
#import "BDHomeSendRequireViewController.h"
#import "BDCreateNeedViewController.h"
#import "BDHomeLatestNeedModel.h"

#import "BDSendrequirementViewController.h"

@interface BDMyHomeViewController ()<UITableViewDelegate, UITableViewDataSource, BDHomeHeadViewDelegate>

//初始化一个tableView
@property(nonatomic, strong) UITableView *tableView;

//头部视图
@property(nonatomic, strong) BDHomeHeadView *homeHeadView;

//蒙版
@property (nonatomic, weak) UIView  *coverView;

/**
 *白色的背景
 */
@property(nonatomic, weak) UIView *writeImage;

/**
 *需求按钮
 */
@property(nonatomic, weak) UIButton *addButton;

//数组
@property(nonatomic, strong) NSArray *needArr;

@end

@implementation BDMyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self adaptiOSEleven];
    [self tableView];
    self.title = @"首页";
    [self setNavUI];
//    BDHomeSearchView *searchView = [[BDHomeSearchView alloc] init];
//    searchView.frame = CGRectMake(20, 0, 300, 40);
//    self.navigationItem.titleView = searchView;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    self.tableView.tableHeaderView = self.homeHeadView;
    
    [self homeNetWorkFunc];
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.hidden = NO;
    //self.navigationController.navigationBar.translucent = YES;
    //self.tabBarController.tabBar.translucent = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBar.translucent = YES;
    //去掉导航栏底部的黑线
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
}

-(NSArray *)needArr {
    if (_needArr == nil) {
        _needArr = [[NSArray alloc] init];
    }
    return _needArr;
}


- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar  setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:nil];
    
}

-(void) adaptiOSEleven {
    
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
        
    }
}


-(BDHomeHeadView *)homeHeadView {
    if (_homeHeadView == nil) {
        _homeHeadView = [[BDHomeHeadView alloc] init];
        _homeHeadView.delegate = self;
    }
    return _homeHeadView;
    
}

//实现代理方法
-(void)homeFindProjectClick {
    NSLog(@"点击了");
    BDHomeFindProjectViewController *proVC = [[BDHomeFindProjectViewController alloc] init];
    [self.navigationController pushViewController:proVC animated:YES];
    
    
}

//
-(void) homeFindConstructionClick {
    
    NSLog(@"工程商按钮点击了");
    BDFindConstructionViewController *proVC = [[BDFindConstructionViewController alloc] init];
    [self.navigationController pushViewController:proVC animated:YES];
}

//找设计
-(void)homeFindDesignerClick {
    
    BDFindDesignerWorkViewController *deVC = [[BDFindDesignerWorkViewController alloc] init];
    [self.navigationController pushViewController:deVC animated:YES];
    
}

//找建材
-(void)homeFindConsMaterialClick {
    
    BDFindConstMaterialViewController *consVC = [[BDFindConstMaterialViewController alloc] init];
    [self.navigationController pushViewController:consVC animated:YES];
    
}



-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, KScreen_HEIGHT) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
    }
    return _tableView;
}


#pragma mark -- 发需求按钮
-(void)setNavUI {
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"addDemand" target:self action:@selector(addDemandFunc)];
    
    
}

-(void) addDemandFunc {
    //NSLog(@"添加需求按钮点击了");
    //上传作品
    //BDUpdateWorkViewController *updateVC = [[BDUpdateWorkViewController alloc] init];
    //[self.navigationController pushViewController:updateVC animated:YES];
    
    [self setUpUI];
    
}

#pragma mark -- 添加一个蒙版
-(void) setUpUI {
    
    //新建一个view
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 270, KScreen_WIDTH, KScreen_HEIGHT-270)];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.6;
    [self.tabBarController.view addSubview:coverView];
    self.coverView = coverView;
    
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDismissFunc:)];
    [coverView addGestureRecognizer:tapgesture];
    
    
    
    //添加一个白色的背景view
    UIView *writeImage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, 270)];
    [self.tabBarController.view addSubview:writeImage];
    writeImage.backgroundColor = [UIColor whiteColor];
    writeImage.alpha = 0.95;
    writeImage.userInteractionEnabled = YES;
    self.writeImage = writeImage;
    
    
    //添加一个Button按钮
    UIButton *addButton = [[UIButton alloc] init];
    addButton.frame = CGRectMake(self.coverView.centerX-150, self.writeImage.centerY-50, 100, 100);
    [self.writeImage addSubview:addButton];
    self.addButton = addButton;
    [addButton setImage:[UIImage imageNamed:@"writeDemand"] forState:UIControlStateNormal];
    
    [addButton addTarget:self action:@selector(addDemandBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    addButton.userInteractionEnabled = YES;
    
    //添加一个标签
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.coverView.centerX-150, self.writeImage.centerY+50, 100, 50);
    [self.writeImage addSubview:label];
    label.text = @"发布需求";
    label.textColor = rgb(79, 79, 79);
    label.font = [UIFont systemFontOfSize:18];
    //label.backgroundColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    
    //添加第二个Button按钮
    UIButton *addButtonTwo = [[UIButton alloc] init];
    addButtonTwo.frame = CGRectMake(self.coverView.centerX+33, self.writeImage.centerY-50, 100, 100);
    [self.writeImage addSubview:addButtonTwo];
    self.addButton = addButton;
    [addButtonTwo setImage:[UIImage imageNamed:@"updateWorks"] forState:UIControlStateNormal];
    
    [addButtonTwo addTarget:self action:@selector(addDemandBtnClickTwo) forControlEvents:UIControlEventTouchUpInside];
    
    addButton.userInteractionEnabled = YES;
    
    //添加第二个标签
    UILabel *labelTwo = [[UILabel alloc] init];
    labelTwo.frame = CGRectMake(self.coverView.centerX+23, self.writeImage.centerY+50, 120, 50);
    [self.writeImage addSubview:labelTwo];
    labelTwo.text = @"上传作品";
    labelTwo.textColor = rgb(79, 79, 79);
    labelTwo.font = [UIFont systemFontOfSize:18];
    //label.backgroundColor = [UIColor blueColor];
    labelTwo.textAlignment = NSTextAlignmentCenter;
    

}

#pragma mark -- 发布需求的按钮
-(void) addDemandBtnClick {

    
    [self disapperCorrectView];
    //BDHomeSendRequireViewController   BDCreateNeedViewController
    BDCreateNeedViewController *sendVC = [[BDCreateNeedViewController alloc] init];
    [self.navigationController pushViewController:sendVC animated:YES];
    
}

#pragma mark -- 上传作品的按钮
-(void) addDemandBtnClickTwo {
    
    [self disapperCorrectView];
    
    BDUpdateWorkViewController *sendVC = [[BDUpdateWorkViewController alloc] init];
    [self.navigationController pushViewController:sendVC animated:YES];
}

#pragma mark -- 让当前的视图层消失
-(void) disapperCorrectView {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.writeImage.alpha = 0;
        self.coverView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        [self.writeImage removeFromSuperview];
    }];
}

-(void) tapDismissFunc:(UITapGestureRecognizer *)tapGesture {
    
    //添加动画效果
    [UIView animateWithDuration:0.25 animations:^{
        self.writeImage.alpha = 0;
        self.coverView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        [self.writeImage removeFromSuperview];
    }];
    
    
}

#pragma mark -- 首页的网络请求方法
-(void) homeNetWorkFunc {
   
    NSDictionary *dict = @{
                           @"a":@"0",
                           @"b":@"1",
    };
    
    //url_checkUserPersonalLatestNeeds
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_checkUserPersonalLatestNeeds parameters:dict sucess:^(id json) {
        
        NSMutableArray *nmArray = [NSMutableArray array];
        for (NSDictionary *dict in json[@"list"]) {
            BDHomeLatestNeedModel *model = [BDHomeLatestNeedModel needWithDict:dict];
            [nmArray addObject:model];

        }
        //赋值
        self.needArr = nmArray;

        [self.tableView reloadData];
        
        
        if ([json[@"code"] intValue] == 200) {
            
            NSLog(@"首页数据请求成功");
            
        } else if ([json[@"code"] intValue] == 201) {
            
            [self.view makeToast:@"请检查网络" duration:2.0f position:CSToastPositionCenter];
            return;
        }
    } failure:^(NSError *error) {
        
    }];
    

}


#pragma mark -- 实现数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //return 10;
    return self.needArr.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"homeCellId";
    BDMyHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell) {
        cell = [[BDMyHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    BDHomeLatestNeedModel *model = self.needArr[indexPath.row];
    cell.model = model;
    
    
    //cell.textLabel.text = @"首页的cell样式";
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell点击了");
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
//    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
//    [self.navigationController pushViewController:desVC animated:YES];
    
    
}



@end








































