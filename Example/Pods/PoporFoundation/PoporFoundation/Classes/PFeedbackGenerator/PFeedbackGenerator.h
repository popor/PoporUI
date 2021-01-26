//
//  PFeedbackGenerator.h
//  PoporFoundation
//
//  Created by popor on 2020/12/23.
//  Copyright © 2020 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#if TARGET_OS_IOS

#define PFeedbackShakePhone  [PFeedbackGenerator shakePhone];
#define PFeedbackShakeLight  [PFeedbackGenerator shakeLight];
#define PFeedbackShakeMedium [PFeedbackGenerator shakeMedium];
#define PFeedbackShakeHeavy  [PFeedbackGenerator shakeHeavy];

@interface PFeedbackGenerator : NSObject

@property (nonatomic        ) BOOL shakeEnable;
@property (nonatomic, strong) UISelectionFeedbackGenerator * _Nullable selectionFG API_AVAILABLE(ios(10.0));

+ (instancetype)share;

+ (void)shakePhone;

+ (void)shakeLight;
+ (void)shakeMedium;
+ (void)shakeHeavy;

// select fg 部分
+ (void)selectionFgPrepare;
+ (void)selectionFgChange;
+ (void)selectionFgEnd;

+ (BOOL)isDeviceSupportFeedback;

@end

#else

@interface PFeedbackGenerator : NSObject @end

#endif


NS_ASSUME_NONNULL_END
