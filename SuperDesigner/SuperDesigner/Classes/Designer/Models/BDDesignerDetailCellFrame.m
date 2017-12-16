//
//  BDDesignerDetailCellFrame.m
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/14.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesignerDetailCellFrame.h"
#import "BDDesignerDetailTableViewCell.h"
@implementation BDDesignerDetailCellFrame
-(void)setDetailStr:(NSString *)detailStr{
    _detailStr = detailStr;
    self.titleFrame = CGRectMake(10, 11, 70, 20);
    self.detailFrame = CGRectMake(90, 12, KScreen_WIDTH-100, [self boundsTextHeight:detailStr]);
    self.height = CGRectGetMaxY(self.detailFrame)+10;
}

-(CGFloat)boundsTextHeight:(NSString *)contentText{
    CGRect bounds = [contentText boundingRectWithSize:CGSizeMake(KScreen_WIDTH - 100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return bounds.size.height;
    
}

@end
