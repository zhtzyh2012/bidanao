////
////  BDRView.m
////  SuperDesigner
////
////  Created by Julia on 2017/12/13.
////  Copyright © 2017年 Julia. All rights reserved.
////
//
//#import "BDRView.h"
//#import "BDRadioView.h"
//#import "MyTapGestureRecognizer.h"
//
//@interface BDRView()
//@property (strong,nonatomic)NSMutableArray *radioArrayM;/*!< 单选集合 */
//
//@end
//
//@implementation BDRView
///**
//
// *  单选的显示
//
// */
//-(void)setupRadioControl
//
//{
//    if(self.radioArrayM){
//
//        [self.radioArrayM removeAllObjects];
//
//    }
//
//    else{
//
//        self.radioArrayM = [NSMutableArray array];
//
//    }
//    CGSize size = [UIScreen mainScreen].bounds.size;
//    CGFloat w = size.width /self.singleLineNumber;
//    CGFloat h = 40;
//    CGFloat x = 0;
//    CGFloat y = 0;
//    NSInteger num = 0;
//
//    for (NSInteger i =0; i < self.radioTitleArray.count; i++) {
//        NSInteger line = i / self.singleLineNumber;
//        if (num >= self.singleLineNumber) {
//
//            num = 0;
//
//        }
//        x = num * w;
//        y = line * h;
//
//        BDRadioView *rv = [[BDRadioView alloc]initWithFrame:CGRectMake(x, y, w, h)title:self.radioTitleArray[i]];
//
//        MyTapGestureRecognizer *mt = [[MyTapGestureRecognizer alloc]initWithTarget:selfaction:@selector(click:)];
//
//        mt.rv = rv;
//
//        [rv addGestureRecognizer:mt];
//
//
//
//        [self addSubview:rv];
//
//
//
//        [self.radioArrayM addObject:rv];
//
//
//
//        num++;
//
//
//
//        if (i == 0) {
//
//            rv.isSelect = YES;
//
//        }
//
//    }
//
//}
//
//
///**
//
// *  选中和取消选中
//
// */
//
//-(void)click:(MyTapGestureRecognizer *)mt {
//    for (RadioView *rv in self.radioArrayM) {
//
//        if ([rv isEqual:mt.rv]) {
//
//            rv.isSelect = YES;
//
//        }else{
//
//            rv. isSelect = NO;
//
//        }
//    }
//}
//
//
//@end

