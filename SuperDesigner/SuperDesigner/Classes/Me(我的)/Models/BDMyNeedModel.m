//
//  BDMyNeedModel.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyNeedModel.h"

@implementation BDMyNeedModel

//对象方法
-(instancetype) initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}

//类方法
+(instancetype) needsWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

@end
