//
//  BDProfileHeadView.h
//  SuperDesigner
//
//  Created by Julia on 2017/6/14.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BDProfileHeadViewDelegate <NSObject>

@optional
-(void)headViewBtnClick;

@end

@interface BDProfileHeadView : UIView


//声明一个代理方法
@property(nonatomic, weak)id<BDProfileHeadViewDelegate>delegate;



@end
