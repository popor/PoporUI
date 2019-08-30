//
//  PoporUIViewController.m
//  PoporUI
//
//  Created by wangkq on 06/19/2018.
//  Copyright (c) 2018 wangkq. All rights reserved.
//

#import "PoporUIViewController.h"

#import <PoporFoundation/Font+pPrefix.h>
#import <PoporFoundation/Color+pPrefix.h>
#import <PoporFoundation/Fun+pPrefix.h>

#import <PoporFoundation/NSString+pTool.h>
#import <PoporFoundation/NSString+pSize.h>

#import "IToastKeyboard.h"

#import "UIImage+pTool.h"

#import "PoporUI.h"

#if __has_include(<PoporFFmpegCompress/PoporFFmpegCompress.h>)

#define HasFFmpeg 1
#import <PoporFFmpegCompress/PoporFFmpegCompress.h>

#else
#define HasFFmpeg 0

#endif

#if __has_include(<UIKit/UIKit.h>)

#define HasUI YES

#else
#define HasUI NO

#endif

@interface PoporUIViewController ()

#if HasFFmpeg == 1
@property (nonatomic, strong) NSString * has;
#endif

@end

@implementation PoporUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)testWifiName {
    NSString * name = [UIDevice getWifiName];
    NSLog(@"name: %@", name);
}

- (void)testMacro {
#if HasFFmpeg == 0
    NSLog(@"HasFFmpeg 0 __ : %i", HasFFmpeg);
#endif
    
#if HasFFmpeg == 1
    NSLog(@"HasFFmpeg 1 __ : %i", HasFFmpeg);
#endif
    
#if (HasUI == YES)
    NSLog(@"HasUI 0 __ : %i", HasUI);
#endif
}

- (void)testAC {
    UIAlertController * oneAC = [UIAlertController alertControllerWithTitle:@"修改" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [oneAC addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"请设置标题";
    }];
    
    UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    UIAlertAction * changeAction = [UIAlertAction actionWithTitle:@"修改" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"修改");
    }];
    
    [oneAC addAction:cancleAction];
    [oneAC addAction:changeAction];
    
    UIWindow * window = [UIApplication sharedApplication].windows.firstObject;
    [window.rootViewController presentViewController:oneAC animated:YES completion:nil];
}

@end
