//
//  UserAccontViewModel.m
//  test106
//
//  Created by qiaofang on 2021/9/28.
//

#import "UserAccontViewModel.h"

@implementation UserAccontViewModel
- (UserAccount *)getUserAccount{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"account.plish"];
    UserAccount *account =  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if(account != nil){
        NSDate *nowDate = [[NSDate alloc] init];
//        account.expiresDate = [NSDate dateWithTimeIntervalSince1970:3000];
        if( [account.expiresDate compare:nowDate] == NSOrderedDescending){
            
        }else{
            account = nil;
        }
    }
//    self.userAccount = account;
    NSLog(@"--account---->%@",account);
    return account;
}
@end
