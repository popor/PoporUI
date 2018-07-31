//
//  PoporUIViewController.m
//  PoporUI
//
//  Created by wangkq on 06/19/2018.
//  Copyright (c) 2018 wangkq. All rights reserved.
//

#import "PoporUIViewController.h"

#import <PoporFoundation/PrefixFont.h>
#import <PoporFoundation/PrefixColor.h>
//#import "UIView+Extension.h"
#import <PoporFoundation/NSString+Tool.h>
#import <PoporFoundation/NSString+Size.h>

#import <PoporFoundation/PrefixFun.h>

#import "IToastKeyboard.h"

#import "UIImage+Tool.h"

@interface PoporUIViewController ()

@end

@implementation PoporUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //UIImage * clearImage = [UIImage imageFromColor:[UIColor clearColor] size:CGSizeMake(1, 1)];
    
    return;
    {
        UIImage * image = [UIImage imageFromImage:[UIImage imageNamed:@"icon180"] changecolor:[UIColor redColor]];
        
        UIImageView * oneIV = [[UIImageView alloc] initWithImage:image];
        oneIV.frame = CGRectMake(100, 100, image.size.height/2, image.size.height/2);
        
        [self.view addSubview:oneIV];
        
    }
    
    {
        UIImage * image = [UIImage imageFromImage:[UIImage imageNamed:@"icon180"] bgColor:[UIColor yellowColor]];
        
        UIImageView * oneIV = [[UIImageView alloc] initWithImage:image];
        oneIV.frame = CGRectMake(100, 200, image.size.height/2, image.size.height/2);
        
        [self.view addSubview:oneIV];
        
    }
    NSLog(@"1");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
