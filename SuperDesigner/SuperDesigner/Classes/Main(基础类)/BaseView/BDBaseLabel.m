//
//  BDBaseLabel.m
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDBaseLabel.h"

@implementation BDBaseLabel
//-(CGSize)intrinsicContentSize{
//    CGSize originalSize = [super intrinsicContentSize];
//    CGSize size = CGSizeMake(originalSize.width+8, originalSize.height);
//    return size;
//}
//-(BDBaseLabel *(^)(CGFloat))BDBorderWidth{
//    BDBaseLabel * (^borderWidthBlock)() = ^(CGFloat borderW){
//        
//        self.layer.borderWidth = borderW;
//        return self;
//    };
//    
//    return borderWidthBlock;
//}

-(BDBaseLabel *(^)(UIColor *))BDBorderColor{
    return ^(UIColor * Color){
        self.layer.borderColor = Color.CGColor;
        return self;
    };
}
-(BDBaseLabel *(^)(CGFloat))BDBorderCornderRadius{
    return ^(CGFloat borderRadius){
        self.layer.cornerRadius = borderRadius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
-(BDBaseLabel *(^)(CGFloat))BDTextFont{
    return ^(CGFloat labelFont){
        self.font = [UIFont systemFontOfSize:labelFont];
        return self;
    };
}
-(BDBaseLabel *(^)(NSTextAlignment ))BDTextAlignment{
    return ^(NSTextAlignment  BDAlignment){
        self.textAlignment = BDAlignment;
        return self;
    };
}
-(BDBaseLabel *(^)(UIColor *))BDTextColor{
    return ^(UIColor * BDtextsColor){
        self.textColor = BDtextsColor;
        return self;
    };
}
-(BDBaseLabel *(^)(NSString *))BDText{
    return ^(NSString * BDTexts){
        self.text = BDTexts;
        return self;
    };
}

@end
