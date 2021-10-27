//
//  HomeTableViewController.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "HomeTableViewController.h"
#import "UserAccontViewModel.h"
#import "Status.h"
#import "StatusListViewModel.h"
#import "SVProgressHUD.h"
#import "User.h"
#import "StatusViewModel.h"
//#import "StatusCell.h"
#import "StatusCell/StatusCell.h"

static NSString * const StatusCellNormalId = @"StatusCellNormalId";

@interface HomeTableViewController ()
@property (nonatomic,strong) NSMutableArray *dataList;
@property (nonatomic,strong) StatusListViewModel *listViewModel;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if([[UserAccontViewModel alloc] getUserAccount]){
        [self prepareTableView];
        [self loadData];
    }else{
        [self.visitorView setupInfoImgName:@"" WithTitle:@"关注一些人，回这里看看有什么惊喜"];
    }
}

- (void)prepareTableView {
    [self.tableView registerClass:StatusCell.self forCellReuseIdentifier:StatusCellNormalId];
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(StatusListViewModel *) listViewModel{
    if(!_listViewModel){
        _listViewModel =  [[StatusListViewModel alloc] init];
    }
    return _listViewModel;
}

- (void)loadData {
    [self.listViewModel loadStatus:^(BOOL isSuccessed) {
        if(!isSuccessed){
            [SVProgressHUD showInfoWithStatus:@"加载数据错误，请稍后再试"];
        }else{
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listViewModel.statusList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:StatusCellNormalId forIndexPath:indexPath];
    StatusViewModel *statusViewModel = self.listViewModel.statusList[indexPath.row];
//    Status *cellModel = statusViewModel.status;
    cell.viewModel = statusViewModel;
//    cell.textLabel.text = cellModel.text;
//    cell.textLabel.text = cellModel.user.screen_name;

    return cell;
}
@end
