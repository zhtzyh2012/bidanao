//
//  BDDesingInstituteViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/20.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesingInstituteViewController.h"
#import "BDDesingInstituteTableViewCell.h"
#import "BDDesignInstituteModel.h"
#import "BDDesignerDetailViewController.h"


@interface BDDesingInstituteViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;



@property(nonatomic, strong) BDDesingInstituteTableViewCell *cell;


@property(nonatomic, strong) NSArray *instituteArray;
@end

@implementation BDDesingInstituteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设计院";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    [self tableView];
    [self designerNetFunc];

}

-(NSArray *)instituteArray {
    
    if (_instituteArray == nil) {
        _instituteArray = [[NSArray alloc] init];
    }
    return _instituteArray;
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
        [self.tableView reloadData];

        
        
        if ([json[@"code"] intValue] == 200) {
            NSLog(@"设计院数据请求成功");
            
            
        } else if ([json[@"code"] intValue] == 201) {
            
            [self.view makeToast:@"请检查网络" duration:2.0f position:CSToastPositionTop];
            
            return;
        }
    } failure:^(NSError *error) {
        
    }];
}


-(UITableView *)tableView {
    
    if (_tableView == nil) {
        
        //_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreen_WIDTH, KScreen_HEIGHT - 50) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
    
}


#pragma mark -- tableView 的代理方法
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 105;
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.instituteArray.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.定义一个重用的标示
    NSString *reusedID = @"myInstitute";
    BDDesingInstituteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedID];
    if (!cell) {
        cell = [[BDDesingInstituteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    BDDesignInstituteModel *model = self.instituteArray[indexPath.row];
    cell.instituteListModel = model;
    

    

//    NSString *str = model.type;
//    NSArray *flagArray = [str componentsSeparatedByString:@","];
//    //[cell.tagView setTagWithTagArray:flagArray];
//
//    [cell.tagView setTagWithTagArray:flagArray andWith:self.view.bounds.size.width - 100];
    
    
    

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"cell点击了");
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    BDDesignerDetailViewController * desVC = [[BDDesignerDetailViewController alloc]init];
    [self.navigationController pushViewController:desVC animated:YES];
    
    
}


@end
