//
//  BDMyNeedFrame.h
//  SuperDesigner
//
//  Created by Julia on 2017/11/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BDMyNeedModel;

@interface BDMyNeedFrame : NSObject

@property(nonatomic, strong) BDMyNeedModel *myNeed;
//建筑名称
@property(nonatomic, assign) CGRect buildNameFrame;

//建筑发布时间
@property(nonatomic, assign) CGRect releaseTimeLabelFrame;

//建筑的日期
@property(nonatomic, assign) CGRect releaseTimeDateLabelFrame;

//横线
@property(nonatomic, assign) CGRect splitLineFrame;

//标签类型
@property(nonatomic, assign) CGRect typeLabelFrame;

//预算
@property(nonatomic, assign) CGRect budgetMoneyFrame;

//招标的标签
@property(nonatomic, assign) CGRect callbidsLabelFrame;

//行高
@property (nonatomic,assign) CGFloat rowHeightFrame;



@end
