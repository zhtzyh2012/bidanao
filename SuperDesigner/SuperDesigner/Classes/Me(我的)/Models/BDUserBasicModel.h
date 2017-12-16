//
//  BDUserBasicModel.h
//  SuperDesigner
//
//  Created by Julia on 2017/12/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDUserBasicModel : NSObject

//用户的id_number
@property(nonatomic, copy) NSString *id_number;
//用户的地区
@property(nonatomic, copy) NSString *area;
//用户的id
@property(nonatomic, copy) NSString *id;
//用户的状态角色
@property(nonatomic, copy) NSString *user_state;
//用户的昵称
@property(nonatomic, copy) NSString *username;
//用户的签名
@property(nonatomic, copy) NSString *sign;
//用户的电话
@property(nonatomic, copy) NSString *phonenum;



//写一个对象方法
-(instancetype) initWithDict:(NSDictionary *)dict;
//一个类方法
+(instancetype) attentionListWithDict:(NSDictionary *)dict;

@end



























