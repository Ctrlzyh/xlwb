//
//  UserAccontViewModel.m
//  test106
//
//  Created by qiaofang on 2021/9/28.
//

#import "UserAccontViewModel.h"
static NSString * const appKey = @"3308298737";
static NSString * const appSecret = @"df1d3d0c5d317453e9f13719873aeee9";
static NSString * const redirectUri = @"http://www.baidu.com";

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

-(NSURL *)avataURL{
    UserAccount *account = [self getUserAccount];
    NSString *str = @"";
    if(account){
        str = account.avatar_large;
    }
    NSURL *url = [NSURL URLWithString:str];
    return url;
}

-(NSURL *)oautURL{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&response_type=%@&redirect_uri=%@",appKey,@"code",redirectUri];
    NSURL *url = [NSURL URLWithString:str];
    return url;
}

-(void)loadAccessTokenCode:(NSString *)code WithFinished:(void (^)(id,NSError *))finished{
    NSString *url = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *dic = @{@"client_id":appKey,
                          @"client_secret":appSecret,
                          @"grant_type":@"authorization_code",
                          @"code":code,
                          @"redirect_uri":redirectUri,
    };
    [[NetworkTools sharedTools] requset:POST URLString:url parameters:dic finished:finished];
}

-(void)LoadUserInfo:(NSString *)uid WithAccessToken:(NSString *)accessToken WithFinished:(void (^)(id,NSError *))finished{
    NSString *url = @"https://api.weibo.com/2/users/show.json";
    NSDictionary *dic = @{
        @"uid":uid,
        @"access_token":accessToken
    };
    [[NetworkTools sharedTools] requset:GET URLString:url parameters:dic finished:finished];
}


- (void) loadStatusWithSinceId:(int)since_id WithMaxId:(int)max_id :(void (^)(id,NSError *))finished{
    UserAccount *account = [self getUserAccount];
    NSString *url = @"https://api.weibo.com/2/statuses/home_timeline.json";
    NSDictionary *dic = @{
        @"access_token":account.access_token
    };
    if (since_id > 0){
        dic = @{
            @"access_token":account.access_token,
            @"since_id":[NSNumber numberWithInt:since_id]
        };
    }else if (max_id >0){
        dic = @{
            @"access_token":account.access_token,
            @"max_id":[NSNumber numberWithInt:max_id - 1]
        };
    }else {
        dic = @{
            @"access_token":account.access_token
        };
    }
    [[NetworkTools sharedTools] requset:GET URLString:url parameters:dic finished:finished];
}


@end
