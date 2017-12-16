//
//  BDMyBudgetViewController.h
//  SuperDesigner
//
//  Created by Julia on 2017/9/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDBaseViewController.h"

@protocol passValueDelagate <NSObject>

@optional

-(void)passValue:(NSString *)strValues;


@end

@interface BDMyBudgetViewController : BDBaseViewController

//金额输入框
@property(nonatomic, strong) UITextField *moneyTextField;


@property(nonatomic, strong)id<passValueDelagate>passDelegate;


@end
