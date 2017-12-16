//
//  BDHomeSendRequireViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/7.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeSendRequireViewController.h"
#import "BDSingeNameTableViewCell.h"

@interface BDHomeSendRequireViewController ()<UITableViewDelegate, UITableViewDataSource>
//初始化一个tableView
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation BDHomeSendRequireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableView];
    [self setNav];
    [self sendNeesNetWorkFunc];
    
    
}

#pragma mark -- 发需求网络请求
-(void) sendNeesNetWorkFunc {
    
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSLog(@"这个用户的ID---%@", IDNum);
    NSDictionary *dictParams = @{
                                 @"id": IDNum,
                                 @"xmjs" : @"北京比大脑网络科技有限公司",
                                 @"jzmj" :@"2000",
                                 @"xmys" :@"300000",
                                 @"address" :@"北京上地七街",
                                 @"jztime" : @"2018-9-10",
                                 @"other" : @"要求尽快完成",
                                 @"more" : @"保证质量",
                                 @"cgjf" : @"项目设计图纸",
                                 @"zysx" : @"注意申请时候资料完整",
                                 @"zbwj" : @"这是招标文件",
                                 
                                 
                                 };
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_sendNeed parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"首页数据请求成功200");
            
            
        } else if ([json[@"code"] intValue] == 201) {
            
            [self.view makeToast:@"请检查网络" duration:2.0f position:CSToastPositionCenter];
            return;
        }
    } failure:^(NSError *error) {
            NSLog(@"首页数据请求失败%@", error);
    }];
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
    
    return 60;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"sendRequireId";
    BDSingeNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell) {
        cell = [[BDSingeNameTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    //cell.textLabel.text = @"发需求的页面...";
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    
}

@end







































