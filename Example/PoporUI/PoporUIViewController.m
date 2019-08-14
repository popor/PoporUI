//
//  PoporUIViewController.m
//  PoporUI
//
//  Created by wangkq on 06/19/2018.
//  Copyright (c) 2018 wangkq. All rights reserved.
//

#import "PoporUIViewController.h"

#import <PoporFoundation/PrefixFont.h>
#import <PoporFoundation/PrefixColor.h>
//#import "UIView+Extension.h"
#import <PoporFoundation/NSString+Tool.h>
#import <PoporFoundation/NSString+Size.h>

#import <PoporFoundation/PrefixFun.h>

#import "UIDeviceScreen.h"

#import "IToastKeyboard.h"

#import "UIImage+Tool.h"

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
    //NSLog(@"top margin: %i", self.navigationController.topMargin);
    NSLog(@"HasFFmpeg: %i", HasFFmpeg);
    
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


@end
