//
//  BDCommitViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/28.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDCommitViewController.h"

@interface BDCommitViewController ()<UIWebViewDelegate>

@property(nonatomic, weak) UIWebView *webView;

@end

@implementation BDCommitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发现";
    [self setUpUI];
    
}

-(void) setUpUI {
    
    UIWebView* webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.webView = webView;
    webView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:webView];
    NSURL* url = [NSURL URLWithString:@"http://123.56.183.204:8080/designer/judge.html"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [webView loadRequest:request];//加载
    self.webView.delegate = self;
    
    
    
    
}



@end
