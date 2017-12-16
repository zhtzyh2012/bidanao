//
//  BDHomeCase.h
//  SuperDesigner
//
//  Created by Julia on 2017/8/18.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDHomeCase : NSObject


//找设计师
@property(nonatomic, copy) NSString *findDesignerLabel;

//预算label
@property(nonatomic, copy) NSString *budgetLabel;

//预算金额
@property(nonatomic, copy) NSString *budgetLabelNum;

//需求label
@property(nonatomic, copy) NSString *demandLabel;

//需求编号
@property(nonatomic, copy) NSString *demandLabelNum;

//时间label
@property(nonatomic, copy) NSString *timeLabel;

//描述label
@property(nonatomic, copy) NSString *desLabel;

//多少人查看数量
@property(nonatomic, copy) NSString *checkNum;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)homeCaseWithDict:(NSDictionary *)dict;

@end
