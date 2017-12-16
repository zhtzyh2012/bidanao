//
//  BDPersonalInfoCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/28.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDPersonalInfoCell.h"

@implementation BDPersonalInfoCell

+(instancetype)createCellWithTableView:(UITableView *)tableView {
    
    static NSString *cellId = @"settingId";
    
    BDPersonalInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[BDPersonalInfoCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        //cell.detailTextLabel.text = @"15201139342"; 可以设置cell的datailTextLabel的值
        
    }
    return cell;
    
}

-(void)setItem:(NSDictionary *)item {
    
    _item = item;
    self.textLabel.text = item[@"title"];
    //self.imageView.image = [UIImage imageNamed:item[@"icon"]];
    NSString *imageView = item[@"accessorView"];
    
    //根据字符串转化类
    Class cla = NSClassFromString(imageView);
    
    //根据类创建类的对象
    id obj = [[cla alloc] init];
    
    if ([obj isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)obj;
        imageView.image = [UIImage imageNamed:@"backArrow"];
        
        [imageView sizeToFit];
        
    }
    
    self.accessoryView = obj;
    
}

@end
