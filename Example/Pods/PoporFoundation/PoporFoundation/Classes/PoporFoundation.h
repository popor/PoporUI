//
//  PoporFoundationExtension.h
//  PoporFoundationExtension
//
//  Created by popor on 2018/6/13.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for PoporFoundationExtension.
FOUNDATION_EXPORT double PoporFoundationExtensionVersionNumber;

//! Project version string for PoporFoundationExtension.
FOUNDATION_EXPORT const unsigned char PoporFoundationExtensionVersionString[];

/*
 .宏将来用P开头,全部大写,或者中间穿插'_',防止和其他冲突
 .category类型采用p开头
 .不太重要的参数继续采用驼峰命名,或者逐渐放弃.
 
 //*/

// - KVO
#import "NSObject+pSafeKVO.h"

// - NSArray
#import "NSArray+pJsonDic.h"
#import "NSArray+pSwizzling.h"
#import "NSMutableArray+pChain.h"
#import "NSMutableArray+pSwizzling.h"

// - NSAssistant
#import "NSAssistant.h"

// -NSData
#import "NSData+pDic.h"

// -NSDate
#import "NSDate+pTool.h"

// -NSDecimalNumber
#import "NSDecimalNumber+pChain.h"
#import "NSDecimalNumber+pSwizzling.h"

// -NSDictionary
#import "NSDictionary+pSwizzling.h"
#import "NSDictionary+pTool.h"

// -NSFileManager
#import "NSFileManager+pTool.h"

// -NSObject
#import "NSObject+pAssign.h"
#import "NSObject+pPerformSelector.h"
#import "NSObject+pSwizzling.h"

// -NSString
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

// -NSURL
#import "NSURL+pSwizzling.h"

// -PrefixCore
#import "Block+pPrefix.h"
#import "Color+pPrefix.h"
#import "Font+pPrefix.h"
#import "Size+pPrefix.h"
#import "Fun+pPrefix.h"

// -Os+pPrefix
#import "Os+pPrefix.h"

// -NSTimer
#import "NSTimer+pSafe.h"
