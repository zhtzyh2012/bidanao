//
//  BDUserBasicModel.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDUserBasicModel.h"

@implementation BDUserBasicModel
//写一个对象方法
-(instancetype) initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}

//一个类方法
+(instancetype) attentionListWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

-(void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
