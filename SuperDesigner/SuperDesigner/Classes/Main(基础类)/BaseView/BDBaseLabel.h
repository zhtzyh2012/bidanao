//
//  BDBaseLabel.h
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDBaseLabel : UILabel
-(BDBaseLabel *(^)(CGFloat))BDBorderWidth;//线宽
-(BDBaseLabel *(^)(CGFloat))BDBorderCornderRadius;//圆角
-(BDBaseLabel *(^)(UIColor *))BDBorderColor;//边线颜色
-(BDBaseLabel *(^)(CGFloat))BDTextFont;//字体大小
-(BDBaseLabel *(^)(NSTextAlignment))BDTextAlignment;//居中方式
-(BDBaseLabel *(^)(UIColor *))BDTextColor;//文字颜色
-(BDBaseLabel *(^)(NSString *))BDText;//文字
@end
