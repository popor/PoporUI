//
//  UITextField+pPlaceholder.h
//  Pods-PoporUI_Example
//
//  Created by apple on 2019/9/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (pPlaceholder)

// 需要优先设置: font、textalignment;
// 如果为空,则用默认值.
@property (nonatomic, strong) UIColor * placeholderColor;

@end

NS_ASSUME_NONNULL_END
