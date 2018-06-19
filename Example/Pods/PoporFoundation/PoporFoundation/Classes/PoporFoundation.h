//
//  PoporFoundationExtension.h
//  PoporFoundationExtension
//
//  Created by popor on 2018/6/13.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for PoporFoundationExtension.
FOUNDATION_EXPORT double PoporFoundationExtensionVersionNumber;

//! Project version string for PoporFoundationExtension.
FOUNDATION_EXPORT const unsigned char PoporFoundationExtensionVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PoporFoundationExtension/PublicHeader.h>


#import "NSObject+WMSafeKVO.h"

// NSArray
#import "NSArray+jsonDic.h"
//#import "NSArray+Swizzling.h"
//#import "NSMutableArray+Swizzling.h"
#import "NSMutableArray+chain.h"

// NSData
#import "NSData+dic.h"

// NSDictionary
#import "NSDictionary+tool.h"
//#import "NSDictionary+Swizzling.h"

// NSString
#import "NSString+email.h"
#import "NSString+MD5.h"
#import "NSString+format.h"
#import "NSString+Tool.h"
#import "NSString+Size.h"
#import "NSString+IDCard.h"

// NSURL
#import "NSURL+Swizzling.h"

// Runtime

// ScreenCommonSize
#import "ScreenCommonSize.h"

// prefix
#import "ColorPrefix.h"
#import "FontPrefix.h"
#import "SizePrefix.h"
#import "FunctionPrefix.h"
#import "BlockMacroDefines.h"
