//
//  BDStatusToolBar.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/19.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDStatusToolBar.h"
#import "UIView+Extension.h"

//给按钮来一个tag值
typedef NS_ENUM(NSUInteger, BDStatusToolBarBtnType) {
    
    BDStatusToolBarBtnTypeCollect = 1001,
    BDStatusToolBarBtnTypeCommit = 1002,
    BDStatusToolBarBtnTypeShare = 1003,
    
    
};

@interface BDStatusToolBar()

//几个按钮
@property(nonatomic ,strong) NSMutableArray *buttons;

@end

@implementation BDStatusToolBar

-(NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
            
    }
    return _buttons;
}


//初始化添加控件
-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //添加三个按钮
        [self addButtonsWithImageName:@"collect_default" title:@"收藏" type:BDStatusToolBarBtnTypeCollect];
        [self addButtonsWithImageName:@"commit_default" title:@"评论" type:BDStatusToolBarBtnTypeCommit];
        [self addButtonsWithImageName:@"retweet_default" title:@"分享" type:BDStatusToolBarBtnTypeShare];
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"%@",self.buttons);
    //计算button
    NSInteger count = self.buttons.count;
    //按钮的宽度
    CGFloat childW = self.width / self.buttons.count;
    
    for (int i=0; i<count; i++) {
        UIView *childView = self.buttons[i];
        
        //设置大小
        childView.width = childW;
        childView.height = self.height;
        
        //设置x
        childView.x = childW * i;
        
    }
}


//添加按钮
-(void) addButtonsWithImageName:(NSString *)name title:(NSString *)title type:(BDStatusToolBarBtnType)type {
    
    //先初始化一个按钮
    UIButton *button = [[UIButton alloc] init];
    button.tag = type;
    //设置背景图片
//    [button setBackgroundImage:[UIImage imageNamed:@"collect_default"] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"collect_selected"] forState:UIControlStateHighlighted];
    
    //设置图片
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    //[button setImage:[UIImage imageNamed:name] forState:UIControlStateHighlighted];
    //设置文字
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self insertSubview:button atIndex:0];
    
    [self.buttons addObject:button];
    
    
}

@end











































