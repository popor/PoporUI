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
    oneBT.frame =  CGRectMake(100, 100, 400, 44);
    [oneBT setTitle:@"测试数据----123456" forState:UIControlStateNormal];
    [oneBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    oneBT.titleLabel.font = [UIFont systemFontOfSize:16];
    oneBT.titleLabel.backgroundColor = [UIColor purpleColor];
    
    oneBT.imageView.contentMode = UIViewContentModeCenter;
    
    [self.view addSubview:oneBT];
    
    {   // left 和 right
        [oneBT setImage:[UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(30, 30)] forState:UIControlStateNormal];
        //[oneBT setEdgeInsetType:PEdgeInsetType_Right spaceGap:40 maxWidth:400];
        [oneBT setEdgeInsetType:PEdgeInsetType_Left spaceGap:40 maxWidth:400];
        
        [oneBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(120);
            make.left.mas_equalTo(100);
            //make.bottom.mas_equalTo(-20);
            make.height.mas_equalTo(oneBT.height);
        }];
    }
    {   // top 和 bottom
        //        oneBT.frame = CGRectMake(100, 220, 0, 0);
        //        UIImage * image = [UIImage imageFromColor:[UIColor blueColor] size:CGSizeMake(375/2, 30) corner:15 borderWidth:5 borderColor:[UIColor yellowColor]];
        //
        //        [oneBT setImage:image forState:UIControlStateNormal];
        //        //[oneBT setEdgeInsetType:PEdgeInsetType_Top spaceGap:20 maxWidth:400];
        //        [oneBT setEdgeInsetType:PEdgeInsetType_Bottom spaceGap:20 maxWidth:400];
        
    }
    [oneBT setBackgroundImage:[UIImage imageFromColor:[UIColor redColor] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    
    
    oneBT.clipsToBounds = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"oneBT.frame: %@", NSStringFromCGRect(oneBT.frame));
    });
}

@end
