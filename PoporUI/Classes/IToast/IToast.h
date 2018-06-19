//
//  IToast.h
//  WanziTG
//
//  Created by TaeYoona on 14-7-22.
//  Copyright (c) 2014年 wanzi. All rights reserved.
//V1.0

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum iToastGravity {
	iToastGravityTop = 1000001,
	iToastGravityBottom,
	iToastGravityCenter
}iToastGravity;

typedef enum iToastType {
	iToastTypeInfo = -100000,
	iToastTypeNotice,
	iToastTypeWarning,
	iToastTypeError,
	iToastTypeNone // For internal use only (to force no image)
}iToastType;

typedef enum {
    iToastImageLocationTop,
    iToastImageLocationLeft
} iToastImageLocation;


@class iToastSettings;



@interface IToast : NSObject  {
	NSInteger offsetLeft;
	NSInteger offsetTop;
    
	NSTimer *timer;
    
	UIView *view;
	NSString *text;
}

- (void) show;
- (void) show:(iToastType) type;
- (IToast *) setDuration:(NSInteger ) duration;
- (IToast *) setGravity:(iToastGravity) gravity
			 offsetLeft:(NSInteger) left
              offsetTop:(NSInteger) top;
- (IToast *) setGravity:(iToastGravity) gravity;
- (IToast *) setPostion:(CGPoint) position;

+ (IToast *) makeText:(NSString *) text;

- (id) initWithText:(NSString *) tex;


@end


@interface iToastSettings : NSObject<NSCopying>{
	NSInteger duration;
	iToastGravity gravity;
	CGPoint postition;
	iToastType toastType;
	
	NSDictionary *images;
	
	BOOL positionIsSet;
}


@property(assign) NSInteger duration;
@property(assign) iToastGravity gravity;
@property(assign) CGPoint postition;
@property(readonly) NSDictionary *images;
@property(assign) iToastImageLocation imageLocation;


- (void) setImage:(UIImage *)img forType:(iToastType) type;
- (void) setImage:(UIImage *)img withLocation:(iToastImageLocation)location forType:(iToastType)type;
+ (iToastSettings *) getSharedSettings;

@end

