//
//  BDMyAttentionModel.h
//  SuperDesigner
//
//  Created by Julia on 2017/10/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BDMyAttentionModel : NSObject

//设计师的图像 图片
@property(nonatomic, copy) NSString *designerIcon;
//设计师的姓名
@property(nonatomic, copy) NSString *designerName;
//设计师排名等级 图片
@property(nonatomic, copy) NSString *designerRank;
//设计师评分
@property(nonatomic, copy) NSString *designerScor;
//设计师风格
@property(nonatomic, copy) NSString *designerStyle;
//设计师粉丝
@property(nonatomic, copy) NSString *designerFans;
//设计师服务次数
@property(nonatomic, copy) NSString *designerSevCount;

//设计师图像对象
@property(nonatomic, strong) UIImage *iconImg;
//设计师等级图片
@property(nonatomic, strong) UIImage *rankImage;


//写一个对象方法
-(instancetype) initWithDict:(NSDictionary *)dict;
//一个类方法
+(instancetype) attentionListWithDict:(NSDictionary *)dict;

@end





