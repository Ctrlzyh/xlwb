//
//  StatusListViewModel.m
//  test106
//
//  Created by qiaofang on 2021/10/25.
//

#import "StatusListViewModel.h"
#import "UserAccontViewModel.h"
#import "Status.h"
#import "StatusViewModel.h"

@implementation StatusListViewModel
-(NSMutableArray *) statusList{
    if(!_statusList){
        _statusList =  [NSMutableArray array];
    }
    return _statusList;
}

- (void) loadStatus:(void (^)(BOOL))finished{
    [[UserAccontViewModel alloc] loadStatus:^(id _Nonnull result, NSError * _Nonnull error) {
        if(error != nil){
            NSLog(@"出错了-statuses--->");
            finished(NO);
            return;
        }
//        NSLog(@"result--->%@",result);
        NSArray *array = result[@"statuses"];
        if(array){
            NSMutableArray *dataList = [NSMutableArray array];
            for(NSDictionary *dict in array) {
                Status *model = [Status statusWithDictionary:dict];
                StatusViewModel *statusViewModel = [StatusViewModel statusWith:model];
                [dataList addObject:statusViewModel];
            }
            NSLog(@"dataList---->%@",dataList);
             [dataList addObjectsFromArray:self.statusList];
            self.statusList = dataList;
            finished(YES);
        }else{
            finished(NO);
        }
    }];
}

@end
