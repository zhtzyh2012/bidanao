//
//  BDFindDesignerWorkViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/5.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDFindDesignerWorkViewController.h"
#import "SPPageMenu.h"

#import "BDFindConstructionViewController.h"
#import "BDHomeFindProjectViewController.h"
#import "BDAccoredingDesignerViewController.h"
#import "BDAccordingWorkViewController.h"

@interface BDFindDesignerWorkViewController ()

@end

@implementation BDFindDesignerWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    
    BDAccoredingDesignerViewController *vc1 = [[BDAccoredingDesignerViewController alloc] init];
    vc1.title = @"根据设计师";
    
    
    BDAccordingWorkViewController *vc2 = [[BDAccordingWorkViewController alloc] init];
    vc2.title = @"根据作品";
    
    
    self.viewControllers = @[vc1, vc2];
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}


-(void)setNav {
    
    self.title = @"找设计";
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell点击了");
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
    //    [self.navigationController pushViewController:desVC animated:YES];
    
    
}






@end
