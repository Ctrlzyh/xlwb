//
//  UserAccontViewModel.h
//  test106
//
//  Created by qiaofang on 2021/9/28.
//

#import <Foundation/Foundation.h>
#import "UserAccount.h"
#import "NetWorkTools.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserAccontViewModel : NSObject
//@property (nonatomic,copy) UserAccount *userAccount;

- (UserAccount *)getUserAccount;
-(NSURL *)avataURL;
-(NSURL *)oautURL;
-(void)loadAccessTokenCode:(NSString *)code WithFinished:(void (^)(id,NSError *))finished;
-(void)LoadUserInfo:(NSString *)uid WithAccessToken:(NSString *)accessToken WithFinished:(void (^)(id,NSError *))finished;
@end

NS_ASSUME_NONNULL_END
