//
//  UITableViewCell+SetSeparatorType.m
//  WanziTG
//
//  Created by 王凯庆 on 2017/1/6.
//  Copyright © 2017年 wanzi. All rights reserved.
//

#import "UITableViewCell+SetSeparatorType.h"

@implementation UITableViewCell (SetSeparatorType)

- (void)setSeparatorX:(float)x
{
    /* first
     {
     // 初始化
     if ([self.infoTV respondsToSelector:@selector(setSeparatorInset:)]) {
     [self.infoTV setSeparatorInset:UIEdgeInsetsZero];
     }
     if ([self.infoTV respondsToSelector:@selector(setLayoutMargins:)]) {
     [self.infoTV setLayoutMargins:UIEdgeInsetsZero];
     }
     }
     second
     -(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
     {
     [cell setSeparatorX:1];
     }
     
     //*/
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0, x, 0, 0)];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0, x, 0, 0)];
    }
}

@end
