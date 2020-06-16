//
//  PoporUIVC.m
//  PoporUI
//
//  Created by apple on 2019/9/16.
//  Copyright © 2019 wangkq. All rights reserved.

#import "PoporUIVC.h"
#import "PoporUIVCPresenter.h"
#import "PoporUIVCInteractor.h"
#import <Masonry/Masonry.h>

#import "PoporUI.h"

@interface PoporUIVC ()

@property (nonatomic, strong) PoporUIVCPresenter * present;

@property (nonatomic        ) BOOL initVC;

@end

@implementation PoporUIVC
@synthesize infoTV;

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        if (dic) {
            self.title = dic[@"title"];
        }
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!self.initVC) {
        self.initVC = YES;
        NSString * indexStr = [self.present getLastVCIndex];
        NSInteger indexInt  = [indexStr integerValue];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (indexInt >= 0) {
                [self.present pushIndex:indexInt];
            }
        });
        
    } else {
        [self.present saveLastVCIndex:@"-1"];
    }
    
}

- (void)viewDidLoad {
    [self assembleViper];
    [super viewDidLoad];
    //UITextField *d;
    if (!self.title) {
        self.title = @"UI";
    }
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // 参考: https://www.jianshu.com/p/c244f5930fdf
    if (self.isViewLoaded && !self.view.window) {
        // self.view = nil;//当再次进入此视图中时能够重新调用viewDidLoad方法
        
    }
}

#pragma mark - VCProtocol
- (UIViewController *)vc {
    return self;
}

#pragma mark - viper views
- (void)assembleViper {
    if (!self.present) {
        PoporUIVCPresenter * present = [PoporUIVCPresenter new];
        PoporUIVCInteractor * interactor = [PoporUIVCInteractor new];
        
        self.present = present;
        [present setMyInteractor:interactor];
        [present setMyView:self];
        
        [self addViews];
        [self startEvent];
    }
}

- (void)addViews {
    self.infoTV = [self addTVs];
    
}

// 开始执行事件,比如获取网络数据
- (void)startEvent {
    [self.present startEvent];
    
    //[UIAlertController showAt:self style:UIAlertControllerStyleAlert title:@"12" message:@"33" cancelTitle:@"22" cancelHandel:^(UIAlertAction * _Nonnull action) { }];
}

// -----------------------------------------------------------------------------
- (UITableView *)addTVs {
    UITableView * oneTV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    oneTV.delegate   = self.present;
    oneTV.dataSource = self.present;
    
    oneTV.allowsMultipleSelectionDuringEditing = YES;
    oneTV.directionalLockEnabled = YES;
    
    oneTV.estimatedRowHeight           = 0;
    oneTV.estimatedSectionHeaderHeight = 0;
    oneTV.estimatedSectionFooterHeight = 0;
    
    [self.view addSubview:oneTV];
    
    [oneTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    return oneTV;
}


@end
