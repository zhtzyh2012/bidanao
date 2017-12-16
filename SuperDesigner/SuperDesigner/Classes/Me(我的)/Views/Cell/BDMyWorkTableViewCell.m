//
//  BDMyWorkTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/16.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyWorkTableViewCell.h"
static NSString *reusedWorkId = @"workCellId";

@interface BDMyWorkTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *workNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *workPictureOne;
@property (weak, nonatomic) IBOutlet UIImageView *workPictureTwo;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation BDMyWorkTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype) workCellWithTableView:(UITableView *) tableView {
    
    BDMyWorkTableViewCell *workCell = [tableView dequeueReusableCellWithIdentifier:reusedWorkId];
    if (workCell == nil) {
        workCell = [[[NSBundle mainBundle] loadNibNamed:@"BDMyWorkTableViewCell" owner:nil options:nil] lastObject];
        //workCell.textLabel.text = @"还得加阿斯达";
         workCell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    return workCell;
    
}

-(void)setWorkCaseList:(BDWorkCase *)workCaseList {
    
    _workCaseList = workCaseList;
    self.workNameLabel.text = workCaseList.workName;
    self.workPictureOne.image = workCaseList.image;
    self.workPictureTwo.image = workCaseList.pictureImage;
    self.timeLabel.text = workCaseList.workTime;
    
}


//+(instancetype) homeCellWithTableView:(UITableView *)tableView {
//
//    BDHomeTableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:reusedHomeID];
//    if(homeCell == nil) {
//
//        homeCell = [[[NSBundle mainBundle] loadNibNamed:@"BDHomeTableViewCell" owner:nil options:nil] lastObject];
//        homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    }
//
//
//    return homeCell;
//
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
