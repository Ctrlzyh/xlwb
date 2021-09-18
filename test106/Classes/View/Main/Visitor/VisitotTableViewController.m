//
//  VisitotTableViewController.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "VisitotTableViewController.h"
#import "VisitorView.h"
@interface VisitotTableViewController ()<VisitorViewDelegate>
@end

@implementation VisitotTableViewController

- (void)loadView {
//    self.userLogin = YES;
    if(self.userLogin){
        [super loadView];
    }else{
        self.visitorView = [[VisitorView alloc] initWithVisitor];
        _visitorView.delegate = self;
        self.view = self.visitorView;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) setUI{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(clickRegister)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(clickLogin)];
}

-(void)clickLogin{
    NSLog(@"123");
}

-(void)clickRegister{
    NSLog(@"222");
}



@end
