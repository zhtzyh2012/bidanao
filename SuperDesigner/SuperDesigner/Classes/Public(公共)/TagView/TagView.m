
//
//  TagView.m
//  demo
//
//  Created by macbook on 17/11/22.
//  Copyright © 2017年 buWangChuXing. All rights reserved.
//

#import "TagView.h"

#define HORIZONTAL_PADDING 7.0f
#define VERTICAL_PADDING   3.0f
#define LABEL_MARGIN       10.0f
#define BOTTOM_MARGIN      10.0f//边距
@interface TagView ()


@end

@implementation TagView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        totalHeight=0;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        totalHeight=0;
        
    }
    return self;
}


-(void)setTagWithTagArray:(NSArray*)arr andWith:(CGFloat)with{
    
    previousFrame = CGRectZero;
    
    for (int i = 0; i < arr.count; i++) {
        UILabel*tag=[[UILabel alloc]initWithFrame:CGRectZero];
        
        if(i == 0)
        {
            tag.backgroundColor= ThemelightBlueColor;
            
        }else
        {
            tag.backgroundColor= ThemelightBlueColor;
        }
        
        tag.textAlignment=NSTextAlignmentCenter;
        tag.textColor=ThemeBlueColor;
        tag.font=[UIFont boldSystemFontOfSize:14];
        tag.text=arr[i];
        NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
        CGSize Size_str=[arr[i] sizeWithAttributes:attrs];
        tag.layer.cornerRadius =  VERTICAL_PADDING * 2 + 4;
        tag.clipsToBounds=YES;
        
        Size_str.width += HORIZONTAL_PADDING*2;
        Size_str.height += VERTICAL_PADDING*2;
        
        
        CGRect newRect = CGRectZero;
        
        
        //换行
        if (previousFrame.origin.x + previousFrame.size.width + Size_str.width + LABEL_MARGIN > with) {
            newRect.origin = CGPointMake(10, previousFrame.origin.y + Size_str.height + BOTTOM_MARGIN);
            totalHeight +=Size_str.height + BOTTOM_MARGIN;
            
        }
        else {
            
            newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + LABEL_MARGIN, previousFrame.origin.y);
        }
        newRect.size = Size_str;
        [tag setFrame:newRect];
        previousFrame=tag.frame;
        [self addSubview:tag];
        
        
    }
    
}




@end


////
////  TagView.m
////  demo
////
////  Created by macbook on 17/11/22.
////  Copyright © 2017年 buWangChuXing. All rights reserved.
////
//
//#import "TagView.h"
//
//#define HORIZONTAL_PADDING 7.0f
//#define VERTICAL_PADDING   3.0f
//#define LABEL_MARGIN       10.0f
//#define BOTTOM_MARGIN      10.0f
//@interface TagView ()
//
//
//@end
//
//@implementation TagView
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        totalHeight=0;
//        self.frame=frame;
//    }
//    return self;
//}
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//
//        totalHeight=0;
//    }
//    return self;
//}
//
////
////-(void)setTagWithTagArray:(NSArray*)arr{
////
////    previousFrame = CGRectZero;
//////    [arr enumerateObjectsUsingBlock:^(NSString*str, NSUInteger idx, BOOL *stop) {
//////        UILabel*tag=[[UILabel alloc]initWithFrame:CGRectZero];
//////        if(_signalTagColor){
//////            //可以单一设置tag的颜色
//////            tag.backgroundColor=_signalTagColor;
//////            //tag.backgroundColor = [UIColor redColor];
//////
//////        }else{
//////            //tag颜色多样
//////            //tag.backgroundColor=[UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
//////            tag.backgroundColor = rgb(192, 226, 254);
//////        }
//////        tag.textAlignment=NSTextAlignmentCenter;
//////        tag.textColor=rgb(36, 147, 236);
//////        tag.font=[UIFont boldSystemFontOfSize:15];
//////        tag.text=str;
//////        tag.layer.cornerRadius=10;
//////        tag.clipsToBounds=YES;
//////        NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
//////        CGSize Size_str=[str sizeWithAttributes:attrs];
//////        Size_str.width += HORIZONTAL_PADDING*2;
//////        Size_str.height += VERTICAL_PADDING*2;
//////        CGRect newRect = CGRectZero;
//////        if (previousFrame.origin.x + previousFrame.size.width + Size_str.width + LABEL_MARGIN > self.bounds.size.width) {
//////            newRect.origin = CGPointMake(10, previousFrame.origin.y + Size_str.height + BOTTOM_MARGIN);
//////            totalHeight +=Size_str.height + BOTTOM_MARGIN;
//////        }
//////        else {
//////            newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + LABEL_MARGIN, previousFrame.origin.y);
//////        }
//////        newRect.size = Size_str;
//////        [tag setFrame:newRect];
//////        previousFrame=tag.frame;
//////        [self setHight:self andHight:totalHeight+Size_str.height + BOTTOM_MARGIN];
//////        [self addSubview:tag];
//////    }
//////     ];
////
////    for (int i = 0; i < arr.count; i++) {
////        UILabel*tag=[[UILabel alloc]initWithFrame:CGRectZero];
////
////        if(i == 0)
////        {
////
////            NSLog(@"jin");
////            tag.backgroundColor= [UIColor yellowColor];
////
////        }else
////        {
////            NSLog(@"-----------");
////            tag.backgroundColor= [UIColor blueColor];
////        }
////
////        tag.textAlignment=NSTextAlignmentCenter;
////        tag.textColor=[UIColor whiteColor];
////        tag.font=[UIFont boldSystemFontOfSize:15];
////        tag.text=arr[i];
////        tag.layer.cornerRadius=5;
////        tag.clipsToBounds=YES;
////        NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
////        CGSize Size_str=[arr[i] sizeWithAttributes:attrs];
////        Size_str.width += HORIZONTAL_PADDING*2;
////        Size_str.height += VERTICAL_PADDING*2;
////        CGRect newRect = CGRectZero;
////        if (previousFrame.origin.x + previousFrame.size.width + Size_str.width + LABEL_MARGIN > self.bounds.size.width) {
////            newRect.origin = CGPointMake(10, previousFrame.origin.y + Size_str.height + BOTTOM_MARGIN);
////            totalHeight +=Size_str.height + BOTTOM_MARGIN;
////        }
////        else {
////            newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + LABEL_MARGIN, previousFrame.origin.y);
////        }
////        newRect.size = Size_str;
////        [tag setFrame:newRect];
////        previousFrame=tag.frame;
////        [self setHight:self andHight:totalHeight+Size_str.height + BOTTOM_MARGIN];
////        [self addSubview:tag];
////
////
////    }
////    if(_GBbackgroundColor){
////        self.backgroundColor=_GBbackgroundColor;
////    }else{
////        self.backgroundColor=[UIColor whiteColor];
////    }
////}
//
//
//-(void)setTagWithTagArray:(NSArray*)arr{
//
//    previousFrame = CGRectZero;
//    [arr enumerateObjectsUsingBlock:^(NSString*str, NSUInteger idx, BOOL *stop) {
//        UILabel*tag=[[UILabel alloc]initWithFrame:CGRectZero];
//        if(_signalTagColor){
//            //可以单一设置tag的颜色
//            tag.backgroundColor=_signalTagColor;
//            //tag.backgroundColor = [UIColor redColor];
//
//        }else{
//            //tag颜色多样
//            //tag.backgroundColor=[UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
//            tag.backgroundColor = rgb(192, 226, 254);
//        }
//        tag.textAlignment=NSTextAlignmentCenter;
//        tag.textColor=rgb(36, 147, 236);
//        tag.font=[UIFont boldSystemFontOfSize:15];
//        tag.text=str;
//        tag.layer.cornerRadius=10;
//        tag.clipsToBounds=YES;
//        NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
//        CGSize Size_str=[str sizeWithAttributes:attrs];
//        Size_str.width += HORIZONTAL_PADDING*2;
//        Size_str.height += VERTICAL_PADDING*2;
//        CGRect newRect = CGRectZero;
//        if (previousFrame.origin.x + previousFrame.size.width + Size_str.width + LABEL_MARGIN > self.bounds.size.width) {
//            newRect.origin = CGPointMake(10, previousFrame.origin.y + Size_str.height + BOTTOM_MARGIN);
//            totalHeight +=Size_str.height + BOTTOM_MARGIN;
//        }
//        else {
//            newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + LABEL_MARGIN, previousFrame.origin.y);
//        }
//        newRect.size = Size_str;
//        [tag setFrame:newRect];
//        previousFrame=tag.frame;
//        [self setHight:self andHight:totalHeight+Size_str.height + BOTTOM_MARGIN];
//        [self addSubview:tag];
//    }
//     ];
//    if(_GBbackgroundColor){
//        self.backgroundColor=_GBbackgroundColor;
//    }else{
//        self.backgroundColor=[UIColor whiteColor];
//    }
//}
//
//
//#pragma mark-改变控件高度
//- (void)setHight:(UIView *)view andHight:(CGFloat)hight
//{
//    CGRect tempFrame = view.frame;
//    tempFrame.size.height = hight;
//    view.frame = tempFrame;
//}
//
//
//
//@end

