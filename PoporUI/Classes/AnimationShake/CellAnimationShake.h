//
//  CellAnimationShake.h
//  hywj
//
//  Created by popor on 2021/1/8.
//  Copyright © 2021 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PoporFoundation/PFeedbackGenerator.h>

@class CellAnimationShake;

static CGFloat KTvDelegate_ShakeDelayTime        = 0.05;
static CGFloat KTvDelegate_AnimationDurationTime = 0.2;

NS_ASSUME_NONNULL_BEGIN

// 只有动画
#define TvDelegate_CellAnimation \
\
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {\
UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];\
[UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1.03, 1.03); }];\
}\
\
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {\
UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];\
[UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1, 1);}];\
}

// 只有震动
#define TvDelegate_CellShake \
\
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {\
[CellAnimationShake share].shakeIP = indexPath;\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(KTvDelegate_ShakeDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ if ([CellAnimationShake share].shakeIP) { PFeedbackShakeLight; } });\
}\
\
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {\
[CellAnimationShake share].shakeIP = nil;\
}

// 动画和震动
#define TvDelegate_CellAnimationShake \
\
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {\
UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];\
[UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1.03, 1.03); }];\
\
[CellAnimationShake share].shakeIP = indexPath;\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(KTvDelegate_ShakeDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ if ([CellAnimationShake share].shakeIP) { PFeedbackShakeLight; } });\
}\
\
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {\
UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];\
[UIView animateWithDuration:KCvDelegate_AnimationDurationTime animations:^{ cell.transform = CGAffineTransformMakeScale(1, 1);}];\
[CellAnimationShake share].shakeIP = nil;\
}

@interface CellAnimationShake : NSObject

@property (nonatomic, copy  ) NSIndexPath * _Nullable shakeIP;

+ (instancetype)share;

@end

NS_ASSUME_NONNULL_END
