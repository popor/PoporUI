//
//  IToast_Popor.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "IToast_Popor.h"
#import <QuartzCore/QuartzCore.h>
#import "IToastPTool.h"

#import <PoporFoundation/NSString+pSize.h>

enum iToastDurationPopor {
    iToastDurationPoporLong = 10000,
    iToastDurationPoporShort = 1000,
    iToastDurationPoporNormal = 3000
}iToastDurationPopor;

#define CURRENT_TOAST_TAG 6984678

static const CGFloat kComponentPaddingW = 10;
static const CGFloat kComponentPaddingH = 5;

static iToastSettingsPopor *sharedSettings = nil;

@interface IToast_Popor(private)

- (IToast_Popor *) settings;
- (CGRect)_toastFrameForImageSize:(CGSize)imageSize withLocation:(iToastImageLocationPopor)location andTextSize:(CGSize)textSize;
- (CGRect)_frameForImage:(iToastTypePopor)type inToastFrame:(CGRect)toastFrame;

@end

@interface IToast_Popor ()

@property (nonatomic, weak  ) IToastPTool * itool;
@property (nonatomic, weak  ) UIView      * view;

@end


@implementation IToast_Popor

- (id) initWithText:(NSString *) tex{
    if (self = [super init]) {
        self.itool = [IToastPTool share];
        text       = [tex copy];
    }
    
    return self;
}

- (void) show{
    
    [self show:iToastTypePoporNone];
}

- (void) show:(iToastTypePopor) type {
    
    iToastSettingsPopor *theSettings = [iToastSettingsPopor getSharedSettings];
    
    if (!theSettings) {
        theSettings = [iToastSettingsPopor getSharedSettings];
    }
    
    UIImage *image = [theSettings.images valueForKey:[NSString stringWithFormat:@"%i", type]];
    
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize textSize = [text sizeInFont:font width:280];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height + kComponentPaddingH)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = font;
    label.text = text;
    label.numberOfLines = 0;
    label.shadowColor = [UIColor darkGrayColor];
    label.shadowOffset = CGSizeMake(1, 1);
    label.textAlignment=NSTextAlignmentCenter;
    
    UIButton *showBT = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        showBT.frame = [self _toastFrameForImageSize:image.size withLocation:[theSettings imageLocation] andTextSize:textSize];
        
        switch ([theSettings imageLocation]) {
            case iToastImageLocationPoporLeft:
                [label setTextAlignment:NSTextAlignmentLeft];
                label.center = CGPointMake(image.size.width + kComponentPaddingW * 2
                                           + (showBT.frame.size.width - image.size.width - kComponentPaddingW * 2) / 2,
                                           showBT.frame.size.height / 2);
                break;
            case iToastImageLocationPoporTop:
                [label setTextAlignment:NSTextAlignmentCenter];
                label.center = CGPointMake(showBT.frame.size.width / 2,
                                           (image.size.height + kComponentPaddingH * 2
                                            + (showBT.frame.size.height - image.size.height - kComponentPaddingH * 2) / 2));
                break;
            default:
                break;
        }
        
    } else {
        showBT.frame = CGRectMake(0, 0, textSize.width + kComponentPaddingW * 2, textSize.height + kComponentPaddingH * 2);
        label.center = CGPointMake(showBT.frame.size.width / 2, showBT.frame.size.height / 2);
    }
    //  wkq 隐藏
    //	CGRect lbfrm = label.frame;
    //	lbfrm.origin.x = ceil(lbfrm.origin.x);
    //	lbfrm.origin.y = ceil(lbfrm.origin.y);
    //	label.frame = lbfrm;
    [showBT addSubview:label];
    
    if (image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = [self _frameForImage:type inToastFrame:showBT.frame];
        [showBT addSubview:imageView];
    }
    
    showBT.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    showBT.layer.cornerRadius = 5;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    CGPoint point = CGPointZero;
    
    // Set correct orientation/location regarding device orientation
    UIInterfaceOrientation orientation = (UIInterfaceOrientation)[[UIApplication sharedApplication] statusBarOrientation];
    switch (orientation) {
        case UIDeviceOrientationPortrait:
        {
            if (theSettings.gravity == iToastGravityPoporTop) {
                point = CGPointMake(window.frame.size.width / 2, 45);
            } else if (theSettings.gravity == iToastGravityPoporBottom) {
                point = CGPointMake(window.frame.size.width / 2, window.frame.size.height - 45);
            } else if (theSettings.gravity == iToastGravityPoporCenter) {
#pragma mark - 王凯庆更改,假如键盘弹开了,那么在键盘上面.
                point = CGPointMake(window.frame.size.width/2, (window.frame.size.height - self.itool.keyboardH)/2);
            } else {
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x + offsetLeft, point.y + offsetTop + 0);
            break;
        }
        case UIDeviceOrientationPortraitUpsideDown:
        {
            //showBT.transform = CGAffineTransformMakeRotation(M_PI);
            
            float width = window.frame.size.width;
            float height = window.frame.size.height;
            
            if (theSettings.gravity == iToastGravityPoporTop) {
                point = CGPointMake(width / 2, height - 45);
            } else if (theSettings.gravity == iToastGravityPoporBottom) {
                point = CGPointMake(width / 2, 45);
            } else if (theSettings.gravity == iToastGravityPoporCenter) {
                point = CGPointMake(width/2, height/2);
            } else {
                // TODO : handle this case
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x - offsetLeft, point.y - offsetTop );
            break;
        }
        case UIDeviceOrientationLandscapeLeft:
        {
            //showBT.transform = CGAffineTransformMakeRotation(M_PI/2); //rotation in radians
            
            if (theSettings.gravity == iToastGravityPoporTop) {
                point = CGPointMake(window.frame.size.width - 45, window.frame.size.height / 2);
            } else if (theSettings.gravity == iToastGravityPoporBottom) {
                point = CGPointMake(45,window.frame.size.height / 2);
            } else if (theSettings.gravity == iToastGravityPoporCenter) {
                //point = CGPointMake(window.frame.size.width/2, window.frame.size.height/2);
#pragma mark - 王凯庆更改,假如键盘弹开了,那么在键盘上面.
                point = CGPointMake(window.frame.size.width/2, (window.frame.size.height - self.itool.keyboardH)/2);
            } else {
                // TODO : handle this case
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x - offsetTop, point.y - offsetLeft );
            break;
        }
        case UIDeviceOrientationLandscapeRight:
        {
            //showBT.transform = CGAffineTransformMakeRotation(-M_PI/2);
            
            if (theSettings.gravity == iToastGravityPoporTop) {
                point = CGPointMake(45, window.frame.size.height / 2);
            } else if (theSettings.gravity == iToastGravityPoporBottom) {
                point = CGPointMake(window.frame.size.width - 45, window.frame.size.height/2);
            } else if (theSettings.gravity == iToastGravityPoporCenter) {
                //point = CGPointMake(window.frame.size.width/2, window.frame.size.height/2);
#pragma mark - 王凯庆更改,假如键盘弹开了,那么在键盘上面.
                point = CGPointMake(window.frame.size.width/2, (window.frame.size.height - self.itool.keyboardH)/2);
            } else {
                // TODO : handle this case
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x + offsetTop, point.y + offsetLeft );
            break;
        }
        default:
            break;
    }
    
    showBT.center = point;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((float)theSettings.duration/1000 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideToast];
    });
    
    showBT.tag = CURRENT_TOAST_TAG;
    
    UIView *currentToast = [window viewWithTag:CURRENT_TOAST_TAG];
    if (currentToast != nil) {
        [currentToast removeFromSuperview];
    }
    
    showBT.alpha = 0;
    [window addSubview:showBT];
    //[window bringSubviewToFront:showBT];
    
    [UIView beginAnimations:nil context:nil];
    showBT.alpha = 1;
    [UIView commitAnimations];
    
    self.view = showBT;
    
    [showBT addTarget:self action:@selector(hideToast) forControlEvents:UIControlEventTouchDown];
}

- (CGRect)_toastFrameForImageSize:(CGSize)imageSize withLocation:(iToastImageLocationPopor)location andTextSize:(CGSize)textSize {
    CGRect theRect = CGRectZero;
    switch (location) {
        case iToastImageLocationPoporLeft:
            theRect = CGRectMake(0, 0,
                                 imageSize.width + textSize.width + kComponentPaddingW * 3,
                                 MAX(textSize.height, imageSize.height) + kComponentPaddingH * 2);
            break;
        case iToastImageLocationPoporTop:
            theRect = CGRectMake(0, 0,
                                 MAX(textSize.width, imageSize.width) + kComponentPaddingW * 2,
                                 imageSize.height + textSize.height + kComponentPaddingH * 3);
            
        default:
            break;
    }
    return theRect;
}

- (CGRect)_frameForImage:(iToastTypePopor)type inToastFrame:(CGRect)toastFrame {
    iToastSettingsPopor *theSettings = [iToastSettingsPopor getSharedSettings];
    UIImage *image = [theSettings.images valueForKey:[NSString stringWithFormat:@"%i", type]];
    
    if (!image) return CGRectZero;
    
    CGRect imageFrame = CGRectZero;
    
    switch ([theSettings imageLocation]) {
        case iToastImageLocationPoporLeft:
            imageFrame = CGRectMake(kComponentPaddingW, (toastFrame.size.height - image.size.height) / 2, image.size.width, image.size.height);
            break;
        case iToastImageLocationPoporTop:
            imageFrame = CGRectMake((toastFrame.size.width - image.size.width) / 2, kComponentPaddingH, image.size.width, image.size.height);
            break;
            
        default:
            break;
    }
    
    return imageFrame;
    
}

- (void) hideToast {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.view.alpha = 0;
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [IToast_Popor destroyObject:self];
            });
        }];
    });
}

+ (void)destroyObject:(id)object {
    object = nil;
}

- (void) removeToast:(NSTimer*)theTimer{
    [self.view removeFromSuperview];
}


+ (IToast_Popor *) makeText:(NSString *) _text{
    IToast_Popor *toast = [[IToast_Popor alloc] initWithText:_text];
    
    return toast;
}


- (IToast_Popor *) setDuration:(NSInteger ) duration{
    [iToastSettingsPopor getSharedSettings].duration = duration;
    return self;
}

- (IToast_Popor *) setGravity:(iToastGravityPopor) gravity
             offsetLeft:(NSInteger) left
              offsetTop:(NSInteger) top{
    [iToastSettingsPopor getSharedSettings].gravity = gravity;
    offsetLeft = left;
    offsetTop = top;
    return self;
}

- (IToast_Popor *) setGravity:(iToastGravityPopor) gravity{
    [iToastSettingsPopor getSharedSettings].gravity = gravity;
    return self;
}

- (IToast_Popor *) setPostion:(CGPoint) _position{
    [iToastSettingsPopor getSharedSettings].postition = CGPointMake(_position.x, _position.y);
    
    return self;
}

@end


@implementation iToastSettingsPopor
@synthesize duration;
@synthesize gravity;
@synthesize postition;
@synthesize images;
@synthesize imageLocation;

- (void) setImage:(UIImage *) img withLocation:(iToastImageLocationPopor)location forType:(iToastTypePopor) type {
    if (type == iToastTypePoporNone) {
        // This should not be used, internal use only (to force no image)
        return;
    }
    
    if (!images) {
        images = [[NSMutableDictionary alloc] initWithCapacity:4];
    }
    
    if (img) {
        NSString *key = [NSString stringWithFormat:@"%i", type];
        [images setValue:img forKey:key];
    }
    
    [self setImageLocation:location];
}

- (void)setImage:(UIImage *)img forType:(iToastTypePopor)type {
    [self setImage:img withLocation:iToastImageLocationPoporLeft forType:type];
}


+ (iToastSettingsPopor *) getSharedSettings{
    if (!sharedSettings) {
        sharedSettings = [iToastSettingsPopor new];
        sharedSettings.gravity = iToastGravityPoporCenter;
        sharedSettings.duration = iToastDurationPoporShort;
    }
    
    return sharedSettings;
    
}

- (id) copyWithZone:(NSZone *)zone{
    iToastSettingsPopor *copy = [iToastSettingsPopor new];
    copy.gravity = self.gravity;
    copy.duration = self.duration;
    copy.postition = self.postition;
    
    NSArray *keys = [self.images allKeys];
    
    for (NSString *key in keys){
        [copy setImage:[images valueForKey:key] forType:[key intValue]];
    }
    
    [copy setImageLocation:imageLocation];
    
    return copy;
}



@end
