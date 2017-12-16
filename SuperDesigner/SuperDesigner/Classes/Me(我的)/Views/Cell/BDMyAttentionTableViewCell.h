//
//  BDMyAttentionTableViewCell.h
//  SuperDesigner
//
//  Created by Julia on 2017/10/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDMyAttentionModel.h"

@interface BDMyAttentionTableViewCell : UITableViewCell

@property(nonatomic, strong) BDMyAttentionModel *attentionModel;

//写一个方法加载tableView
+(instancetype) attentionCellWithTableView:(UITableView *)tableView;


@end
