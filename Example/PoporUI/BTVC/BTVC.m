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
    UIButton * oneBT = ({
        UIImage * image = [UIImage imageNamed:@"icon180"];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =  CGRectMake(100, 160, 200, 44);
        [button setTitle:@"123321  " forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor brownColor]];
        button.titleLabel.textAlignment = NSTextAlignmentRight;
        
        button.imageFrameBlock = ^CGRect(CGRect contentRect) {
            NSLog(@"image : %@", NSStringFromCGRect(contentRect));
            return CGRectMake(contentRect.size.width - image.size.width, 0, image.size.width, contentRect.size.height);
        };
        button.titleFrameBlock = ^CGRect(CGRect contentRect) {
            NSLog(@"title : %@", NSStringFromCGRect(contentRect));
            return CGRectMake(0, 0, contentRect.size.width - image.size.width, contentRect.size.height);
        };
        // button.titleLabel.font = [UIFont systemFontOfSize:17];
        button.layer.cornerRadius = 5;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 1;
        button.clipsToBounds = YES;
        
        [self.view addSubview:button];
        
        button;
    });
    
}

@end
