//
//  BDUserSingViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/16.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDUserSingViewController.h"

@interface BDUserSingViewController ()

@property(nonatomic, weak) UIView *backView;
@property(nonatomic, strong) UITextField *textSingField;

@end

@implementation BDUserSingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickBtn)];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    [self setUpUI];
    
    
}

-(void) setUpUI {

    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 80, KScreen_WIDTH, 60);
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor whiteColor];
    self.backView = backView;


    UITextField *textName = [[UITextField alloc] init];
    textName.frame = CGRectMake(20, 3, KScreen_WIDTH - 30 , 50);
    textName.placeholder = @"请输入您的个性签名";
    textName.backgroundColor = [UIColor whiteColor];
    [self.backView addSubview:textName];
    self.textSingField= textName;
    //self.nickName = textName;
    textName.borderStyle = UITextBorderStyleNone;
    textName.font = [UIFont systemFontOfSize:19];
    textName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
}

-(void) clickBtn {
    
    NSLog(@"修改签名按保存按钮点击了");
    //NSString *url = @"http://192.168.1.5:8080/sjs_webserver/updatesign";
    
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSLog(@"这个用户的ID---%@", IDNum);
    NSLog(@"这个用户输入的签名---%@",  self.textSingField.text);
    NSDictionary *dictParams = @{
                                 @"id": IDNum,
                                 @"sign" : self.textSingField.text
                                 
                                 };
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_changeUserSing parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            
            NSLog(@"签名修改上传成功");
            [self.navigationController popViewControllerAnimated:YES];
            
        } if ([json[@"code"] intValue] == 202) {
            
            NSLog(@"异常===");
            
        } if ([json[@"code"] intValue] == 201) {
            
            NSLog(@"空的参数");
            
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"签名修改上传失败");
    }];
}

@end























