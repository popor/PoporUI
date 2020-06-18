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

@interface BTVC ()

@end

@implementation BTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"self.view.frame: %@", NSStringFromCGRect(self.view.frame));
    //[self addViews];
    //[self addBt1];
    [self addBt2];
}

- (void)addViews {
    UIImage * image = [UIImage imageFromColor:[UIColor purpleColor] size:CGSizeMake(40, 100)];
    //UIImage * image = [UIImage imageFromColor:[UIColor purpleColor] size:CGSizeMake(240, 50)];
    //UIImage * image = [UIImage imageNamed:@"icon180"];

    UIButton * oneBT = ({

        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame =  CGRectMake(60, 160, 200, 60);

        UIFont * font = [UIFont systemFontOfSize:16];
        // [bt layoutHorizon_textImage_:image title:@"123321" font:font forState:UIControlStateNormal];

        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bt setBackgroundColor:[UIColor brownColor]];
        bt.titleLabel.textAlignment = NSTextAlignmentRight;

        //[bt layoutHorizon_textImage:image title:@"123321" font:bt.titleLabel.font forState:UIControlStateNormal];

        [self.view addSubview:bt];
        bt;
    });
    return;
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [oneBT layoutHorizon_textImage_:image title:@"12344321" font:oneBT.titleLabel.font forState:UIControlStateNormal];
    //    });
    //    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [oneBT layoutHorizon_textImage_:image title:@"1234554321" font:oneBT.titleLabel.font forState:UIControlStateNormal];
    //    });
    //    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [oneBT layoutHorizon_textImage_:image title:@"12345677654321" font:oneBT.titleLabel.font forState:UIControlStateNormal];
    //    });
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
    
    [oneBT setTitle:@"测试数据----123456测试数据----123456" forState:UIControlStateNormal];
    //[oneBT setTitle:@"测试数据测试数据测试数据" forState:UIControlStateNormal];
    //[oneBT setTitle:@"测试" forState:UIControlStateNormal];
    [oneBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    oneBT.titleLabel.font = [UIFont systemFontOfSize:16];
    oneBT.titleLabel.backgroundColor = [UIColor purpleColor];
    
    oneBT.imageView.contentMode = UIViewContentModeCenter;
    
    [self.view addSubview:oneBT];
    
    {   // left 和 right
        //        oneBT.frame =  CGRectMake(100, 100, 20, 20);
        //        [oneBT setImage:[UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(30, 10)] forState:UIControlStateNormal];
        //        //[oneBT setEdgeInsetType:PEdgeInsetType_Right spaceGap:40 maxWidth:80];
        //        [oneBT setEdgeInsetType:PEdgeInsetType_Left spaceGap:40 maxWidth:80];
    }
    {   // left 上下
        //        oneBT.frame =  CGRectMake(100, 100, 20, 20);
        //        [oneBT setImage:[UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(30, 10)] forState:UIControlStateNormal];
        //        //[oneBT setEdgeInsetType:PEdgeInsetType_LeftTop spaceGap:40 maxWidth:80];
        //        [oneBT setEdgeInsetType:PEdgeInsetType_LeftBottom spaceGap:40 maxWidth:80];
    }
    {   // right 上下
        //        oneBT.frame =  CGRectMake(100, 100, 20, 20);
        //        [oneBT setImage:[UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(30, 10)] forState:UIControlStateNormal];
        //        [oneBT setEdgeInsetType:PEdgeInsetType_RightTop spaceGap:40 maxWidth:80];
        //        //[oneBT setEdgeInsetType:PEdgeInsetType_RightBottom spaceGap:40 maxWidth:80];
    }
    
    {   // top 和 bottom
        //        oneBT.frame = CGRectMake(100, 220, 0, 0);
        //        UIImage * image = [UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(40, 30) corner:15 borderWidth:5 borderColor:[UIColor yellowColor]];
        //
        //        [oneBT setImage:image forState:UIControlStateNormal];
        //        [oneBT setEdgeInsetType:PEdgeInsetType_Top spaceGap:20 maxWidth:60];
        //        //[oneBT setEdgeInsetType:PEdgeInsetType_Bottom spaceGap:20 maxWidth:80];
    }
    {   // top 左右
        //        oneBT.frame = CGRectMake(100, 220, 0, 0);
        //        UIImage * image = [UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(40, 30) corner:15 borderWidth:5 borderColor:[UIColor yellowColor]];
        //
        //        [oneBT setImage:image forState:UIControlStateNormal];
        //        //[oneBT setEdgeInsetType:PEdgeInsetType_TopLeft spaceGap:20 maxWidth:100];
        //        [oneBT setEdgeInsetType:PEdgeInsetType_TopRight spaceGap:20 maxWidth:100];
    }
    {   // bottom 左右
        oneBT.frame = CGRectMake(100, 220, 0, 0);
        UIImage * image = [UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(40, 30) corner:15 borderWidth:5 borderColor:[UIColor yellowColor]];
        
        [oneBT setImage:image forState:UIControlStateNormal];
        //[oneBT setEdgeInsetType:PEdgeInsetType_BottomLeft spaceGap:20 maxWidth:60];
        [oneBT setEdgeInsetType:PEdgeInsetType_BottomRight spaceGap:20 maxWidth:80];
    }
    
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
