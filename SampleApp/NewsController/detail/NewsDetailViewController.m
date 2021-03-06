//
//  NewsDetailViewController.m
//  SampleApp
//
//  Created by John Lee on 2020/4/26.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "NewsDetailViewController.h"
#import <WebKit/WebKit.h>

@interface NewsDetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, copy, readwrite) NSString *acticleUrl;

@end

@implementation NewsDetailViewController

+ (void)load {
    [SAMediator registerScheme:@"detail://" processBlock:^(NSDictionary *_Nonnull params) {
        NSString *url = [params objectForKey:@"url"];
        UINavigationController *navigationController  = [params objectForKey:@"controller"];
        NewsDetailViewController *controller = [[NewsDetailViewController alloc] initWithUrlString:url];
        [navigationController pushViewController:controller animated:YES];
    }];

//    [SAMediator registerProtocol:@protocol(SADetailViewControllerProtocol) class:[self class]];
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
}

- (instancetype)initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.acticleUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat offset = [self.view.window.windowScene statusBarManager].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height + 20;

    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, offset, self.view.frame.size.width, self.view.frame.size.height - offset)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];

    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, offset, self.view.frame.size.width, 20)];
        self.progressView;
    })];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.acticleUrl]]];

    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:(NSKeyValueObservingOptionNew) context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}

//

// 是否加载网络请求#1
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

// webview完成加载#2
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"didFinishNavigation");
    [self.progressView setHidden:YES];
}

// webview加载失败#2
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"didFailNavigation");
    [self.progressView setHidden:YES];
}

// webview Crash 回调(自动重新加载)
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView) {
            self.navigationController.title = self.webView.title;
        }
    }

    self.progressView.progress = self.webView.estimatedProgress;
}

@end
