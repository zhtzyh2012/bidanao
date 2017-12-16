//
//  BDMyCollectModel.h
//  SuperDesigner
//
//  Created by Julia on 2017/10/27.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BDMyCollectModel : NSObject

//名称
@property(nonatomic, copy) NSString *collectName;

//时间
@property(nonatomic, copy) NSString *collectTime;

//图片一
@property(nonatomic, copy) NSString *collectImageOne;

//图片二
@property(nonatomic, copy) NSString *collectImageTwo;

//图片1的对象
@property (nonatomic,strong) UIImage *firstCollectImage;
//图片2的对象
@property (nonatomic,strong) UIImage *secondCollectImage;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)collectCaseWithDict:(NSDictionary *)dict;

@end










