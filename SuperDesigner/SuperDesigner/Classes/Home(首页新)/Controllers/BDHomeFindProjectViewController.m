//
//  BDHomeFindProjectViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/4.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeFindProjectViewController.h"
#import "BDTableViewFindProjectCell.h"

@interface BDHomeFindProjectViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation BDHomeFindProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"项目库";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self tableView];
    
}

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _tableView;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
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

#pragma mark -- tableView 的数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 180;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"MyCellId";
    BDTableViewFindProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[BDTableViewFindProjectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //cell.textLabel.text = @"黄思思说所所所所所所所所";
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell点击了");
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
    //    [self.navigationController pushViewController:desVC animated:YES];
    
    
}


@end


















