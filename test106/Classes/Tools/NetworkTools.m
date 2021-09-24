//
//  NetworkTools.m
//  test106
//
//  Created by qiaofang on 2021/9/23.
//

#import "NetworkTools.h"

static NSString * const BASEURL = @"";
static NSString * const appKey = @"3308298737";
static NSString * const appSecret = @"e82f1b1e8fbe8b280b5e7e82dff43822";
static NSString * const redirectUri = @"http://www.baidu.com";

@protocol NetworkToolsProxy <NSObject>
@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;
@end

@interface NetworkTools() <NetworkToolsProxy>

@end
@implementation NetworkTools
+(instancetype)sharedTools{
    static NetworkTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[self alloc] initWithString: BASEURL];
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"test/json",@"text/javascript",@"text/html", nil];
    });
    return tools;
}
-(void)requset:(RequestMethod)method URLString:(NSString *)URLString parameters:(id)parameters finished:(void (^)(id,NSError *))finished{
    NSString *methodName = (method == GET) ? @"GET" : @"POST";
    
//    [[self dataTaskWithHTTPMethod:methodName URLString:URLString parameters:parameters uploadProgress:^(NSProgress *uploadProgress) {
//        NSLog(@"uploadProgress--->%@",uploadProgress);
//    } downloadProgress:^(NSProgress *downloadProgress) {
//        NSLog(@"downloadProgress--->%@",downloadProgress);
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        finished(responseObject,nil);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        finished(nil,error);
//    }] resume];
    [[self dataTaskWithHTTPMethod:methodName URLString:URLString parameters:parameters uploadProgress:^(NSProgress *uploadProgress) {
        
    } downloadProgress:^(NSProgress *downloadProgress) {
        
        CGFloat progress = downloadProgress.completedUnitCount *1.0 / downloadProgress.totalUnitCount;
        
        NSLog(@"%f",progress);
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        finished(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        finished(nil,error);
    }]resume];

}

-(NSURL *)oautURL{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&response_type=%@&redirect_uri=%@",appKey,@"code",redirectUri];
    NSURL *url = [NSURL URLWithString:str];
    return url;
}
-(void)loadAccessTokenCode:(NSString *)code WithFinished:(void (^)(id,NSError *))finished{
    NSString *url = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         appKey,@"client_id",
                         appSecret,@"client_secret",
                         @"authorization_code",@"grant_type",
                         code,@"code",
                         redirectUri,@"redirect_uri",
                         nil ];

    [self requset:POST URLString:url parameters:dic finished:finished];
}
@end
