//
//  BDChangeUserNameViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/29.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDChangeUserNameViewController.h"

@interface BDChangeUserNameViewController ()

@property(nonatomic, weak) UIView *backView;

@end

@implementation BDChangeUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"昵称";
    
    self.view.backgroundColor = rgb(245, 245, 246);
    [self setUpUI];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickBtn)];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
}



-(void) setUpUI {
    
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 100, KScreen_WIDTH, 60);
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor whiteColor];
    self.backView = backView;
    
    
    UITextField *textName = [[UITextField alloc] init];
    textName.frame = CGRectMake(20, 3, KScreen_WIDTH - 30 , 50);
    textName.placeholder = @"请输入要昵称";
    textName.backgroundColor = [UIColor whiteColor];
    [self.backView addSubview:textName];
    self.nickName = textName;
    
    textName.borderStyle = UITextBorderStyleNone;
    textName.font = [UIFont systemFontOfSize:19];
    textName.clearButtonMode = UITextFieldViewModeWhileEditing;
    NSLog(@"输入的内容%@",  self.nickName.text);
    
}


-(void) clickBtn {
    
//    if(self.nickName.text.length == 0) {
//
//        [self.view makeToast:@"请您输入要修改的内容!"
//                    duration:2.0
//                    position:CSToastPositionCenter];
//
//    }
    [self networkFunc];
    
}

-(void) networkFunc {
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    
    NSDictionary *dictParams = @{
                                 @"id": IDNum,
                                 @"username" :self.nickName.text
                                 
                                 };
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_changeUserNickName parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            
            [self.navigationController popViewControllerAnimated:YES];
        } else if ([json[@"code"] intValue] == 201) {
            NSLog(@"空的参数");
        } else if([json[@"code"] intValue] == 202) {
            NSLog(@"系统异常");
        }
    } failure:^(NSError *error) {
        NSLog(@"请求失败--->%@", error);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





































