
//
//  UILabelPhone.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UILabelPhone.h"
#import <PoporFoundation/NSString+Tool.h>

@implementation UILabelPhone

- (instancetype)init {
    if (self = [super init]) {
        if (!self.tapGR) {
            self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(phoneTapGRAction)];
            [self addGestureRecognizer:self.tapGR];
            self.userInteractionEnabled = YES;
        }
    }
    return self;
}

- (void)phoneTapGRAction {
    if (self.text.length > 0) {
        NSString * phone = [self.text replaceWithREG:@"-" newString:@""];
        phone = [NSString stringWithFormat:@"tel://%@", phone];
        
        //NSString * phone = [NSString stringWithFormat:@"tel://%@", self.text];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]];
    }
}

@end
