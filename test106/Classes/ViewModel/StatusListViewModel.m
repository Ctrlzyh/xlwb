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
#import <SDWebImage.h>

@implementation StatusListViewModel
-(NSMutableArray *) statusList{
    if(!_statusList){
        _statusList =  [NSMutableArray array];
    }
    return _statusList;
}

- (void) loadStatusIsPullup:(BOOL)isPullup :(void (^)(BOOL))finished{
    int since_id = 0;
    int max_id = 0;
    if ((self.statusList.count > 0)&&!isPullup){
        StatusViewModel *StatusViewModel = self.statusList.firstObject;
        since_id = [StatusViewModel.status.idstr intValue];
    }
    
    if (isPullup && (self.statusList.count > 0)){
        StatusViewModel *StatusViewModel = self.statusList.lastObject;
        max_id = [StatusViewModel.status.idstr intValue];
    }
    
    
    [[UserAccontViewModel alloc] loadStatusWithSinceId:since_id WithMaxId:max_id :^(id _Nonnull result, NSError * _Nonnull error) {
        if(error != nil){
            NSLog(@"出错了-statuses--->");
            finished(NO);
            return;
        }
//        NSLog(@"result--->%@",result);
        NSArray *array = result[@"statuses"];
        if(array.count > 0){
            NSMutableArray *dataList = [NSMutableArray array];

            for(NSDictionary *dict in array) {
                Status *model = [Status statusWithDictionary:dict];
                StatusViewModel *statusViewModel = [StatusViewModel statusWith:model];
                [dataList addObject:statusViewModel];
            }
            NSLog(@"dataList-刷新到--->%lu",(unsigned long)dataList.count);
            if (max_id > 0) {
                for(StatusViewModel *vm in dataList) {
                    [self.statusList addObject:vm];
                    NSLog(@"--上拉刷新---->%lu",(unsigned long)self.statusList.count);
                }
            } else {
                [dataList addObjectsFromArray:self.statusList];
                self.statusList = dataList;
                NSLog(@"--下拉刷新---->%lu",(unsigned long)self.statusList.count);
            }
//             [dataList addObjectsFromArray:self.statusList];
//            self.statusList = dataList;
//            finished(YES);
            [[StatusListViewModel alloc] cacheSingleImage:dataList With:finished];
        }else{
            finished(NO);
        }
    }];
}

-(void) cacheSingleImage:(NSMutableArray *)dataList With:(void (^)(BOOL))finished{
    dispatch_group_t group = dispatch_group_create();
    for (StatusViewModel *vm in dataList){
        if (vm.thumbnailUrls.count != 1){
            continue;
        }
           NSURL *url = vm.thumbnailUrls[0];
            NSLog(@"缓存开始%@",url);
            dispatch_group_enter(group);
            [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderUseNSURLCache progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                dispatch_group_leave(group);
            }];
    }
    dispatch_group_notify(group,  dispatch_get_main_queue(), ^{
        NSLog(@"缓存完成");
        finished(YES);
    });
}


@end
