//
//  BDHomeViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/6/9.
//  Copyright © 2017年 Julia. All rights reserved.
//


#import <MJRefresh.h>
#import "BDHomeViewController.h"
#import "MXScrollView.h"
#import "BDHomeCase.h"
#import "BDHomeTableViewCell.h"
#import "BDSendrequirementViewController.h"
#import "BDHomeStatusCell.h"
#import "BDFindDesignerViewController.h"
#import "BDUpdateWorkViewController.h"

@interface BDHomeViewController ()<MXScrollViewDelegate>
@property(nonatomic, strong) NSArray *workArr;
@property(nonatomic, strong) NSArray *imageUrls;

//初始化一个tableView
@property(nonatomic, strong) UITableView *listTableView;

@property(nonatomic, strong)NSArray *homeCaseArray;

@property(nonatomic, strong)BDHomeTableViewCell *cell;

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

/**
 *上拉加载更多和下拉刷新
 */


@end

@implementation BDHomeViewController

-(NSArray *)homeCaseArray {
    if (_homeCaseArray == nil) {
        _homeCaseArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HomeCase" ofType:@"plist"]];
        //1.定义一个可变数组,用来存储模型数据
        NSMutableArray *nmArr = [NSMutableArray array];
        //2.遍历字典数组
        for (NSDictionary *dict in _homeCaseArray) {
            //3.将模型数据添加到可变数组中
            [nmArr addObject:[BDHomeCase homeCaseWithDict:dict]];
        }
        //将模型数组赋值给字典数组
        _homeCaseArray = nmArr;
        
    }
    return _homeCaseArray;
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.homeCaseArray;

    self.title = @"首页";
    
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
        
    [self setNavUI];
    
    //[self homeDataNetwork];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    //初始化一个已知的图片数组
    //MXScrollView *mxScrollView = [[MXScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) withContents:self.imageUrls andScrollDelay:2];
    
    MXScrollView *mxScrollView = [[MXScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180) withContents:self.imageUrls andScrollDelay:2];
    
    //方法二：设置回调Block
    mxScrollView.clickHandler = ^(NSInteger index) {
    
        //NSLog(@"图片index：%ld",index);
        
    };
    
    [self.view addSubview:mxScrollView];
    
    //下拉刷新
    MJRefreshNormalHeader *freshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(freshData)];
    
    self.tableView.tableHeaderView = mxScrollView;
    self.tableView.mj_header = freshHeader;
    [freshHeader setTitle:@"刷新完成" forState:MJRefreshStateIdle];
    [freshHeader setTitle:@"松开刷新数据" forState:MJRefreshStatePulling];
    [freshHeader setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    freshHeader.lastUpdatedTimeLabel.hidden = YES;
    
    
    //上拉加载更多-----------下拉刷新----------------
    MJRefreshAutoNormalFooter *footerRefresh = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(moreData)];
    self.tableView.mj_footer = footerRefresh;
    
    [footerRefresh setTitle:@"加载完成" forState:MJRefreshStateIdle];
    [footerRefresh setTitle:@"松开刷新数据" forState:MJRefreshStatePulling];
    [footerRefresh setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    
    
}

#pragma mark --首页请求数据
-(void) homeDataNetwork {
    
    
    NSString *myUrl = @"http://192.168.1.3:8080/sjs_webserver/selectneeds";
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:myUrl parameters:nil sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"首页数据请求成功200");
            
            
            
        } else if ([json[@"code"] intValue] == 201) {
            
            [self.view makeToast:@"请检查网络" duration:2.0f position:CSToastPositionCenter];
            return;
        }
    } failure:^(NSError *error) {
        
    }];

}

#pragma mark -- 发需求按钮
-(void)setNavUI {
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"addDemand" target:self action:@selector(addDemandFunc)];
    
    
}

-(void) addDemandFunc {
    //NSLog(@"添加需求按钮点击了");
    //上传作品
    BDUpdateWorkViewController *updateVC = [[BDUpdateWorkViewController alloc] init];
    [self.navigationController pushViewController:updateVC animated:YES];
    
    //[self setUpUI];

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
    addButton.frame = CGRectMake(self.coverView.centerX-45, self.writeImage.centerY-50, 100, 100);
    [self.writeImage addSubview:addButton];
    self.addButton = addButton;
    [addButton setImage:[UIImage imageNamed:@"writeDemand"] forState:UIControlStateNormal];
    
    [addButton addTarget:self action:@selector(addDemandBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    addButton.userInteractionEnabled = YES;
    
    //添加一个标签
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.coverView.centerX-26, self.writeImage.centerY+50, 60, 40);
    [self.writeImage addSubview:label];
    label.text = @"发需求";
    label.textColor = rgb(79, 79, 79);
    label.font = [UIFont systemFontOfSize:18];
    //label.backgroundColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    
    
}

//下拉调用的方法
- (void)freshData
{
    NSLog(@"下拉调用了");
     [self.tableView.mj_header endRefreshing];
}

-(void) moreData {
    NSLog(@"上拉加载更多调用了");
    [self.tableView.mj_footer endRefreshing];
    
}

-(void) addDemandBtnClick {
    
    NSLog(@"发需求的绿色按钮点击了");
    [UIView animateWithDuration:0.25 animations:^{
        self.writeImage.alpha = 0;
        self.coverView.alpha = 0;

    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        [self.writeImage removeFromSuperview];
    }];


    BDSendrequirementViewController *sendVC = [[BDSendrequirementViewController alloc] init];
    [self.navigationController pushViewController:sendVC animated:YES];

   
    
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


#pragma mark -- tableView的headView的初始化
- (void)clickImageIndex:(NSInteger)index {
    
    //NSLog(@"图片index：%ld",index);
}

- (NSArray *)imageUrls {
    
//    return @[@"http://123.56.183.204:8080/ios/1.jpg", @"http://pic8.nipic.com/20100808/4953913_162517044879_2.jpg",@"http://www.taopic.com/uploads/allimg/121214/267863-12121421114939.jpg"];
    
    return @[@"http://123.56.183.204:8080/ios/1.jpg", @"http://123.56.183.204:8080/ios/2.jpg",@"http://123.56.183.204:8080/ios/3.jpg"];
    

}


#pragma mark -- tabelview的数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.homeCaseArray.count;
    
}

//返回行高
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    self.cell = [BDHomeTableViewCell homeCellWithTableView:tableView];
    
    //获取数据
    BDHomeCase *home = self.homeCaseArray[indexPath.row];

    _cell.homeList = home;
    
    
    return _cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    BDFindDesignerViewController *findVC = [[BDFindDesignerViewController alloc] init];
    [self.navigationController pushViewController:findVC animated:YES];
    
}

/**
 NSString *reuseId = @"homeCell";
 
 BDHomeStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
 
 if (!cell) {
 
 cell = [[BDHomeStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
 
 }
 
 //cell.textLabel.text = @"活着是幸福";
 //获取数据
 BDHomeCase *home = self.homeCaseArray[indexPath.row];
 
 cell.homecase = home;
 
 return cell;
 */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





















































