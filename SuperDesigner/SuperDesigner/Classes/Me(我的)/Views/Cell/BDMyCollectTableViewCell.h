//
//  BDMyCollectTableViewCell.h
//  SuperDesigner
//
//  Created by Julia on 2017/10/27.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDMyCollectModel.h"

@interface BDMyCollectTableViewCell : UITableViewCell
@property(nonatomic, strong) BDMyCollectModel *myCollectModel;

+(instancetype) collectCellWithTableView:(UITableView *)tableView;

@end
