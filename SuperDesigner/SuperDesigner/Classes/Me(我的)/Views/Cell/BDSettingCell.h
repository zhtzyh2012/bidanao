//
//  BDSettingCell.h
//  SuperDesigner
//
//  Created by Julia on 2017/6/15.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDSettingCell : UITableViewCell

+(instancetype) createCellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) NSDictionary *item;


@end
