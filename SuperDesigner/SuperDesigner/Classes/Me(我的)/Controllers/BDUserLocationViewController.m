//
//  BDUserLocationViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/15.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDUserLocationViewController.h"

#import "CityPickerVeiw.h"
#import "CityNameModel.h" //省市区模型
#import "ZSAnalysisClass.h"  // 数据转模型类

@interface BDUserLocationViewController ()

@property(nonatomic, strong) UIButton *areaButton;
@end

@implementation BDUserLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择地区";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickBtn)];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    UIButton * releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:releaseBtn];
    releaseBtn.frame=CGRectMake(0, 0, self.view.frame.size.width/2, 30);
    [releaseBtn setTitle:@"请点击选择地区" forState:UIControlStateNormal];
    releaseBtn.backgroundColor= [UIColor whiteColor];
    [releaseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [releaseBtn addTarget:self action:@selector(releaseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
     releaseBtn.center=self.view.center;
    [releaseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 50));
        
    }];
    releaseBtn.layer.masksToBounds = YES;
    releaseBtn.layer.cornerRadius = 5;
    self.areaButton = releaseBtn;
    
   
}

- (void)releaseBtnClick:(UIButton *)btn {

    CityPickerVeiw * cityView = [[CityPickerVeiw alloc] init];
    [cityView show];
    cityView.showSelectedCityNameStr=btn.titleLabel.text;
    [cityView setCityBlock:^(NSString * value) {
        [btn setTitle:value forState:UIControlStateNormal];
        self.areaButton.titleLabel.text = value;
    }];
    
    NSLog(@"%@",btn.titleLabel.text);
    
}

-(void) clickBtn {
    
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSLog(@"这个用户的ID---%@", IDNum);
    NSLog(@"这个用户的label---%@",  self.areaButton.titleLabel.text);
    NSDictionary *dictParams = @{
                                 @"id": IDNum,
//                                 @"area" : self.areaButton.titleLabel.text
                                 
                                 @"area" : @"北京市-海淀区-中关村"
                                 
                                 };
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_chenkUserBasicInfo parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            
            NSLog(@"地区修改上传成功..");
            
            [self.navigationController popViewControllerAnimated:YES];
            
        } if ([json[@"code"] intValue] == 202) {
            
            NSLog(@"异常===");
            
        } if ([json[@"code"] intValue] == 201) {
            
            NSLog(@"空的参数");
            
        }
             
    } failure:^(NSError *error) {
        
            NSLog(@"地区修改上传失败");
    }];
        
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
