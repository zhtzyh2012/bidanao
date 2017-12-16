//
//  BDTableViewDesignerCell.h
//  SuperDesigner
//
//  Created by Julia on 2017/8/2.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BDNCase.h"

@interface BDTableViewDesignerCell : UITableViewCell



@property(nonatomic, strong)BDNCase *caseList;

+(instancetype)designerCell:(UITableView *)tableView;


@end
