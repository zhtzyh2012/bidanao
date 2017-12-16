//
//  BDMyNeedTableViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyNeedTableViewController.h"
#import "BDMyNeedModel.h"

@interface BDMyNeedTableViewController ()

//数组来接收
@property(nonatomic, strong) NSArray *needFrameArray;

@end

@implementation BDMyNeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    //self.needFrameArray;
    [self myNeedNetFunc];
    
    
}

-(NSArray *)needFrameArray {
    
    if (_needFrameArray == nil) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MyNeeds" ofType:@"plist"]];
        NSMutableArray *nmArray = [NSMutableArray array];
        for (NSDictionary *diet in array) {
            BDMyNeedModel *myNeed = [BDMyNeedModel needsWithDict:diet];
            
            [nmArray addObject:myNeed];
            
        }
        _needFrameArray = nmArray;
        
        
    }
    return _needFrameArray;
    
}

-(void)setNav {
    self.title = @"我的需求";
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

#pragma mark --我的需求

-(void)myNeedNetFunc {
    
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSDictionary *dictParams = @{
                                 @"id" : IDNum,
                                 
                                 };
    
    
    NSString *needUrl = @"http://192.168.1.3:8080/sjs_webserver/selectNeed";
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:needUrl parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"请求我的需求页面数据成功200");
            
        } else if ([json[@"code"] intValue] == 202) {
            
            [self.view makeToast:@"您的请求有误!" duration:2.0f position:CSToastPositionCenter];
            
        } else if ([json[@"code"] intValue] == 201) {
            [self.view makeToast:@"您的请求有误!" duration:2.0f position:CSToastPositionCenter];
            return;
        }
    } failure:^(NSError *error) {
        
        NSLog(@"请求失败%@", error);
    }];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return _needFrameArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}





@end
