//
//  BDChangeUserHeigheViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/8.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDChangeUserHeigheViewController.h"

@interface BDChangeUserHeigheViewController ()

@property(nonatomic, weak) UIView *backView;
@property(nonatomic, strong) UITextField *textTF;

@end

@implementation BDChangeUserHeigheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ThemeGrayColor;
    [self setNav];
    [self setUp];
}


-(void) setUp {
    
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 80, KScreen_WIDTH, 60);
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor whiteColor];
    self.backView = backView;
    
    
    UITextField *textName = [[UITextField alloc] init];
    textName.frame = CGRectMake(20, 3, KScreen_WIDTH - 30 , 50);
    textName.placeholder = @"请输入您的身高(cm)";
    textName.backgroundColor = [UIColor whiteColor];
    textName.keyboardType = UIKeyboardTypePhonePad;
    [self.backView addSubview:textName];
    self.textTF= textName;
    //self.nickName = textName;
    textName.borderStyle = UITextBorderStyleNone;
    textName.font = [UIFont systemFontOfSize:19];
    textName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
}


-(void)setNav {
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftArrow"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickBtn)];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    
    
}

-(void) backClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


-(void) clickBtn {
    
    if (_textTF.text.length == 0) {
        
        [self.view makeToast:@"请输入正确格式!"
                    duration:2.0
                    position:CSToastPositionCenter];
        
    } else {
    
    NSLog(@"修改签名按保存按钮点击了");
    
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSLog(@"这个用户的ID---%@", IDNum);
    NSLog(@"这个用户输入的---%@",  self.textTF.text);
    NSDictionary *dictParams = @{
                                 @"id": IDNum,
                                 @"height" : self.textTF.text
                                 
                                 };
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_changeUserHeight parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            
            NSLog(@"修改上传成功");
            [self.navigationController popViewControllerAnimated:YES];
            
        } if ([json[@"code"] intValue] == 202) {
            
            NSLog(@"异常===");
            
        } if ([json[@"code"] intValue] == 201) {
            
            NSLog(@"空的参数");
            
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"修改上传失败");
    }];
    }
}


@end
