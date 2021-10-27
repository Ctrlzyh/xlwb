//
//  StatusListViewModel.h
//  test106
//
//  Created by qiaofang on 2021/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatusListViewModel : NSObject
@property (nonatomic,strong) NSMutableArray *statusList;
- (void) loadStatus:(void (^)(BOOL))finished;
@end

NS_ASSUME_NONNULL_END
