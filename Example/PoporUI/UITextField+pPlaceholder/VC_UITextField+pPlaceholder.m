//
//  VC_UITextField+pPlaceholder.m
//  PoporUI_Example
//
//  Created by apple on 2019/9/16.
//  Copyright © 2019 wangkq. All rights reserved.
//

#import "VC_UITextField+pPlaceholder.h"

#import "UITextField+pPlaceholder.h"
#import "UITextField+pInsets.h"

@interface VC_UITextField_pPlaceholder ()

@end

@implementation VC_UITextField_pPlaceholder

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"输入框默认文字颜色";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField * oneTF = ({
        UITextField * tf = [UITextField new];
        tf.frame              = CGRectMake(0, 0, 0, 44);
        tf.backgroundColor    = [UIColor clearColor];
        tf.font               = [UIFont systemFontOfSize:16];
        tf.textColor          = [UIColor greenColor];
        tf.textAlignment      = NSTextAlignmentLeft;
        tf.placeholderColor   = [UIColor redColor];
        tf.textInset          = UIEdgeInsetsMake(0, 10, 0, 10);
        
        tf.layer.cornerRadius = 5;
        tf.layer.borderColor  = [UIColor lightGrayColor].CGColor;
        tf.layer.borderWidth  = 1;
        tf.clipsToBounds      = YES;
        
        tf.placeholder        = @"请输入文字";
        tf.text               = @"";
        [self.view addSubview:tf];
        tf;
    });
    
    oneTF.frame = CGRectMake(16, 160, 200, 30);
}

@end
