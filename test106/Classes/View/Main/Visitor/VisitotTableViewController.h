//
//  VisitotTableViewController.h
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import <UIKit/UIKit.h>
#import "VisitorView.h"
NS_ASSUME_NONNULL_BEGIN

@interface VisitotTableViewController : UITableViewController
@property (nonatomic,assign) BOOL userLogin;
@property (nonatomic,strong) VisitorView *visitorView;

@end

NS_ASSUME_NONNULL_END
