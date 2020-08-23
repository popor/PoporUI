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
#import "NSObject+pSafeKVO.h"
#import "NSArray+pJsonDic.h"
#import "NSArray+pSwizzling.h"
#import "NSMutableArray+pChain.h"
#import "NSMutableArray+pSwizzling.h"
#import "NSAssistant.h"
#import "NSData+pDic.h"
#import "NSDate+pTool.h"
#import "NSDecimalNumber+pChain.h"
#import "NSDecimalNumber+pSwizzling.h"
#import "NSDictionary+pSwizzling.h"
#import "NSDictionary+pTool.h"
#import "NSFileManager+pTool.h"
#import "NSObject+pAssign.h"
#import "NSObject+pPerformSelector.h"
#import "NSObject+pSwizzling.h"
#import "NSAttributedString+pAtt.h"
#import "NSMutableAttributedString+pAtt.h"
#import "NSMutableParagraphStyle+pAtt.h"
#import "NSString+pAtt.h"
#import "NSString+pEmail.h"
#import "NSString+pIDCard.h"
#import "NSString+pMD5.h"
#import "NSString+pSize.h"
#import "NSString+pSwizzling.h"
#import "NSString+pTool.h"
#import "NSTimer+pSafe.h"
#import "NSURL+pSwizzling.h"
#import "Os+pPrefix.h"
#import "Block+pPrefix.h"
#import "Color+pPrefix.h"
#import "Font+pPrefix.h"
#import "Fun+pPrefix.h"
#import "Size+pPrefix.h"

FOUNDATION_EXPORT double PoporFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char PoporFoundationVersionString[];

