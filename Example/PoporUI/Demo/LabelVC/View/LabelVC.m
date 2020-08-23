//
//  LabelVC.m
//  PoporUI
//
//  Created by 王凯庆 on 2020/3/10.
//  Copyright © 2020 wangkq. All rights reserved.

#import "LabelVC.h"
#import "LabelVCPresenter.h"
#import "LabelVCInteractor.h"
#import <Masonry/Masonry.h>
#import "UILabel+pFormat.h"
#import <UIDevice+pScreenSize.h>

@interface LabelVC ()

@property (nonatomic, strong) LabelVCPresenter * present;

@end

@implementation LabelVC

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        if (dic) {
            self.title = dic[@"title"];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [self assembleViper];
    [super viewDidLoad];
    
    if (!self.title) {
        self.title = @"LabelVC";
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
        LabelVCPresenter * present = [LabelVCPresenter new];
        LabelVCInteractor * interactor = [LabelVCInteractor new];
        
        self.present = present;
        [present setMyInteractor:interactor];
        [present setMyView:self];
        
        [self addViews];
        [self startEvent];
    }
}

- (void)addViews {
    UILabel * phoneL;
    UILabel * moneyL;
    UILabel * bankL;
    UILabel * idCardL;
    for (int i = 0; i<4; i++) {
        UILabel * oneL = ({
            UILabel * l = [UILabel new];
            l.frame              = CGRectMake(0, 0, 0, 44);
            l.backgroundColor    = [UIColor clearColor];
            l.font               = [UIFont systemFontOfSize:15];
            l.textColor          = [UIColor darkGrayColor];
            
            l.numberOfLines      = 1;
            
            l.layer.cornerRadius = 5;
            l.layer.borderColor  = [UIColor lightGrayColor].CGColor;
            l.layer.borderWidth  = 1;
            l.clipsToBounds      = YES;
            
            [self.view addSubview:l];
            l;
        });
        
        switch (i) {
            case 0: {
                phoneL = oneL;
                [oneL mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo([UIDevice statusBarHeight] + 15);
                    make.left.mas_equalTo(16);
                    make.height.mas_equalTo(40);
                    make.right.mas_equalTo(-16);
                }];
                break;
            }
            case 1: {
                moneyL = oneL;
                [oneL mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(phoneL.mas_bottom).mas_offset(15);
                    make.left.mas_equalTo(16);
                    make.height.mas_equalTo(40);
                    make.right.mas_equalTo(-16);
                }];
                break;
            }
            case 2: {
                bankL = oneL;
                [oneL mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(moneyL.mas_bottom).mas_offset(15);
                    make.left.mas_equalTo(16);
                    make.height.mas_equalTo(40);
                    make.right.mas_equalTo(-16);
                }];
                break;
            }
            case 3:{
                idCardL = oneL;
                [oneL mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(bankL.mas_bottom).mas_offset(15);
                    make.left.mas_equalTo(16);
                    make.height.mas_equalTo(40);
                    make.right.mas_equalTo(-16);
                }];
                break;
            }
            default:
                break;
        }
    }
    
    phoneL.text = @"12300001111";
    [phoneL formatChinaPhone];
    
    moneyL.text = @"123456789.1234567";
    [moneyL formatMoneyUnit:4 gapWitdh:6];
    
    bankL.text = @"11112222333344445555";
    [bankL formatBankUnit:4];
    
    idCardL.text = @"41052120000101222X";
    [idCardL formatChinaIdcard];
}

// 开始执行事件,比如获取网络数据
- (void)startEvent {
    [self.present startEvent];
    
}

// -----------------------------------------------------------------------------



@end
