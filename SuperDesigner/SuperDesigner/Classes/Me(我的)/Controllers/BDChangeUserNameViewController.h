//
//  BDChangeUserNameViewController.h
//  SuperDesigner
//
//  Created by Julia on 2017/8/29.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passNickNameDelagate <NSObject>

@optional
-(void)passString:(NSString *)strValues;

@end

@interface BDChangeUserNameViewController : UIViewController

//用户的昵称输入
@property(nonatomic, strong) UITextField *nickName;

//定义一个代理的属性
@property(nonatomic, weak) id<passNickNameDelagate>delegate;

@end
