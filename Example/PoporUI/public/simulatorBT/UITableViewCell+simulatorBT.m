//
//  UITableViewCell+simulatorBT.m
//  hywj
//
//  Created by popor on 2020/7/25.
//  Copyright © 2020 popor. All rights reserved.
//

#import "UITableViewCell+simulatorBT.h"
#import "UIImage+pCreate.h"

#if TARGET_IPHONE_SIMULATOR//模拟器
#import <PoporFoundation/NSObject+pSwizzling.h>

#elif TARGET_OS_IPHONE//真机

#endif

@implementation UITableViewCell (simulatorBT)

#if TARGET_IPHONE_SIMULATOR//模拟器
+ (void)load {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        [objc_getClass("UITableViewCell") methodSwizzlingWithOriginalSelector:@selector(initWithStyle:reuseIdentifier:)  bySwizzledSelector:@selector(simulatorInitWithStyle:reuseIdentifier:)];
        
    });
}

- (instancetype)simulatorInitWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    UITableViewCell * cell = [self simulatorInitWithStyle:style reuseIdentifier:reuseIdentifier];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [cell addBTTapAction];
    });
    
    return cell;
}

- (void)addBTTapAction {
    CGSize size = CGSizeMake(44, 44);
    static UIImage * imageN;
    static UIImage * imageS;
    if (!imageN) {
        imageN = [UIImage imageFromColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] size:size corner:size.height/2];
        imageS = [UIImage imageFromColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7] size:size corner:size.height/2];
    }
    
    {
        UIButton * oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBT.frame =  CGRectMake(0, 0, size.width, size.height);
        //[oneBT setTitle:@"点击" forState:UIControlStateNormal];
        //[oneBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [oneBT setBackgroundImage:imageN forState:UIControlStateNormal];
        [oneBT setBackgroundImage:imageS forState:UIControlStateHighlighted];
        
        [self.contentView addSubview:oneBT];
        
        [oneBT addTarget:self action:@selector(simulatorBTAction) forControlEvents:UIControlEventTouchUpInside];
        
    };
}

- (void)simulatorBTAction {
    UITableView * tableView;
    UIView * superView = self;
    for (NSInteger i = 0; i<5; i++) {
        superView = superView.superview;
        if ([superView isKindOfClass:[UITableView class]]) {
            tableView = (UITableView *)superView;
            break;
        }
    }
    if (tableView && tableView.delegate) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [tableView.delegate tableView:tableView didSelectRowAtIndexPath:[tableView indexPathForCell:self]];
        });
    }
}

#elif TARGET_OS_IPHONE//真机

#endif

@end

