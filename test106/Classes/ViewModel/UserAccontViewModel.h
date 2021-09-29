//
//  UserAccontViewModel.h
//  test106
//
//  Created by qiaofang on 2021/9/28.
//

#import <Foundation/Foundation.h>
#import "UserAccount.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserAccontViewModel : NSObject
//@property (nonatomic,copy) UserAccount *userAccount;

- (UserAccount *)getUserAccount;
@end

NS_ASSUME_NONNULL_END
