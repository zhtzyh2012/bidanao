//
//  BDInsetLabel.h
//  SuperDesigner
//
//  Created by Julia on 2017/11/8.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDInsetLabel : UILabel

//用于设置Label的内边距
@property(nonatomic) UIEdgeInsets insets;
//初始化方法一
-(id) initWithFrame:(CGRect)frame andInsets: (UIEdgeInsets) insets;
//初始化方法二
-(id) initWithInsets: (UIEdgeInsets) insets;  

@end
