//
//  BTVC.m
//  PoporUI_Example
//
//  Created by apple on 2019/9/20.
//  Copyright © 2019 wangkq. All rights reserved.
//

#import "BTVC.h"

#import "PoporUI.h"

#import "CBT.h"
#import <Masonry/Masonry.h>
#import <PoporFoundation/NSString+pAtt.h>

@interface BTVC ()

@property (nonatomic, strong) UIButton * testBT3;

@property (nonatomic, strong) UIButton * testBT4;

@end

@implementation BTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //NSLog(@"self.view.frame: %@", NSStringFromCGRect(self.view.frame));
    //[self addBt1]; // 自定义class
    //[self addBt2];
    //[self addBt3];
    
    [self addBt4];
}

// 自定义class
- (void)addBt1 {
    CBT * bt = [CBT buttonWithType:UIButtonTypeCustom];
    bt.frame= CGRectMake(60, 200, 100, 60);
    [bt setImage:[UIImage imageNamed:@"bt"] forState:UIControlStateNormal];
    [bt setTitle:@"wkq" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    bt.titleLabel.textAlignment = NSTextAlignmentCenter;
    [bt setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:bt];
    
}

- (void)addBt2 {
    
    UIButton * oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage * image = [UIImage imageNamed:@"q切换"];
    NSString * title = @"测试数据测试数据测试数据";
    //title = @"测试";
    [oneBT setImage:image forState:UIControlStateNormal];
    //[oneBT setImage:[UIImage imageFromColor:[UIColor colorWithRed:0.3 green:0.8 blue:0.3 alpha:0.3] size:CGSizeMake(30, 30)] forState:UIControlStateNormal];
    
    BOOL attTitle = NO;
    {
        attTitle = NO;
        //[oneBT setTitle:@"测试数据----123456测试数据----123456" forState:UIControlStateNormal];
        [oneBT setTitle:title forState:UIControlStateNormal];
        //[oneBT setTitle:@"测试" forState:UIControlStateNormal];
        [oneBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        oneBT.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    
    {
//        attTitle = YES;
//        NSMutableAttributedString * att = [NSMutableAttributedString new];
//        [att addString:@"测试数据----123456测试数据----123456测试数据----123456" font:[UIFont systemFontOfSize:16] color:[UIColor whiteColor] bgColor:[UIColor clearColor] underline:NO lineSpacing:10 textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByWordWrapping];
//
//        [oneBT setAttributedTitle:att forState:UIControlStateNormal];
    }

    
    oneBT.titleLabel.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0 alpha:0.3];
    oneBT.imageView.contentMode = UIViewContentModeCenter;
    
    [self.view addSubview:oneBT];
    
    // MARK: 1. 设置image和label位置 和间隔
    oneBT.frame =  CGRectMake(30, 120, 20, 20);
    // left 上下
    
    //[oneBT setEdgeType:PEdgeInsetType_Left       gap:20 image:image title:title titleWidth:80];
    //[oneBT setEdgeType:PEdgeInsetType_LeftTop    gap:40 image:image title:title titleWidth:280];
    //[oneBT setEdgeType:PEdgeInsetType_LeftBottom gap:20 image:image title:title titleWidth:180];
    
    // right 上下
    //[oneBT setEdgeType:PEdgeInsetType_Right       gap:40 image:image title:title titleWidth:80];
    //[oneBT setEdgeType:PEdgeInsetType_RightTop    gap:20 image:image title:title titleWidth:80];
    //[oneBT setEdgeType:PEdgeInsetType_RightBottom gap:40 image:image title:title titleWidth:80];
    
   
    // top 左右
    //[oneBT setEdgeType:PEdgeInsetType_Top       gap:40 image:image title:title titleWidth:80];
    //[oneBT setEdgeType:PEdgeInsetType_TopLeft   gap:40 image:image title:title titleWidth:80];
    //[oneBT setEdgeType:PEdgeInsetType_TopRight  gap:40 image:image title:title titleWidth:80];
    
    // bottom 左右
    //[oneBT setEdgeType:PEdgeInsetType_Bottom       gap:40 image:image title:title titleWidth:80];
    //[oneBT setEdgeType:PEdgeInsetType_BottomLeft   gap:40 image:image title:title titleWidth:80];
    //[oneBT setEdgeType:PEdgeInsetType_BottomRight  gap:40 image:image title:title titleWidth:80];
    
    
    // MARK: 2. 更新width, height, size等
    //[oneBT updateSize:CGSizeMake(300, 300) type:PEdgeInsetType_Left];
    //[oneBT updateSize:CGSizeMake(300, 300) type:PEdgeInsetType_Right];
    //[oneBT updateSize:CGSizeMake(300, 300) type:PEdgeInsetType_Top];
    //[oneBT updateSize:CGSizeMake(300, 300) type:PEdgeInsetType_Bottom];
    //[oneBT updateSize:CGSizeMake(300, 300) type:PEdgeInsetType_Center];
    {   // top 和 bottom, 尝试固定宽度
        /**
         修改了 top和bottom之后, 再去修改frame, 就会出错了. 这个时候可以修改bt.center.
         随便修改 width 之后, titleLabel 位置也需要修改.目前感觉比较麻烦.
         */
    }
    
    [oneBT setBackgroundImage:[UIImage imageFromColor:[UIColor redColor] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    oneBT.clipsToBounds = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"oneBT.frame: %@", NSStringFromCGRect(oneBT.frame));
    });
    
    {
        UIView * view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        view.frame = CGRectMake(100, CGRectGetMaxY(oneBT.frame) + 20, 20, 40);
        
        [self.view addSubview:view];
    };
    {
        UIView * view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        view.frame = CGRectMake(200, CGRectGetMaxY(oneBT.frame) + 20, 40, 20);
        
        [self.view addSubview:view];
    };
}

- (void)addBt3 {
    UIButton * arrowBT = ({
        UIButton * oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [oneBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        oneBT.titleLabel.font = [UIFont systemFontOfSize:20];
        
        //[oneBT setTitle:@"TEST" forState:UIControlStateNormal];
        
        [oneBT setImage:[UIImage imageNamed:@"arrowRightGray"] forState:UIControlStateNormal];
        //[oneBT setImage:[UIImage imageNamed:@"q切换"] forState:UIControlStateNormal];
        
        [oneBT addTarget:self action:@selector(btAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:oneBT];
        oneBT;
    });
    
    arrowBT.frame = CGRectMake(10, 200, 300, 20);
    [arrowBT setEdgeType:PEdgeInsetType_Right gap:10 image:arrowBT.imageView.image title:arrowBT.titleLabel.text titleWidth:100];

    // [arrowBT mas_makeConstraints:^(MASConstraintMaker *make) {
    //     make.left.mas_equalTo(10);
    //     make.top.mas_equalTo(200);
    //     //make.size.mas_equalTo(CGSizeMake(100, 60));
    // }];

    [arrowBT updateSize:CGSizeMake(arrowBT.width, 80) type:PEdgeInsetType_Center];
    [arrowBT updateSize:CGSizeMake(100, 0) type:PEdgeInsetType_Left];
    [arrowBT updateSize:CGSizeMake(300, 0) type:PEdgeInsetType_Right];
    
    {
        UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(editBT3Status)];
        // [item1 setTitleTextAttributes:@{NSFontAttributeName:Font16} forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItems = @[item1];
    }
    
    self.testBT3 = arrowBT;
}

- (void)btAction {
    NSLog(@"点击");
}

- (void)editBT3Status {
    UIButton * bt = self.testBT3;
    bt.tag = bt.tag + 1;
    // NSLog(@"bt.tag: %i -- %i", (int)bt.tag, (int)bt.tag % 5);
    NSString * title;
    switch (bt.tag % 5) {
        case 0: {
            //[bt setTitle:@" " forState:UIControlStateNormal];
            title = @"";
            break;
        }
        case 1: {
            title = @"1";
            break;
        }
        case 2: {
            title = @"22";
            break;
        }
        case 3: {
            title = @"333";
            break;
        }
        case 4: {
            title = @"4444";
            break;
        }
        default:
            break;
    }
    [bt setTitle:title forState:UIControlStateNormal];
 
    [bt setEdgeType:PEdgeInsetType_Right gap:10 image:bt.imageView.image title:title titleWidth:100];
}

- (void)addBt4 {
    UIButton * arrowBT = ({
        UIButton * oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [oneBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        oneBT.titleLabel.font = [UIFont systemFontOfSize:20];
        
        //[oneBT setTitle:@"TEST" forState:UIControlStateNormal];
        
        [oneBT setImage:[UIImage imageNamed:@"arrowRightGray"] forState:UIControlStateNormal];
        //[oneBT setImage:[UIImage imageNamed:@"q切换"] forState:UIControlStateNormal];
        
        [oneBT addTarget:self action:@selector(btAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:oneBT];
        oneBT;
    });
    
    arrowBT.frame = CGRectMake(10, 200, 300, 20);
    
    //    [arrowBT setImageInset:PEdgeInsetType_Right spaceGap:10 titleWidth:100 attTitle:NO];
    //
    //    // [arrowBT mas_makeConstraints:^(MASConstraintMaker *make) {
    //    //     make.left.mas_equalTo(10);
    //    //     make.top.mas_equalTo(200);
    //    //     //make.size.mas_equalTo(CGSizeMake(100, 60));
    //    // }];
    //
    //    [arrowBT updateSize:CGSizeMake(arrowBT.width, 80) type:PEdgeInsetType_Center];
    //    [arrowBT updateSize:CGSizeMake(100, 0) type:PEdgeInsetType_Left];
    //    [arrowBT updateSize:CGSizeMake(300, 0) type:PEdgeInsetType_Right];
    
    {
        UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(editBT4Status)];
        // [item1 setTitleTextAttributes:@{NSFontAttributeName:Font16} forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItems = @[item1];
    }
    
    self.testBT4 = arrowBT;
}

- (void)editBT4Status {
    UIButton * bt = self.testBT4;
    bt.tag = bt.tag + 1;
    // NSLog(@"bt.tag: %i -- %i", (int)bt.tag, (int)bt.tag % 5);
    NSString * title;
    switch (bt.tag % 5) {
        case 0: {
            //[bt setTitle:@" " forState:UIControlStateNormal];
            title = @"";
            break;
        }
        case 1: {
            title = @"1";
            break;
        }
        case 2: {
            title = @"22";
            break;
        }
        case 3: {
            title = @"333";
            break;
        }
        case 4: {
            title = @"4444";
            break;
        }
        default:
            break;
    }
    [bt setTitle:title forState:UIControlStateNormal];
    
    [bt setEdgeType:PEdgeInsetType_Left gap:10 image:bt.imageView.image title:title titleWidth:100];
}

@end
