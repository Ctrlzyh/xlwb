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
#import "StatusRetweetedCell.h"
#import "StatusCell/StatusCell.h"
#import "StatusNormalCell.h"


static NSString * const StatusCellNormalId = @"StatusCellNormalId";
static NSString * const StatusRetweetedCellId = @"StatusRetweetedCellId";

@interface HomeTableViewController ()
@property (nonatomic,strong) NSMutableArray *dataList;
@property (nonatomic,strong) StatusListViewModel *listViewModel;
@property (nonatomic,strong) UIActivityIndicatorView *pullupView;
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
    [self.tableView registerClass:StatusNormalCell.self forCellReuseIdentifier:StatusCellNormalId];
    [self.tableView registerClass:StatusRetweetedCell.self forCellReuseIdentifier:StatusRetweetedCellId];
    self.tableView.estimatedRowHeight = 400;
//    self.tableView.rowHeight = 400;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    self.tableView.tableFooterView = self.pullupView;
}

-(StatusListViewModel *) listViewModel{
    if(!_listViewModel){
        _listViewModel =  [[StatusListViewModel alloc] init];
    }
    return _listViewModel;
}

- (void)loadData {
    [self.listViewModel loadStatusIsPullup:(BOOL)[self.pullupView isAnimating] :^(BOOL isSuccessed) {
        [self.refreshControl endRefreshing];
        [self.pullupView stopAnimating];
        if(!isSuccessed){
            [SVProgressHUD showInfoWithStatus:@"加载数据错误，请稍后再试"];
        }else{
            [self.tableView reloadData];
        }
    }];
//    [self.listViewModel loadStatus:^(BOOL isSuccessed) {
//
//    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listViewModel.statusList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusViewModel *statusViewModel = self.listViewModel.statusList[indexPath.row];
    
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:statusViewModel.cellId forIndexPath:indexPath];
   
    cell.viewModel = statusViewModel;
    
    if ((indexPath.row == self.listViewModel.statusList.count - 1)&&![self.pullupView isAnimating]) {
        [self.pullupView startAnimating];
        [self loadData];
    }
    return cell;
}

- (UIActivityIndicatorView *)pullupView{
    if(!_pullupView){
        _pullupView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _pullupView.color = [UIColor lightGrayColor];
    }
    return _pullupView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusViewModel *statusViewModel = self.listViewModel.statusList[indexPath.row];
//    StatusCell *cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StatusCellNormalId];
//    return [cell rowHeight:statusViewModel];
//    NSLog(@"-----%f",statusViewModel.rowHeight);
    return statusViewModel.rowHeight;
    
}
@end
