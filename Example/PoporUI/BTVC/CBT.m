//
//  CBT.m
//  BTDemo
//
//  Created by 王凯庆 on 2020/2/15.
//  Copyright © 2020 王凯庆. All rights reserved.
//

#import "CBT.h"

@implementation CBT

//- (CGRect)contentRectForBounds:(CGRect)bounds {
//    NSLog(@"    %p bounds: %@", self, NSStringFromCGRect(bounds));
//    return bounds;
//}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    NSLog(@"文字");
    return CGRectMake(0, 30, 100, 30);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    NSLog(@"图片");
    return CGRectMake(30, 6, 20, 20);
}

@end
