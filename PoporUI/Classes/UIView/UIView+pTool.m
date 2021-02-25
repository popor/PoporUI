//
//  UIView+pTool.m
//  PoporUI
//
//  Created by popor on 2021/2/20.
//  Copyright © 2021年 popor. All rights reserved.
//

#import "UIView+pTool.h"

@implementation UIView (pTool)

- (void)cleanSelf {
    [self cleanSelfDelay:0];
}

- (void)cleanSelfDelay:(CGFloat)delay {
    delay = delay>0 ? delay:1;
    
    __block UIView * blockView = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [blockView removeFromSuperview];
        blockView = nil;
    });
}

#pragma mark - 测试宽度高度View
- (void)addCheckerViewsVertical:(NSArray *)heightArray  {
    [self addCheckerViewsVertical:heightArray colorArray:nil];
}

- (void)addCheckerViewsVertical:(NSArray *)heightArray colorArray:(NSArray * _Nullable)colorArray {
    if (!colorArray) {
        colorArray = @[UIColor.greenColor, UIColor.brownColor, UIColor.blueColor];
    }
    
    // 基础View
    UIView * baseView = ({
        UIView * oneView = [UIView new];
        oneView.frame = CGRectMake(0, self.frame.size.height *0.3, self.frame.size.width, 10);
        oneView.backgroundColor = UIColor.clearColor;
        [self addSubview:oneView];
        
        // 添加手势
        UIPanGestureRecognizer * tapGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panVerticalGr:)];
        [oneView addGestureRecognizer:tapGR];
        
        oneView;
    });
    
    __block NSInteger index = 0;
    void (^ IndicatorView)(UILabel *) = ^(UILabel * targetL){
        targetL.clipsToBounds = NO;
        targetL.userInteractionEnabled = NO;
        
        CGFloat width = self.frame.size.width;
        {
            UIView * view = [UIView new];
            view.frame = CGRectMake(-targetL.frame.origin.x, 0, width, 1);
            view.backgroundColor = UIColor.redColor;
            
            [targetL addSubview:view];
        }
        {
            UIView * view = [UIView new];
            view.frame = CGRectMake(-targetL.frame.origin.x, targetL.frame.size.height-1, width, 1);
            UIColor * color = colorArray[index%colorArray.count];
            view.backgroundColor = color;
            
            [targetL addSubview:view];
        }
        CGFloat height = MAX(baseView.frame.size.height, targetL.frame.size.height);
        baseView.frame = CGRectMake(baseView.frame.origin.x, baseView.frame.origin.y, baseView.frame.size.width, height);
        targetL.text = [NSString stringWithFormat:@"%li", (long)targetL.frame.size.height];
        
        index++;
    };
    
    UILabel * (^ CreateView)(void) = ^(void){
        UILabel * oneL = [UILabel new];
        oneL.backgroundColor = [UIColor.brownColor colorWithAlphaComponent:0.6];
        oneL.textColor       = UIColor.whiteColor;
        oneL.font            = [UIFont systemFontOfSize:15];
        oneL.textAlignment   = NSTextAlignmentCenter;
        
        oneL.adjustsFontSizeToFitWidth = YES;
        
        [baseView addSubview:oneL];
        return oneL;
    };
    
    CGFloat x = self.frame.size.width *0.3;
    for (NSNumber * number in heightArray) {
        UILabel * oneL = CreateView();
        oneL.frame = CGRectMake(x, 0, 20, number.floatValue);
        
        x = CGRectGetMaxX(oneL.frame) + 20;
        IndicatorView(oneL);
    }
}

- (void)addCheckerViewsHorizon:(NSArray *)widthArray {
    [self addCheckerViewsHorizon:widthArray colorArray:nil];
}

- (void)addCheckerViewsHorizon:(NSArray *)widthArray colorArray:(NSArray * _Nullable)colorArray {
    if (!colorArray) {
        colorArray = @[UIColor.greenColor, UIColor.brownColor, UIColor.blueColor];
    }
    
    // 基础View
    UIView * baseView = ({
        UIView * oneView = [UIView new];
        oneView.frame = CGRectMake(self.frame.size.width *0.3, 0, 10, self.frame.size.height);
        oneView.backgroundColor = UIColor.clearColor;
        [self addSubview:oneView];
        
        // 添加手势
        UIPanGestureRecognizer * tapGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHorizonGr:)];
        [oneView addGestureRecognizer:tapGR];
        
        oneView;
    });
    
    __block NSInteger index = 0;
    void (^ IndicatorView)(UILabel *) = ^(UILabel * targetL){
        targetL.clipsToBounds = NO;
        targetL.userInteractionEnabled = NO;
        
        CGFloat height = self.frame.size.height;
        {
            UIView * view = [UIView new];
            view.frame = CGRectMake(0, -targetL.frame.origin.y, 1, height);
            view.backgroundColor = UIColor.redColor;
            
            [targetL addSubview:view];
        }
        {
            UIView * view = [UIView new];
            view.frame = CGRectMake(targetL.frame.size.width -1, -targetL.frame.origin.y, 1, height);
            UIColor * color = colorArray[index%colorArray.count];
            view.backgroundColor = color;
            
            [targetL addSubview:view];
        }
        CGFloat width = MAX(baseView.frame.size.width, targetL.frame.size.width);
        baseView.frame = CGRectMake(baseView.frame.origin.x, baseView.frame.origin.y, width, baseView.frame.size.height);
        targetL.text = [NSString stringWithFormat:@"%li", (long)targetL.frame.size.width];
        
        index++;
    };
    
    UILabel * (^ CreateView)(void) = ^(void){
        UILabel * oneL = [UILabel new];
        oneL.backgroundColor = [UIColor.brownColor colorWithAlphaComponent:0.6];
        oneL.textColor       = UIColor.whiteColor;
        oneL.font            = [UIFont systemFontOfSize:15];
        oneL.textAlignment   = NSTextAlignmentCenter;
        
        oneL.adjustsFontSizeToFitWidth = YES;
        
        [baseView addSubview:oneL];
        return oneL;
    };
    
    CGFloat y = self.frame.size.height *0.3;
    for (NSNumber * number in widthArray) {
        UILabel * oneL = CreateView();
        oneL.frame = CGRectMake(0, y, number.floatValue, 20);
        
        y = CGRectGetMaxY(oneL.frame) + 20;
        IndicatorView(oneL);
    }
}

- (void)panVerticalGr:(UIPanGestureRecognizer *)gr {
    UIView * targetView = gr.view;
    CGPoint point = [gr translationInView:self];
    targetView.center = CGPointMake(targetView.center.x, targetView.center.y +point.y);
    [gr setTranslation:CGPointZero inView:self];
}

- (void)panHorizonGr:(UIPanGestureRecognizer *)gr {
    UIView * targetView = gr.view;
    CGPoint point = [gr translationInView:self];
    targetView.center = CGPointMake(targetView.center.x +point.x, targetView.center.y);
    [gr setTranslation:CGPointZero inView:self];
}

@end
