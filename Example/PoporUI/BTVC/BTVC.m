//
//  BTVC.m
//  PoporUI_Example
//
//  Created by apple on 2019/9/20.
//  Copyright © 2019 wangkq. All rights reserved.
//

#import "BTVC.h"

#import "PoporUI.h"

@interface BTVC ()

@end

@implementation BTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addViews];
}

- (void)addViews {
    UIImage * image = [UIImage imageFromColor:[UIColor purpleColor] size:CGSizeMake(40, 100)];
    //UIImage * image = [UIImage imageFromColor:[UIColor purpleColor] size:CGSizeMake(240, 50)];
    //UIImage * image = [UIImage imageNamed:@"icon180"];
    
    UIButton * oneBT = ({
       
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame =  CGRectMake(60, 160, 200, 60);
        
        UIFont * font = [UIFont systemFontOfSize:16];
        [bt layoutHorizon_textImage_:image title:@"123321" font:font forState:UIControlStateNormal];
        
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bt setBackgroundColor:[UIColor brownColor]];
        bt.titleLabel.textAlignment = NSTextAlignmentRight;
        
        //[bt layoutHorizon_textImage:image title:@"123321" font:bt.titleLabel.font forState:UIControlStateNormal];
        
        [self.view addSubview:bt];
        bt;
    });
    return;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [oneBT layoutHorizon_textImage_:image title:@"12344321" font:oneBT.titleLabel.font forState:UIControlStateNormal];
    });
    //
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [oneBT layoutHorizon_textImage_:image title:@"1234554321" font:oneBT.titleLabel.font forState:UIControlStateNormal];
    });
    //
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [oneBT layoutHorizon_textImage_:image title:@"12345677654321" font:oneBT.titleLabel.font forState:UIControlStateNormal];
    });
}

@end
