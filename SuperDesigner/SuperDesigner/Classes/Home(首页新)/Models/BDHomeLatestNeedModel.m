//
//  BDHomeLatestNeedModel.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/12.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeLatestNeedModel.h"

@implementation BDHomeLatestNeedModel

-(UIImage *)iconImage {
    
    if (_iconImage == nil) {
        _iconImage = [UIImage imageNamed:self.img_head];
    }
    return _iconImage;
    
}

-(void)setJztime:(NSString *)jztime {
    
    _jztime = jztime;
    
    //jztime = @"Jan 1, 1970 12:00:01 AM";
    jztime = @"Jan 1 2017 12:00:01";
    NSLog(@"这是时间---->%@", jztime);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //代表怎么去解析读取这个时间   MMM dd yyyy HH:mm:ss
    formatter.dateFormat = @"MMM dd yyyy HH:mm:ss";
    NSDate *date = [formatter dateFromString:jztime];
    formatter.dateFormat = @"yyyy-MM-dd";
    _jztime = [formatter stringFromDate:date];

    
}


-(instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return  self;
    
}
+(instancetype)needWithDict:(NSDictionary *)dict {
    
    return [[self alloc ] initWithDict:dict];
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}



@end







































































