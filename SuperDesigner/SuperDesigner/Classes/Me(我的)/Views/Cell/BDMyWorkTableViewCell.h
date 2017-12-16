//
//  BDMyWorkTableViewCell.h
//  SuperDesigner
//
//  Created by Julia on 2017/10/16.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDWorkCase.h"

@interface BDMyWorkTableViewCell : UITableViewCell
@property(nonatomic, strong)BDWorkCase *workCaseList;
+(instancetype) workCellWithTableView:(UITableView *) tableView;

@end
