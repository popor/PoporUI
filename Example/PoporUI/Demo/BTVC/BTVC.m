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

@end

@implementation BTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"self.view.frame: %@", NSStringFromCGRect(self.view.frame));
    //[self addBt1];
    [self addBt2];
}

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
    UIImage * testImage = [UIImage imageNamed:@"q切换"];
    [oneBT setImage:testImage forState:UIControlStateNormal];
    
    BOOL attTitle = NO;
    {
        attTitle = NO;
        //[oneBT setTitle:@"测试数据----123456测试数据----123456" forState:UIControlStateNormal];
        [oneBT setTitle:@"测试数据测试数据测试数据" forState:UIControlStateNormal];
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
    // [oneBT setEdgeInsetType:PEdgeInsetType_Left spaceGap:230 titleWidth:80 attTitle:attTitle];
    // [oneBT setEdgeInsetType:PEdgeInsetType_LeftTop spaceGap:40 titleWidth:280 attTitle:attTitle];
    // [oneBT setEdgeInsetType:PEdgeInsetType_LeftBottom spaceGap:20 titleWidth:180 attTitle:attTitle];

    
    // right 上下
     [oneBT setEdgeInsetType:PEdgeInsetType_Right spaceGap:40 titleWidth:80 attTitle:attTitle];
    // [oneBT setEdgeInsetType:PEdgeInsetType_RightTop spaceGap:40 titleWidth:80 attTitle:attTitle];
    // [oneBT setEdgeInsetType:PEdgeInsetType_RightBottom spaceGap:20 titleWidth:80 attTitle:attTitle];
    
    
    // top 左右
    // [oneBT setEdgeInsetType:PEdgeInsetType_Top spaceGap:30 titleWidth:100 attTitle:attTitle];
    // [oneBT setEdgeInsetType:PEdgeInsetType_TopLeft spaceGap:30 titleWidth:300 attTitle:attTitle];
    // [oneBT setEdgeInsetType:PEdgeInsetType_TopRight spaceGap:20 titleWidth:300 attTitle:attTitle];
    
    
    // bottom 左右
    // [oneBT setEdgeInsetType:PEdgeInsetType_Bottom spaceGap:120 titleWidth:400 attTitle:attTitle];
    // [oneBT setEdgeInsetType:PEdgeInsetType_BottomLeft spaceGap:20 titleWidth:400 attTitle:attTitle];
    //  [oneBT setEdgeInsetType:PEdgeInsetType_BottomRight spaceGap:120 titleWidth:70 attTitle:attTitle];
    
    
    
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

@end
