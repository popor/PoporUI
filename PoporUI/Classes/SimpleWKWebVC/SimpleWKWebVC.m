//
//  SimpleWebVC.m
//  Wanzi
//
//  Created by popor on 16/1/12.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import "SimpleWKWebVC.h"

#import <WebKit/WebKit.h>
#import <Masonry/Masonry.h>
#import "IToastKeyboard.h"

@interface SimpleWKWebVC ()<WKUIDelegate, WKNavigationDelegate>

@property (nonatomic) BOOL         isShowCloseBT;
@property (nonatomic) CGFloat      ncBarHeight;
@property (nonatomic) UIEdgeInsets safeAreaInset;

@end

@implementation SimpleWKWebVC

- (void)dealloc {
    //[VCRecord shareVCRecord].lastVC = nil;
    self.navigationItem.leftItemsSupplementBackButton = NO;
}

- (id)initWithTitle:(NSString *)title url:(NSString *)url; {
    if (self = [super init]) {
        self.title    = title;
        self.firstUrl = url;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self addWebView];
    //[self addNCBT];
}

//- (void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//
//    [self handleStatusBarOrientationChange];
//}

// 假如有闪烁,重启iPhone即可修复
- (void)handleStatusBarOrientationChange{
    return;
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];//标题栏
    //        CGRect NavRect    = self.navigationController.navigationBar.frame;//然后将高度相加，便可以动态计算顶部高度。
    //        CGFloat height    = StatusRect.size.height + NavRect.size.height;
    //
    //        UIEdgeInsets currentSafeAreaInset = UIEdgeInsetsZero;
    //        if (@available(iOS 11.0, *)) {
    //            currentSafeAreaInset = self.view.safeAreaInsets;
    //            // NSLog(@"safeAreaInset : %@", NSStringFromUIEdgeInsets(safeAreaInset));
    //        }
    //        if (!UIEdgeInsetsEqualToEdgeInsets(self.safeAreaInset, currentSafeAreaInset) || self.ncBarHeight != height) {
    //            NSLog(@"ncBarHeight : %f, safeAreaInset.left : %f", height, currentSafeAreaInset.left);
    //            self.safeAreaInset = currentSafeAreaInset;
    //            self.ncBarHeight   = height;
    //
    //            [self.infoWV mas_remakeConstraints:^(MASConstraintMaker *make) {
    //                make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    //            }];
    //            NSLog(@"重新布局尺寸");
    //        }else{
    //            NSLog(@"不需要重新布局尺寸");
    //        }
    //    });
}

- (void)addNCBT {
    UIBarButtonItem *itemSafari = [[UIBarButtonItem alloc] initWithTitle:@"Safari" style:UIBarButtonItemStylePlain target:self action:@selector(openInSafari)];
    UIBarButtonItem *itemCopy = [[UIBarButtonItem alloc] initWithTitle:@"复制 " style:UIBarButtonItemStylePlain target:self action:@selector(copyUrlAction)];
    self.navigationItem.rightBarButtonItems = @[itemSafari, itemCopy];;
}

- (void)openInSafari {
    NSLog(@"url: %@", self.infoWV.URL.absoluteString);
    if (@available(iOS 10, *)) {
        [[UIApplication sharedApplication] openURL:self.infoWV.URL options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@NO} completionHandler:nil];
    }else{
        [[UIApplication sharedApplication] openURL:self.infoWV.URL];
    }
}

- (void)copyUrlAction {
    [UIPasteboard generalPasteboard].string = self.infoWV.URL.absoluteString;
    AlertToastTitle(@"已复制该网页URL");
}

- (void)addWebView {
    if (!self.infoWV) {
        self.infoWV = [[WKWebView alloc] init];
        self.infoWV.navigationDelegate = self;
        self.infoWV.allowsBackForwardNavigationGestures = YES;
        
        [self.view addSubview:self.infoWV];
        
        [self.infoWV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        if (@available(iOS 11, *)) {
            self.infoWV.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.firstUrl]];
        [self.infoWV loadRequest:request];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSLog(@"SimpleWKWebVC 新请求:%@, type: %i", navigationAction.request.URL.absoluteString, (int)navigationAction.navigationType);
    //NSString *url = [navigationAction.request.URL.absoluteString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (navigationAction.navigationType == WKNavigationTypeBackForward) {
        [self addCloseBT];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    if([error code] == NSURLErrorCancelled)  {
        return;
    }
    if (error) {
        AlertToastTitleTime(error.localizedDescription, 2);
    }
}

// 设定VC.title,和侧滑GR的开关
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.title = webView.title;
}

//#pragma mark - UIViewController+BackButtonHandlerWK
//- (BOOL)shouldHoldBackButtonEvent {
//    return YES;
//}
//
//- (BOOL)canPopViewController {
//    [self checkBackEvent];
//    return YES;
//}
//
//- (BOOL)forceEnableInteractivePopGestureRecognizer {
//    [self checkBackEvent];
//    return YES;
//}
//
//- (void)checkBackEvent {
//    if ([self.infoWV canGoBack]) {
//        NSLog(@"内部返回");
//        [self addCloseBT];
//        [self.infoWV goBack];
//    }else{
//        NSLog(@"外部返回");
//    }
//}

- (void)addCloseBT {
    if (!self.isShowCloseBT) {
        self.isShowCloseBT = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.leftItemsSupplementBackButton = YES;
            UIBarButtonItem *itemWifi = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(closeSelfVC)];
            self.navigationItem.leftBarButtonItem = itemWifi;
        });
    }
}

- (void)closeSelfVC {
    NSLog(@"执行返回事件");
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end

