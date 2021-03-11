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
- (void)addCheckerViewsVertical:(NSArray * _Nullable)heightArray  {
    [self addCheckerViewsVertical:heightArray colorArray:nil lX:-1 btX:-1];
}

- (void)addCheckerViewsVertical:(NSArray * _Nullable)heightArray colorArray:(NSArray * _Nullable)colorArray lX:(CGFloat)lX btX:(CGFloat)btX {
    if (!colorArray) {
        colorArray = @[UIColor.greenColor, UIColor.brownColor, UIColor.blueColor];
    }
    // 基础View
    CGFloat baseViewY = self.frame.size.height *0.3;
    
    // 移除之前的baseView
    UIView * baseView = [self viewWithTag:kCheckerViewTag_vertical];
    if (baseView) {
        baseViewY = baseView.frame.origin.y;// 记录之前的 y
        
        [baseView removeFromSuperview];
        baseView = nil;
    }
    if (heightArray.count == 0) {
        return;
    }
    
    // 新增 baseView
    baseView = ({
        UIView * oneView = [UIView new];
        oneView.tag   = kCheckerViewTag_vertical;
        oneView.frame = CGRectMake(0, baseViewY, self.frame.size.width, 10);
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
    
    if (lX<0) {
        lX = MIN(self.frame.size.width *0.1, 20);
    }
    for (NSNumber * number in heightArray) {
        UILabel * oneL = CreateView();
        oneL.frame = CGRectMake(lX, 0, 20, number.floatValue);
        
        lX = CGRectGetMaxX(oneL.frame) + 20;
        IndicatorView(oneL);
    }
    
    // 增加按钮
    NSArray * titleArray = @[@"-", @"+"];
    if (btX<0) {
        btX = baseView.frame.size.width -30;
    }
    for (NSInteger i = 0; i<2; i++) {
        
        UIButton * oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBT.tag = i;
        
        oneBT.frame =  CGRectMake(btX, 24*i, 20, 20);
        [oneBT setTitle:titleArray[i] forState:UIControlStateNormal];
        [oneBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [oneBT setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.4]];
        
        oneBT.titleLabel.font    = [UIFont boldSystemFontOfSize:15];
        oneBT.layer.cornerRadius = 3;
        oneBT.layer.borderColor  = [UIColor lightGrayColor].CGColor;
        oneBT.layer.borderWidth  = 1;
        oneBT.clipsToBounds      = YES;
        
        [baseView addSubview:oneBT];
        
        [oneBT addTarget:self action:@selector(moveY:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)addCheckerViewsHorizon:(NSArray * _Nullable)widthArray {
    [self addCheckerViewsHorizon:widthArray colorArray:nil lY:-1 btY:-1];
}

- (void)addCheckerViewsHorizon:(NSArray * _Nullable)widthArray colorArray:(NSArray * _Nullable)colorArray lY:(CGFloat)lY btY:(CGFloat)btY {
    if (!colorArray) {
        colorArray = @[UIColor.greenColor, UIColor.brownColor, UIColor.blueColor];
    }
    // 基础View
    CGFloat baseViewX = self.frame.size.width *0.3;
    
    // 移除之前的baseView
    UIView * baseView = [self viewWithTag:kCheckerViewTag_horizon];
    if (baseView) {
        baseViewX = baseView.frame.origin.x; // 记录之前的 x
        
        [baseView removeFromSuperview];
        baseView = nil;
    }
    if (widthArray.count == 0) {
        return;
    }
    
    // 新增 baseView
    baseView = ({
        UIView * oneView = [UIView new];
        oneView.tag   = kCheckerViewTag_horizon;
        oneView.frame = CGRectMake(baseViewX, 0, 10, self.frame.size.height);
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
    
    // 增加文字
    if (lY<0) {
        lY = MIN(self.frame.size.height *0.1, 30);
    }
    for (NSNumber * number in widthArray) {
        UILabel * oneL = CreateView();
        oneL.frame = CGRectMake(0, lY, number.floatValue, 20);
        
        lY = CGRectGetMaxY(oneL.frame) + 20;
        IndicatorView(oneL);
    }
    
    // 增加按钮
    NSArray * titleArray = @[@"-", @"+"];
    if (btY < 0) {
        btY = MIN(baseView.frame.size.height - 100, baseView.frame.size.height *0.85);
    }
    
    for (NSInteger i = 0; i<2; i++) {
        
        UIButton * oneBT = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBT.tag = i;
        
        oneBT.frame =  CGRectMake(24*i, btY, 20, 20);
        [oneBT setTitle:titleArray[i] forState:UIControlStateNormal];
        [oneBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [oneBT setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.4]];
        
        oneBT.titleLabel.font    = [UIFont boldSystemFontOfSize:15];
        oneBT.layer.cornerRadius = 3;
        oneBT.layer.borderColor  = [UIColor lightGrayColor].CGColor;
        oneBT.layer.borderWidth  = 1;
        oneBT.clipsToBounds      = YES;
        
        [baseView addSubview:oneBT];
        
        [oneBT addTarget:self action:@selector(moveX:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)moveY:(UIButton *)bt {
    UIView * baseView = bt.superview;
    CGFloat y = baseView.frame.origin.y;
    if (bt.tag == 0) {
        y--;
    } else {
        y++;
    }
    baseView.frame = CGRectMake(baseView.frame.origin.x, y, baseView.frame.size.width, baseView.frame.size.height);
}

- (void)moveX:(UIButton *)bt {
    UIView * baseView = bt.superview;
    CGFloat x = baseView.frame.origin.x;
    if (bt.tag == 0) {
        x--;
    } else {
        x++;
    }
    baseView.frame = CGRectMake(x, baseView.frame.origin.y, baseView.frame.size.width, baseView.frame.size.height);
}

// 生成带圆角的阴影layer
+ (CAShapeLayer *)shadowLayer:(CGRect)rect
            byRoundingCorners:(UIRectCorner)corners
                  cornerRadii:(CGSize)cornerRadii
                  shadowColor:(UIColor * _Nullable)shadowColor
                shadowOpacity:(CGFloat)shadowOpacity
                 shadowOffset:(CGSize)shadowOffset
                    fillColor:(UIColor * _Nullable)fillColor
{
    UIBezierPath * path  = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer * layer = [[CAShapeLayer alloc] init];
    
    if (!shadowColor) {
        CGFloat value = 0.784;
        shadowColor = [UIColor colorWithRed:value green:value blue:value alpha:1];
    }
    if (shadowOpacity < 0) {
        shadowOpacity = 0.25;
    }
    if (!fillColor) {
        fillColor = UIColor.whiteColor;
    }
    // 阴影
    layer.shadowColor   = shadowColor.CGColor;
    layer.shadowOpacity = shadowOpacity;
    layer.shadowOffset  = shadowOffset;
    layer.shadowPath    = path.CGPath;
    layer.shadowRadius  = 7;
    
    // 把已经绘制好的贝塞尔曲线路径赋值给图层，然后图层根据path进行图像渲染render
    layer.path          = path.CGPath;
    
    // 设置填充颜色
    layer.fillColor     =  fillColor.CGColor;
    
    return layer;
}

// 设置指定的圆角
- (void)rectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii {
    UIBezierPath * path  = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    CAShapeLayer * layer = [[CAShapeLayer alloc]init];
    layer.frame = self.bounds;
    layer.path  = path.CGPath;
    
    self.layer.mask = layer;
}
@end
