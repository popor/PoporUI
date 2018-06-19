//
//  DispatchTool.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "DispatchTool.h"

@implementation DispatchTool

//	原始demo
//{
//    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(concurrentQueue, ^{
//        dispatch_sync(concurrentQueue, ^{
//            /*download the image here*/
//            [self.longPressDetailChatCell.myDetailChatEntity.imageBody asyncGetOriginalImageWithProgress:^(CGFloat progress){
//            } completion:^(NSData *imageData, NSError *aError){
//                NSLog(@"time 2");
//                [UIPasteboard generalPasteboard].image = [UIImage imageWithData:imageData];
//                NSLog(@"time 4");
//            }];
//        });
//        dispatch_sync(dispatch_get_main_queue(), ^{
//
//        });
//    });
//}

+ (void)bgBlock:(void(^)(void))bgBlock mainBlock:(void(^)(void))mainBlock
{
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        dispatch_sync(concurrentQueue, ^{
            if (bgBlock) {
                bgBlock();
            }
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (mainBlock) {
                mainBlock();
            }
        });
    });
}

@end
