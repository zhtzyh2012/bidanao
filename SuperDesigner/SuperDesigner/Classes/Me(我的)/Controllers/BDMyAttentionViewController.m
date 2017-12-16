//
//  BDMyAttentionViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyAttentionViewController.h"
#import "BDMyAttentionModel.h"
#import "BDMyAttentionTableViewCell.h"

@interface BDMyAttentionViewController ()<UITableViewDelegate, UITableViewDataSource>
//tableView
@property(nonatomic, strong) UITableView *tableView;
//模型数组
@property(nonatomic, strong) NSArray *attentionArr;

@property(nonatomic, strong) BDMyAttentionTableViewCell *cell;

@end

@implementation BDMyAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    self.title = @"我的关注";
    [self tableView];
    //self.attentionArr;
    
    
}

-(NSArray *)attentionArr {
    if (_attentionArr == nil) {
        _attentionArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MyAttention" ofType:@"plist"]];
        //定义一个可变数组,用来存储模型对象
        NSMutableArray *nmArray = [NSMutableArray array];
        for (NSDictionary *dict in _attentionArr) {
            
            [nmArray addObject:[BDMyAttentionModel attentionListWithDict:dict]];
            
        }
        //赋值
        _attentionArr = nmArray;
    }
    return _attentionArr;
    
}

-(UITableView *)tableView {
    if (_tableView == nil) {
        
        //_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height -64) style:UITableViewStylePlain];
        
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
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




//返回组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

//返回行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.attentionArr.count;
    
}

//返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    self.cell = [BDMyAttentionTableViewCell  attentionCellWithTableView:tableView];
    BDMyAttentionModel *attentionModel = self.attentionArr[indexPath.row];
    _cell.attentionModel = attentionModel;
    return _cell;
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
























































