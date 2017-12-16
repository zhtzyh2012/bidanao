////
////  TagView.h
////  demo
////
////  Created by macbook on 17/11/22.
////  Copyright © 2017年 buWangChuXing. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//
//@interface TagView : UIView{
//
//    CGRect previousFrame ;
//    int totalHeight ;
//}
///**
// * 整个view的背景色
// */
//@property(nonatomic,retain)UIColor*GBbackgroundColor;
///**
// *  设置单一颜色
// */
//@property(nonatomic)UIColor*signalTagColor;
///**
// *  标签文本赋值
// */
//-(void)setTagWithTagArray:(NSArray*)arr;
//
//@end
//
//
//
//
//
//

//
//  TagView.h
//  demo
//
//  Created by macbook on 17/11/22.
//  Copyright © 2017年 buWangChuXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagView : UIView{
    
    CGRect previousFrame ;
    int totalHeight ;
}

/**
 *  标签文本赋值
 */

-(void)setTagWithTagArray:(NSArray*)arr andWith:(CGFloat)with;

@end

















