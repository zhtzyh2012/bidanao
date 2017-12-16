//
//  BDLeftTableView.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/22.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDLeftTableView.h"
#import "BDLeftTableViewCell.h"

@interface BDLeftTableView()
@property(nonatomic, strong) NSArray *instituteArray;

@end


@implementation BDLeftTableView

-(NSArray *)instituteArray {
    
    if (_instituteArray == nil) {
        _instituteArray = [[NSArray alloc] init];
    }
    return _instituteArray;
}


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        [self designerNetFunc];
        
    }
    return self;
    
}

#pragma mark -- 设计院的网络请求数据
-(void) designerNetFunc {
    
    NSDictionary *dict = @{
                           @"a":@"0",
                           @"b":@"1",
                           };
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_designerInstitute parameters:nil sucess:^(id json) {
        
        NSMutableArray *nmArray = [NSMutableArray array];
        for (NSDictionary *dict in json[@"list"]) {
            BDDesignInstituteModel *model = [BDDesignInstituteModel DesigneInstituteWithDict:dict];
            [nmArray addObject:model];
            
        }
        //赋值
        self.instituteArray = nmArray;
        [self reloadData];
        
        
        
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"设计院数据请求成功");
            
            
        } else if ([json[@"code"] intValue] == 201) {
            
            //[self makeToast:@"请检查网络" duration:2.0f position:CSToastPositionTop];
            
            return;
        }
    } failure:^(NSError *error) {
        
    }];
}




#pragma mark --数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     return self.instituteArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return KScreen_HEIGHT*0.85;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1定义一个重用的标示
    NSString *reusedId = @"myDesignerCell";
    BDLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if (!cell) {
        cell = [[BDLeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedId];
        
    }
    //cell.textLabel.text = @"这是一个左边的tableView";
    
    BDDesignInstituteModel *model = self.instituteArray[indexPath.row];
    cell.instituteListModel = model;
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell点击了");
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
    //    [self.navigationController pushViewController:desVC animated:YES];
    
    
}


@end






























