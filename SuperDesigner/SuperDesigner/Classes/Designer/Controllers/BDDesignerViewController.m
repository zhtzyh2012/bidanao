//
//  BDDesignerViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/6/12.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesignerViewController.h"
#import "BDTableViewDesignerCell.h"
#import "BDNCase.h"
#import "BDDesignerDetailViewController.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BDDesignerViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *caseArray;

@property(nonatomic, strong)BDTableViewDesignerCell *cell;


@end

@implementation BDDesignerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.caseArray;
    
    self.title = @"大咖";
    [self tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = NO;
    
    
}

//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
//    
//}

-(UITableView *)tableView {
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }

    return _tableView;
    
}

-(NSArray *)caseArray {
    
    if(_caseArray == nil) {
        
        _caseArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"case" ofType:@"plist"]];
        
        NSMutableArray *nmArray = [NSMutableArray array];
        
        for(NSDictionary *dict in _caseArray) {
            //字典转模型,并添加到可变数组中
            [nmArray addObject:[BDNCase caseWithDict:dict]];
            
        }
        _caseArray = nmArray;
        
    }
    
    return _caseArray;
    
}

#pragma mark -- tableView 的代理方法
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 110;

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.caseArray.count;
    
    //return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.cell = [BDTableViewDesignerCell designerCell:tableView];
    
    BDNCase *listcg = self.caseArray[indexPath.row];
    _cell.caseList = listcg;
    
    
    return self.cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"cell点击了");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
    [self.navigationController pushViewController:desVC animated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


























