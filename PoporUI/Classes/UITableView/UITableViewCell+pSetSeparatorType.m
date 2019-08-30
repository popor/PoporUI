//
//  UITableViewCell+pSetSeparatorType.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UITableViewCell+pSetSeparatorType.h"

@implementation UITableViewCell (pSetSeparatorType)

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
