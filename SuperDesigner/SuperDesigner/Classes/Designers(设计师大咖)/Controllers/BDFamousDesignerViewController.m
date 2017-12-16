//
//  BDFamousDesignerViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/22.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDFamousDesignerViewController.h"
#import "BDRightTableView.h"
#import "BDLeftTableView.h"

@interface BDFamousDesignerViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView * backScrollView;
@property(nonatomic,strong)BDLeftTableView * leftTableView;
@property(nonatomic,strong)BDRightTableView * rightTableView;
@property(nonatomic, strong) UISegmentedControl *segmentedControl;


@end

@implementation BDFamousDesignerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    [self createSegMentController];
    
    [self backScrollView];
    [self leftTableView];
    [self rightTableView];
    
    
}

-(UIScrollView *)backScrollView{
    
    if (_backScrollView == nil) {
        _backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, KScreen_WIDTH, KScreen_HEIGHT)];
        _backScrollView.contentSize = CGSizeMake(KScreen_WIDTH*2,0);
        
        _backScrollView.pagingEnabled = YES;
        _backScrollView.bounces = NO;
        _backScrollView.backgroundColor = [UIColor lightGrayColor];
        _backScrollView.showsHorizontalScrollIndicator = NO;
        _backScrollView.showsVerticalScrollIndicator = NO;
        _backScrollView.delegate = self;
        [self.view addSubview:_backScrollView];
    }
    
    return _backScrollView;
    
}

-(BDLeftTableView *)leftTableView{
    
    if (_leftTableView == nil) {
        _leftTableView = [[BDLeftTableView alloc]initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, KScreen_HEIGHT - 100) style:UITableViewStylePlain];
        
        _leftTableView.separatorStyle = UITableViewRowAnimationNone;
        
        //_leftTableView.delegateOne = self;
        
        [self.backScrollView addSubview:_leftTableView];
    }
    return _leftTableView;
}


-(BDRightTableView *)rightTableView{
    if (_rightTableView == nil) {
        _rightTableView = [[BDRightTableView alloc]initWithFrame:CGRectMake(KScreen_WIDTH, 0, KScreen_WIDTH, KScreen_HEIGHT) style:UITableViewStylePlain];
        _rightTableView.separatorStyle = UITableViewRowAnimationNone;
        //_rightTableView.delegateTwo = self;
        [self.backScrollView addSubview:_rightTableView];
    }
    return _rightTableView;
}


//创建导航栏分栏控件
-(void)createSegMentController{
    
    NSArray *segmentedArray = [NSArray arrayWithObjects:@"大咖",@"全部",nil];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    self.segmentedControl = segmentedControl;
    
    segmentedControl.frame = CGRectMake(0, 0, 200, 35);
    
    segmentedControl.selectedSegmentIndex = 0;
    //segmentedControl.tintColor = [UIColor colorWithRed:252/255.0 green:245/255.0 blue:248/255.0 alpha:1];
    //segmentedControl.backgroundColor = [UIColor greenColor];
    [segmentedControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    [segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} forState:UIControlStateNormal];
    
    [self.navigationItem setTitleView:segmentedControl];
}


-(void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        
        NSLog(@"第一个");
        self.backScrollView.contentOffset = CGPointMake(0, 0);
        
    }else if(sender.selectedSegmentIndex == 1){
        
        NSLog(@"第二个");
        self.backScrollView.contentOffset = CGPointMake(KScreen_WIDTH, 0);
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat xfloat = scrollView.contentOffset.x;
    NSLog(@"---====   %f",xfloat);
    if (xfloat>KScreen_WIDTH*0.5) {
        self.backScrollView.contentOffset = CGPointMake(KScreen_WIDTH, 0);
        self.segmentedControl.selectedSegmentIndex = 1;
    }else{
        self.backScrollView.contentOffset = CGPointMake(0, 0);
        self.segmentedControl.selectedSegmentIndex = 0;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
