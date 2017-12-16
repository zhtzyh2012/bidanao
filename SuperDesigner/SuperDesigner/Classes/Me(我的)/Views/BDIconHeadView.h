//
//  BDIconHeadView.h
//  SuperDesigner
//
//  Created by Julia on 2017/9/4.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BDIconHeadViewDelegate <NSObject>

@optional
-(void)iconButtonClick;


- (void)pushPickControllerWithSourCeType:(UIImagePickerController *)imagePickerController;

@end

@interface BDIconHeadView : UIView

//声明一个代理方法
@property(nonatomic, weak)id<BDIconHeadViewDelegate>delegate;

@end
