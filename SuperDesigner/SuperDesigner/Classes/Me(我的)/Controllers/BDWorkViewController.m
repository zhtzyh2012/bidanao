
//
//  BDWorkViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/17.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDWorkViewController.h"
#import "BDWorkCase.h"
#import "BDMyWorkTableViewCell.h"
#import "BDWorkDetailViewController.h"

@interface BDWorkViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)NSArray *workCaseArray;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong)BDMyWorkTableViewCell *cell;
@end

@implementation BDWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人作品";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNav];//设置导航栏
    [self tableView];
    //self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, 10)];
    //self.tableView.tableHeaderView.backgroundColor = ThemeGrayColor;
    //self.workCaseArray;
    

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

-(NSArray *)workCaseArray {

    if (_workCaseArray == nil) {
        _workCaseArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"myWorks" ofType:@"plist"]];
        //1.定义一个可变数组,用来存储模型数据
        NSMutableArray *nmArr = [NSMutableArray array];
        //2.遍历字典数组
        for (NSDictionary *dict in _workCaseArray) {
            //3.将模型数据添加到可变数组中
            [nmArr addObject:[BDWorkCase workCaseWithDict:dict]];
        }
        //将模型数组赋值给字典数组
        _workCaseArray = nmArr;

    }
    return _workCaseArray;


}

-(UITableView *)tableView {
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
    
}

#pragma mark -- tableView的数据源方法
//返回组
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

//返回行
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.workCaseArray.count;
    
}

//返回具体的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.cell = [BDMyWorkTableViewCell workCellWithTableView:tableView];
    
    BDWorkCase *listcg = self.workCaseArray[indexPath.row];
    _cell.workCaseList = listcg;
    
    
    return self.cell;
    
}

//点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BDWorkDetailViewController *detailVC = [[BDWorkDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];

}


//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    //1.定义一个重用的标示
//    NSString *reusedID = @"myWork";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedID];
//
//    }
//    cell.textLabel.text = @"哈哈哈哈哈哈";
//    return cell;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

