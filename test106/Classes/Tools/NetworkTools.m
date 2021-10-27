//
//  NetworkTools.m
//  test106
//
//  Created by qiaofang on 2021/9/23.
//

#import "NetworkTools.h"

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
        NSURL *baseURL = [NSURL URLWithString:@""];
        tools = [[self alloc] initWithBaseURL:baseURL];
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"test/json",@"text/javascript",@"text/html",@"text/plain", nil];
    });
    return tools;
}
-(void)requset:(RequestMethod)method URLString:(NSString *)URLString parameters:(id)parameters finished:(void (^)(id,NSError *))finished{
    NSString *methodName = (method == GET) ? @"GET" : @"POST";
    
        [[self dataTaskWithHTTPMethod:methodName URLString:URLString parameters:parameters uploadProgress:^(NSProgress *uploadProgress) {
//            NSLog(@"uploadProgress--->%@",uploadProgress);
        } downloadProgress:^(NSProgress *downloadProgress) {
//            NSLog(@"downloadProgress--->%@",downloadProgress);
        } success:^(NSURLSessionDataTask *task, id responseObject) {
            finished(responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            finished(nil,error);
        }] resume];
    
//    if(method == GET){
//        [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            finished(responseObject,nil);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            finished(nil,error);
//        }];
//    }else {
//        [self POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            finished(responseObject,nil);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            finished(nil,error);
//        }];
//    }
}





@end
