//
//  BDAccordingWorkViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/6.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDAccordingWorkViewController.h"
#import "BDAccordingWorkTableViewCell.h"

@interface BDAccordingWorkViewController ()<UITableViewDelegate, UITableViewDataSource>
//初始化一个tableView
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation BDAccordingWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableView];
}

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}


#pragma mark -- 实现数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 196;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"accordWorkId";
    BDAccordingWorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell) {
        cell = [[BDAccordingWorkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = @"根据作品的列表";
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell点击了");
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
    //    [self.navigationController pushViewController:desVC animated:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
