//
//  BDDesignerDetailTableViewCell.h
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDDesignerDetailCellFrame.h"
@interface BDDesignerDetailTableViewCell : UITableViewCell
@property(nonatomic,copy)NSString * title;
@property(nonatomic,strong)BDDesignerDetailCellFrame * Detailframe;
@end
