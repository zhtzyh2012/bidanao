//
//  BDSetUserCell.h
//  SuperDesigner
//
//  Created by Julia on 2017/7/28.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDSetUserCell : UITableViewCell

+(instancetype)createCellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) NSDictionary *item;

@end
