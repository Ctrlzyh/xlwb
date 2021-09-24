//
//  NetworkTools.h
//  test106
//
//  Created by qiaofang on 2021/9/23.
//

#import <AFNNetworking/AFNNetworking.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    GET,
    POST,
} RequestMethod;
@interface NetworkTools : AFHTTPSessionManager
+(instancetype)sharedTools;
-(void)requset:(RequestMethod)method URLString:(NSString *)URLString parameters:(id)parameters finished:(void (^)(id,NSError *))finished;
-(NSURL *)oautURL;
-(void)loadAccessTokenCode:(NSString *)code WithFinished:(void (^)(id,NSError *))finished;
@end

NS_ASSUME_NONNULL_END
