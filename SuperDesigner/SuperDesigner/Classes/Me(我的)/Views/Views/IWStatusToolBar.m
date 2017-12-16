////
////  IWStatusToolBar.m
////  WeiBo17
////
////  Created by teacher on 15/8/22.
////  Copyright (c) 2015年 itcast. All rights reserved.
////
//
//#import "IWStatusToolBar.h"
////#import "IWStatus.h"
//
//
//typedef NS_ENUM(NSUInteger, IWStatusToolBarBtnType) {
//    IWStatusToolBarBtnTypeRetweet = 1001,
//    IWStatusToolBarBtnTypeComment = 1002,
//    IWStatusToolBarBtnTypeAttitude = 1003,
//};
//
//
//@interface IWStatusToolBar()
//
////懒加载的话,属性用strong
//@property (nonatomic, strong) NSMutableArray *spliteLines;
//
//@property (nonatomic, strong) NSMutableArray *buttons;
//
//@end
//
//
//
//
//@implementation IWStatusToolBar
//
//- (NSMutableArray *)spliteLines{
//    if (!_spliteLines) {
//        _spliteLines = [NSMutableArray array];
//    }
//    return _spliteLines;
//}
//
//
//- (NSMutableArray *)buttons{
//    if (!_buttons) {
//        _buttons = [NSMutableArray array];
//    }
//    return _buttons;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//        //添加两条分割线
//        [self addSpliteLine];
//        [self addSpliteLine];
//
//        //添加三个按钮
//        [self addChildButtonWithImageName:@"collect_default" title:@"转发" type:IWStatusToolBarBtnTypeRetweet];
//        [self addChildButtonWithImageName:@"collect_default" title:@"评论" type:IWStatusToolBarBtnTypeComment];
//        [self addChildButtonWithImageName:@"collect_default" title:@"赞" type:IWStatusToolBarBtnTypeAttitude];
//
//
//    }
//    return self;
//}
//
//- (void)layoutSubviews{
//    [super layoutSubviews];
//
//    NSLog(@"%@",self.buttons);
//    //计算button
//    NSInteger count = self.buttons.count;
//    //按钮的宽度
//    CGFloat childW = self.width / self.buttons.count;
//
//    for (int i=0; i<count; i++) {
//        UIView *childView = self.buttons[i];
//        
//        //设置大小
//        childView.width = childW;
//        childView.height = self.height;
//
//        //设置x
//        childView.x = childW * i;
//
//    }
//    //计算分割线
//    for (int i=0; i<self.spliteLines.count; i++) {
//        UIView *childView = self.spliteLines[i];
//
//        childView.x = (i + 1) *childW - childView.width * 0.5;
//
//    }
//
//}
//
//
//- (void)addSpliteLine{
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
//    [self addSubview:imageView];
//    [self.spliteLines addObject:imageView];
//}
//
//
////具体添加按钮的逻辑
//- (void)addChildButtonWithImageName:(NSString *)name title:(NSString *)title type:(IWStatusToolBarBtnType)type{
//    UIButton *button = [[UIButton alloc] init];
//
//    button.tag = type;
//
//    //设置背景图片
//    [button setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateHighlighted];
//    [button setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background"] forState:UIControlStateNormal];
//
//
//    //设置图片
//    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
//    //文字
//    [button setTitle:title forState:UIControlStateNormal];
//    //文字颜色
//    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    //设置
//    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
//
//    [self insertSubview:button atIndex:0];
////    [self addSubview:button];
//
//    [self.buttons addObject:button];
//
//
//}
////
////- (void)setStatus:(IWStatus *)status{
////    _status = status;
////
////    //设置每一个按钮的值
////
////
////    [self setTitleWithButton:[self viewWithTag:IWStatusToolBarBtnTypeRetweet] count:status.reposts_count defaultTitle:@"转发"];
////    [self setTitleWithButton:[self viewWithTag:IWStatusToolBarBtnTypeComment] count:status.comments_count defaultTitle:@"评论"];
////    [self setTitleWithButton:[self viewWithTag:IWStatusToolBarBtnTypeAttitude] count:status.attitudes_count defaultTitle:@"赞"];
////
////
//////    //先设置转发微博的内容
//////    UIButton *button = (UIButton *)[self viewWithTag:IWStatusToolBarBtnTypeRetweet];
//////
//////
//////    NSInteger count = status.reposts_count;
//////
//////    if (count) {
//////        //如果小于10000.直接显示数量
//////        if (count<10000) {
//////            [button setTitle:[NSString stringWithFormat:@"%zd",count] forState:UIControlStateNormal];
//////        }else{
//////            //20900--2.3
//////            NSInteger result = count/1000.0;
//////
//////            //20--
//////            NSString *resultStr = [NSString stringWithFormat:@"%.1f万",result/10.0];
//////
//////            //如果发现字符串后面是以0结尾的话,就直接去掉小数,否则显示小数
//////            if ([resultStr hasSuffix:@".0万"]) {
//////                resultStr = [resultStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
//////            }
//////            [button setTitle:resultStr forState:UIControlStateNormal];
//////        }
//////    }else{
//////        [button setTitle:@"转发" forState:UIControlStateNormal];
//////    }
////}
////
////
////- (void)setTitleWithButton:(UIView *)button count:(NSInteger)count defaultTitle:(NSString *)defaultTitle{
////    //先设置转发微博的内容
////
////    UIButton *btn = (UIButton *)button;
////
////    if (count) {
////        //如果小于10000.直接显示数量
////        if (count<10000) {
////            [btn setTitle:[NSString stringWithFormat:@"%zd",count] forState:UIControlStateNormal];
////        }else{
////            //20900--2.3
////            NSInteger result = count/1000.0;
////
////            //20--
////            NSString *resultStr = [NSString stringWithFormat:@"%.1f万",result/10.0];
////
////            //如果发现字符串后面是以0结尾的话,就直接去掉小数,否则显示小数
////            if ([resultStr hasSuffix:@".0万"]) {
////                resultStr = [resultStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
////            }
////            [btn setTitle:resultStr forState:UIControlStateNormal];
////        }
////    }else{
////        [btn setTitle:defaultTitle forState:UIControlStateNormal];
////    }
////}
//
//
//
//@end

