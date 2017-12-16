//
//  BDRView.h
//  SuperDesigner
//
//  Created by Julia on 2017/12/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDRView : UIView

@property (strong,nonatomic)NSArray *radioTitleArray; /*!< 单选文字的内容 */

@property (assign,nonatomic)NSInteger singleLineNumber; /*!< 一行显示的数量 */

-(void)setupRadioControl;

@end
