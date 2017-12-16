//
//  BDRightTableView.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/22.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDRightTableView.h"
#import "BDRightTableViewCell.h"


@interface BDRightTableView ()

@property(nonatomic, strong) NSArray *arrRight;

@end


@implementation BDRightTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        [self loadNetData];
    }
    return self;
    
}

-(NSArray *)arrRight {
    
    if (_arrRight == nil) {
        _arrRight = [[NSArray alloc] init];
    }
    return _arrRight;
    
}

#pragma mark -- 网络请求
-(void)loadNetData {

    [[BDBaseHttpTool sharedInstance] getWithUrl:url_fancyDesigner parameters:nil sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"访问成功200");
            
            
        } else if ([json[@"code"] intValue] == 202) {
            
            
        } else if ([json[@"code"] intValue] == 201) {
            
        }
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark --数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //return self.arrW.count;
    return 6;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return KScreen_HEIGHT;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1定义一个重用的标示
    NSString *reusedId = @"myDesignerCell";
    BDRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if (!cell) {
        cell = [[BDRightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedId];
        
    }
    //cell.textLabel.text = @"这是一个tableView";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell点击了");
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
    //    [self.navigationController pushViewController:desVC animated:YES];
    
    
}


@end

