//
//  TfVC.m
//  PoporUI
//
//  Created by 王凯庆 on 2020/3/11.
//  Copyright © 2020 wangkq. All rights reserved.

#import "TfVC.h"
#import "TfVCPresenter.h"
#import "TfVCInteractor.h"

#import <Masonry/Masonry.h>
#import "UITextField+pFormat.h"
#import "UINavigationController+pSize.h"
#import "UIViewController+pTapEndEdit.h"

@interface TfVC ()

@property (nonatomic, strong) TfVCPresenter * present;

@end

@implementation TfVC

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
    
    [self startMonitorTapEdit];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self stopMonitorTapEdit];
}

- (void)viewDidLoad {
    [self assembleViper];
    [super viewDidLoad];
    
    if (!self.title) {
        self.title = @"TfVC";
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTapEndEditGRAction];
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
        TfVCPresenter * present = [TfVCPresenter new];
        TfVCInteractor * interactor = [TfVCInteractor new];
        
        self.present = present;
        [present setMyInteractor:interactor];
        [present setMyView:self];
        
        [self addViews];
        [self startEvent];
    }
}

- (void)addViews {
    UITextField * phoneTF;
    UITextField * moneyTF;
    UITextField * bankTF;
    UITextField * idTF;
    for (int i = 0; i<4; i++) {
        UITextField * oneTF = ({
            UITextField * tf = [UITextField new];
            tf.frame              = CGRectMake(0, 0, 0, 44);
            tf.backgroundColor    = [UIColor clearColor];
            tf.font               = [UIFont systemFontOfSize:15];
            tf.textColor          = [UIColor darkGrayColor];
            
            tf.layer.cornerRadius = 5;
            tf.layer.borderColor  = [UIColor lightGrayColor].CGColor;
            tf.layer.borderWidth  = 1;
            tf.clipsToBounds      = YES;
            
            tf.placeholder        = @"";
            tf.text               = @"";
            [self.view addSubview:tf];
            tf;
        });
        switch (i) {
            case 0: {
                phoneTF = oneTF;
                [oneTF mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.navigationController.topMargin + 15);
                    make.left.mas_equalTo(16);
                    make.height.mas_equalTo(40);
                    make.right.mas_equalTo(-16);
                }];
                break;
            }
            case 1: {
                moneyTF = oneTF;
                [oneTF mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(phoneTF.mas_bottom).mas_offset(15);
                    make.left.mas_equalTo(16);
                    make.height.mas_equalTo(40);
                    make.right.mas_equalTo(-16);
                }];
                break;
            }
            case 2: {
                bankTF = oneTF;
                [oneTF mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(moneyTF.mas_bottom).mas_offset(15);
                    make.left.mas_equalTo(16);
                    make.height.mas_equalTo(40);
                    make.right.mas_equalTo(-16);
                }];
                break;
            }
            case 3: {
                idTF = oneTF;
                [oneTF mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(bankTF.mas_bottom).mas_offset(15);
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
    
    phoneTF.text = @"12300001111";
    [phoneTF formatChinaPhone];
    
    moneyTF.text = @"12345678900.123";
    moneyTF.text = @".123";
    moneyTF.text = @"12345.123";
    moneyTF.text = @"000.123";
    [moneyTF formatMoneyUnit:4 gapWitdh:6];
    
    bankTF.text = @"11112222333344445555";
    [bankTF formatBankUnit:4];
    
    idTF.text = @"41052120000101222X";
    [idTF formatChinaIdcard];
    
}

// 开始执行事件,比如获取网络数据
- (void)startEvent {
    [self.present startEvent];
    
}

// -----------------------------------------------------------------------------

- (void)keyboardFrameChanged:(CGRect)rect duration:(CGFloat)duration show:(BOOL)show {
    //    if (show) {
    //        float height = rect.size.height;
    //        [UIView animateWithDuration:0.25 animations:^{
    //            [self.infoTV mas_updateConstraints:^(MASConstraintMaker *make) {
    //                make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, height, 0));
    //            }];
    //        }];
    //    }else{
    //        [UIView animateWithDuration:0.25 animations:^{
    //            [self.infoTV mas_updateConstraints:^(MASConstraintMaker *make) {
    //                make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    //            }];
    //        }];
    //    }
}



@end
