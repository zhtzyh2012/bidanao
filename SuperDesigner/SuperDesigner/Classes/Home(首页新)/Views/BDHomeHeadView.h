//
//  BDHomeHeadView.h
//  SuperDesigner
//
//  Created by Julia on 2017/11/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BDHomeHeadViewDelegate <NSObject>
@optional
//找项目
-(void)homeFindProjectClick;
//找工程商
-(void)homeFindConstructionClick;
//找设计
-(void)homeFindDesignerClick;
//找建材
-(void)homeFindConsMaterialClick;

@end

@interface BDHomeHeadView : UIView
//声明一个代理方法
@property(nonatomic, weak) id<BDHomeHeadViewDelegate>delegate;

@end
