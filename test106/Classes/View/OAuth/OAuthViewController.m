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
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    //    NSLog(@"--网址--->%@",navigationResponse.response);
    
    if ([navigationResponse.response.URL.host.lowercaseString isEqual:@"www.baidu.com"]) {
        NSString *urlStr =[navigationResponse.response.URL absoluteString];
        NSLog(@"如果百度%@",urlStr);
        if([[navigationResponse.response.URL absoluteString] containsString:@"error"]){
            NSLog(@"取消授权");
        }else{
            
            NSRange rg = [urlStr rangeOfString:@"code="];
            self.code =[urlStr substringFromIndex:rg.location+rg.length];
            NSLog(@"授权%@",self.code);
            [[NetworkTools sharedTools] loadAccessTokenCode:self.code WithFinished:^(id _Nonnull result, NSError * _Nonnull error) {
                if(error != nil){
                    NSLog(@"出错了");
                    return;
                }
                NSLog(@"-gg---->%@",result);
                UserAccount *userAccount = [UserAccount provinceWithDictionary:result];
                
                [self loadUserInfo:userAccount];
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
    [[NetworkTools sharedTools] LoadUserInfo:userAccount.uid WithAccessToken:userAccount.access_token WithFinished:^(id _Nonnull result, NSError * _Nonnull error) {
        if(error != nil){
            NSLog(@"出错了");
            return;
        }
        NSLog(@"-loadUserInfo---->%@",result);
        userAccount.screen_name = result[@"screen_name"];
        userAccount.avatar_large = result[@"avatar_large"];
        NSLog(@"-userAccount---->%@",userAccount);
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
    NSURL *url = [[NetworkTools alloc] oautURL];
    
    [self.webView loadRequest:[ NSURLRequest requestWithURL:url]];
}

@end
