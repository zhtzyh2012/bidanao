//
//  BDRadioView.h
//  SuperDesigner
//
//  Created by Julia on 2017/12/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDRadioView : UIView
@property (assign,nonatomic)BOOL isSelect; /*!<是否选中 */


-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;

@end
