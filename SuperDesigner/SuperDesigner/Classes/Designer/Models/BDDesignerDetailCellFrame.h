//
//  BDDesignerDetailCellFrame.h
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/14.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDDesignerDetailCellFrame : NSObject
@property(nonatomic,copy)NSString * detailStr;
@property(nonatomic,assign)CGRect titleFrame;
@property(nonatomic,assign)CGRect detailFrame;
@property(nonatomic,assign)CGFloat height;
@end
