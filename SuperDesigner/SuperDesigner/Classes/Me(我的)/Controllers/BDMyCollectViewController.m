//
//  BDMyCollectViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/26.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyCollectViewController.h"
#import "BDMyCollectModel.h"
#import "BDMyCollectTableViewCell.h"

@interface BDMyCollectViewController ()<UITableViewDelegate, UITableViewDataSource>
//定义一个数组来接收
@property(nonatomic, strong) NSArray *collectArr;

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong)BDMyCollectTableViewCell *cell;
//headView
@property(nonatomic, strong) UIView *collecHeadView;

@end


@implementation BDMyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ThemeGrayColor;
    self.title = @"我的收藏";
    [self setNav];
    [self tableView];
    //self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, 10)];
    //self.tableView.tableHeaderView.backgroundColor = ThemeGrayColor;
    //self.collectArr;
    
}


-(UIView *)collecHeadView {
    if (_collecHeadView == nil) {
        _collecHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, 10)];
        //[self.view addSubview:_collecHeadView];
        _collecHeadView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collecHeadView;
}

-(NSArray *)collectArr {
    
    if (_collectArr == nil) {
        _collectArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MyCollects" ofType:@"plist"]];
        //定义一个可变数组用来存储模型数据
        NSMutableArray *nmArray = [NSMutableArray array];
        //遍历字典数据
        for (NSDictionary *dict in _collectArr) {
            [nmArray addObject:[BDMyCollectModel collectCaseWithDict:dict]];
        }
        _collectArr = nmArray;
    }
    return _collectArr;
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

-(void) viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;

}


//设置tableView
-(UITableView *)tableView {
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
    
}

//返回组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
//返回行
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.collectArr.count;
    
}


//返回具体的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    self.cell = [BDMyCollectTableViewCell collectCellWithTableView:tableView];
    BDMyCollectModel *collectModel = self.collectArr[indexPath.row];
    _cell.myCollectModel = collectModel;
    return _cell;

}



@end














































