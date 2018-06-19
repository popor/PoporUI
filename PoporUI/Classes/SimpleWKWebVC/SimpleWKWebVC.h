//
//  SimpleWKWebVC.h
//  Wanzi
//
//  Created by 王凯庆 on 2016/11/22.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WKWebView;

// 强制刷新网页的临时办法, 给网址加上time/时间戳参数.以后找新的办法.
@interface SimpleWKWebVC : UIViewController

@property (nonatomic, strong) NSString  * firstUrl;
@property (nonatomic, strong) WKWebView * infoWV;
//@property (nonatomic, weak  ) id<SimplerWebVCDelegate> delegate;

- (id)initWithTitle:(NSString *)title url:(NSString *)url;

@end

