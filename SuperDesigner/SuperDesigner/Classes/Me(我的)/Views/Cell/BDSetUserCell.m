//
//  BDSetUserCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/7/28.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDSetUserCell.h"

@implementation BDSetUserCell


+(instancetype)createCellWithTableView:(UITableView *)tableView {
//    static NSString *cellID =@"setUserCellID";
//    BDSetUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if(cellID == nil) {
//        
//        cell = [[BDSetUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        
//    
//    }
//    return cell;
    
    
    static NSString *cellId = @"settingId";
    
    BDSetUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[BDSetUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
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




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





@end
