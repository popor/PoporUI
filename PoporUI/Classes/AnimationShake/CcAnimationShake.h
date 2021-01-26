//
//  CcAnimationShake.h
//  hywj
//
//  Created by popor on 2020/12/26.
//  Copyright © 2020 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PoporFoundation/PFeedbackGenerator.h>

@class CcAnimationShake;

static CGFloat KCvDelegate_ShakeDelayTime        = 0.05;
static CGFloat KCvDelegate_AnimationDurationTime = 0.2;

NS_ASSUME_NONNULL_BEGIN

// 只有动画
#define CvDelegate_CcAnimation \
\
- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {\
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];\
    [UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1.03, 1.03); }];\
}\
\
- (void)collectionView:(UICollectionView *)colView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {\
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];\
    [UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1, 1);}];\
}

// 只有震动
#define CvDelegate_CcShake \
\
- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {\
[CcAnimationShake share].shakeIP = indexPath;\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(KCvDelegate_ShakeDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ if ([CcAnimationShake share].shakeIP) { PFeedbackShakeLight; } });\
}\
\
- (void)collectionView:(UICollectionView *)colView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {\
[CcAnimationShake share].shakeIP = nil;\
}

// 动画和震动
#define CvDelegate_CcAnimationShake \
\
- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {\
UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];\
[UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1.03, 1.03); }];\
\
[CcAnimationShake share].shakeIP = indexPath;\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(KCvDelegate_ShakeDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ if ([CcAnimationShake share].shakeIP) { PFeedbackShakeLight; } });\
}\
\
- (void)collectionView:(UICollectionView *)colView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {\
UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];\
[UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1, 1);}];\
[CcAnimationShake share].shakeIP = nil;\
}

@interface CcAnimationShake : NSObject

@property (nonatomic, copy  ) NSIndexPath * _Nullable shakeIP;

+ (instancetype)share;

@end

NS_ASSUME_NONNULL_END
