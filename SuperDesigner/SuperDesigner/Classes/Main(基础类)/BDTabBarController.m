//
//  BDTabBarController.m
//  SuperDesigner
//
//  Created by Julia on 2017/6/8.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDTabBarController.h"
#import "BDHomeViewController.h"
#import "BDDesignerViewController.h"
#import "BDProfileViewController.h"
#import "BDNavigationViewController.h"
#import "BDCommitViewController.h"
#import "BDLoginViewController.h"
#import "BDDesingInstituteViewController.h"
#import "BDFamousDesignerViewController.h"
#import "BDMyHomeViewController.h"
#import "BDMeCenterViewController.h"

@interface BDTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置一下根控制器
    UITabBarController *tabCtr = [[UITabBarController alloc] init];
    
    //设置tabBar的代理
    self.delegate = self;
    
    UITabBarController *homeCtr = [[UITabBarController alloc] init];
    homeCtr.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    homeCtr.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
    homeCtr.tabBarItem.title = @"首页";
    
    [tabCtr addChildViewController:homeCtr];

    //BDHomeViewController
    BDMyHomeViewController *homeVC = [[BDMyHomeViewController alloc] init];
    [self addChildViewController:homeVC imageName:@"tabbar_home" title:@"首页"];
    
    //BDDesingInstituteViewController.h
    BDDesingInstituteViewController *InsVC = [[BDDesingInstituteViewController alloc] init];
    [self addChildViewController:InsVC imageName:@"tabbar_discover" title:@"发现"];
    
    // BDDesignerViewController  BDFamousDesignerViewController
    BDFamousDesignerViewController *designVC = [[BDFamousDesignerViewController alloc] init];
    [self addChildViewController:designVC imageName:@"tabbar_designer" title:@"设计师"];
    
    //BDProfileViewController
    //BDMeMainViewController
    BDMeCenterViewController *meVC = [[BDMeCenterViewController alloc] init];
    [self addChildViewController:meVC imageName:@"tabbar_me" title:@"我的"];
    
    

}

//抽取子控制器
-(void)addChildViewController:(UIViewController *)childCtrl imageName:(NSString *)imageName title:(NSString *)title {
    
    childCtrl.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childCtrl.tabBarItem.title = title;
    //指定属性
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor colorWithRed:109/255.0 green:198/255.0 blue:195/225.0 alpha:1];
    //dic[NSForegroundColorAttributeName] = [UIColor redColor];
    
    [childCtrl.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    
    //包裹一下一个navigationController
    BDNavigationViewController *navc = [[BDNavigationViewController alloc] initWithRootViewController:childCtrl];
    
    
    [self addChildViewController:navc];

    

}

#pragma mark -- tabBar的代理
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    
    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        
        id user_ID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
        //如果用户ID存在的话，说明已登陆
        if (user_ID) {
            return YES;
        }
        else
        {
            //跳到登录页面
            //BDLoginViewController *login = [[BDLoginViewController alloc] init];
            //隐藏tabbar
            //login.hidesBottomBarWhenPushed = YES;
            //[((UINavigationController *)tabBarController.selectedViewController) pushViewController:login animated:YES];
            
            //[((UINavigationController *)tabBarController.selectedViewController) presentViewController:login animated:YES completion:nil];
            
            
            BDLoginViewController *loginVC = [[BDLoginViewController alloc] init];
            UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:loginVC];
            [self presentViewController:nvc animated:YES completion:^{
                NSLog(@"第四个tabBar弹出一个modal窗口");
            }];

            
            return NO;
        }
    }
    else
        return YES;
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
    
}



@end





















