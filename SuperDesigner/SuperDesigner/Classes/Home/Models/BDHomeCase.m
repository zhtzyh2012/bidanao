//
//  BDHomeCase.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/18.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeCase.h"

@implementation BDHomeCase


-(instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return  self;
    
}

+(instancetype)homeCaseWithDict:(NSDictionary *)dict {
    
    return [[self alloc ] initWithDict:dict];
    
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}




@end
