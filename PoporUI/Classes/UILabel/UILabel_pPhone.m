
//
//  UILabel_pPhone.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UILabel_pPhone.h"
#import <PoporFoundation/NSString+pTool.h>

@implementation UILabel_pPhone

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
        // tel: 这个打完电话会留在电话APP
        // telprompt: 这个打完电话会返回自己APP
        phone = [NSString stringWithFormat:@"telprompt://%@", phone];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]];
    }
}

@end
