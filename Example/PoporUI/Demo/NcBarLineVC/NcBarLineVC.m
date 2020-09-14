//
//  NcBarLineVC.m
//  PoporUI_Example
//
//  Created by popor on 2020/9/14.
//  Copyright © 2020 wangkq. All rights reserved.
//

#import "NcBarLineVC.h"
#import "UIViewController+pNcBarBottomLine.h"

@interface NcBarLineVC ()

@end

@implementation NcBarLineVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self hiddenSystemBottomLine];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self showSystemBottomLine];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getSystemDefaultImage];
    
    self.title = @"隐藏导航栏底部线条";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
