#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PoporFoundation.h"
#import "NSArray+jsonDic.h"
#import "NSArray+Swizzling.h"
#import "NSMutableArray+chain.h"
#import "NSMutableArray+Swizzling.h"
#import "NSAssistant.h"
#import "NSData+dic.h"
#import "NSDate+Tool.h"
#import "NSDictionary+Swizzling.h"
#import "NSDictionary+tool.h"
#import "NSObject+Swizzling.h"
#import "NSObject+WMSafeKVO.h"
#import "NSString+email.h"
#import "NSString+format.h"
#import "NSString+IDCard.h"
#import "NSString+MD5.h"
#import "NSString+Size.h"
#import "NSString+Tool.h"
#import "NSURL+Swizzling.h"
#import "ScreenCommonSize.h"
#import "BlockMacroDefines.h"
#import "ColorPrefix.h"
#import "FontPrefix.h"
#import "FunctionPrefix.h"
#import "SizePrefix.h"

FOUNDATION_EXPORT double PoporFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char PoporFoundationVersionString[];

