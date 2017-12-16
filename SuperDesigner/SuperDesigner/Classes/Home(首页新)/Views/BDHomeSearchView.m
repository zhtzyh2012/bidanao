//
//  BDHomeSearchView.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/4.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeSearchView.h"

@interface BDHomeSearchView()

@end

@implementation BDHomeSearchView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        [self setUpUI];
    }
    return self;
}

-(void) setUpUI {
    
    //self.frame = CGRectMake(0, 0, KScreen_WIDTH- 80, 40);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-80);
        make.height.mas_equalTo(40);
    }];
    self.backgroundColor = [UIColor orangeColor];
    
    //1.搜索框
    UITextField *textField = [[UITextField alloc] init];
    //textField.frame = self.frame;
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(self).offset(100);
        make.left.equalTo(self).offset(40);
        make.right.equalTo(self).offset(-80);
        make.height.mas_equalTo(40);
    }];
    [self addSubview:textField];
    //textField.backgroundColor = [UIColor redColor];
    textField.placeholder = @"搜索项目 设计师 工程商 建材";
    
    
}


@end



























