//
//  MyTapGestureRecognizer.h
//  SuperDesigner
//
//  Created by Julia on 2017/12/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadioView;
@interface MyTapGestureRecognizer : UITapGestureRecognizer

@property (strong,nonatomic) RadioView *rv;

@end
