//
//  BDNCase.m
//  NewWind
//
//  Created by Julia on 16/10/28.
//  Copyright © 2016年 Julia. All rights reserved.
//

#import "BDNCase.h"

@implementation BDNCase

-(UIImage *) image {
    
    if (_image == nil) {
        
    _image = [UIImage imageNamed:self.icon];
            
    }
    return _image;
}

-(UIImage *)sexImage {
    if (_sexImage == nil) {
        _sexImage = [UIImage imageNamed:self.sex];
        
    }
    return _sexImage;
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return  self;
    
}

+(instancetype)caseWithDict:(NSDictionary *)dict {

    return [[self alloc ] initWithDict:dict];
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}


@end
