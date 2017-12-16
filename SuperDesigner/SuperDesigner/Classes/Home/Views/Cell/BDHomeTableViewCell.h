//
//  BDHomeTableViewCell.h
//  SuperDesigner
//
//  Created by Julia on 2017/8/21.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDHomeCase.h"

@interface BDHomeTableViewCell : UITableViewCell

/**
 *模型数组
 */
@property(nonatomic, strong) BDHomeCase *homeList;


+(instancetype) homeCellWithTableView:(UITableView *)tableView;

@end
