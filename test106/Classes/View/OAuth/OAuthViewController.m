//
//  OAuthViewController.m
//  test106
//
//  Created by qiaofang on 2021/9/24.
//

#import "OAuthViewController.h"
#import "NetworkTools.h"
#import <WebKit/WebKit.h>
#import "UserAccount.h"
#import "UserAccontViewModel.h"
#import "SVProgressHUD.h"

@interface OAuthViewController ()<WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,copy) NSString *code;
@end

@implementation OAuthViewController
- (void)loadView {
    [super loadView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"自动填充" style:UIBarButtonItemStylePlain target:self action:@selector(autoFill)];
}

-(void)autoFill{
    NSString *js = [NSString stringWithFormat:@"document.getElementById('loginName').value = '17666566557';document.getElementById('loginPassword').value = 'zjj1203023';"];
    [self.webView evaluateJavaScript:js completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"--error-->%@",error);
    }];
}

-(void)close{
    [SVProgressHUD dismiss];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
        NSLog(@"--网址--->%@",navigationResponse.response);
    NSLog(@"--网址222--->%@",navigationResponse.response.URL.host.lowercaseString);
    
    if ([navigationResponse.response.URL.host.lowercaseString isEqual:@"m.baidu.com"]) {
        NSString *urlStr =[navigationResponse.response.URL absoluteString];
        NSLog(@"如果百度%@",urlStr);
        if([[navigationResponse.response.URL absoluteString] containsString:@"error"]){
            NSLog(@"取消授权");
            [self close];
        }else{
            NSString *string = urlStr;
            NSArray *array = [string componentsSeparatedByString:@"&"];
            NSRange rg = [array[0] rangeOfString:@"code="];
            self.code =[array[0] substringFromIndex:rg.location+rg.length];
            NSLog(@"授权%@",self.code);
            [[UserAccontViewModel alloc] loadAccessTokenCode:self.code WithFinished:^(id _Nonnull result, NSError * _Nonnull error) {
                if(error != nil){
                    NSLog(@"出错了%@",error);
                    [SVProgressHUD showInfoWithStatus:@"网络不给力"];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        [self close];
                    });
                    return;
                }
                NSLog(@"-gg---->%@",result);
                UserAccount *userAccount = [UserAccount provinceWithDictionary:result];
                
                [self loadUserInfo:userAccount];
                
                [self dismissViewControllerAnimated:NO completion:^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:WBSwitchRootViewControllerNotification object:@"welcome"];
                }];
               
            }];
        }
        decisionHandler(WKNavigationResponsePolicyCancel);
        return;
    }else{
        decisionHandler(WKNavigationResponsePolicyAllow);
        return;
    }
}

-(void)loadUserInfo:(UserAccount *)userAccount{
    [[UserAccontViewModel alloc] LoadUserInfo:userAccount.uid WithAccessToken:userAccount.access_token WithFinished:^(id _Nonnull result, NSError * _Nonnull error) {
        if(error != nil){
            NSLog(@"出错了%@",error);
            return;
        }
        NSLog(@"-loadUserInfo---->%@",result);
        userAccount.screen_name = result[@"screen_name"];
        userAccount.avatar_large = result[@"avatar_large"];
        NSLog(@"-userAccount---->%@",userAccount);
        [userAccount saveUserAccount];
    }];
}

-(WKWebView *) webView{
    if(!_webView){
        _webView = [[WKWebView alloc] init];
    }
    _webView.navigationDelegate = self;
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = self.webView;
    //    self.webView.de
    //https://api.weibo.com/oauth2/authorize?client_id=3308298737&redirect_uri=http://www.baidu.com
    NSURL *url = [[UserAccontViewModel alloc] oautURL];
    
    [self.webView loadRequest:[ NSURLRequest requestWithURL:url]];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [SVProgressHUD show];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
}

@end
