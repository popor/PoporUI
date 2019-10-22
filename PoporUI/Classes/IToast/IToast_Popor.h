//
//  IToast_Popor.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum iToastGravityPopor {
	iToastGravityPoporTop = 1000001,
	iToastGravityPoporBottom,
	iToastGravityPoporCenter
}iToastGravityPopor;

typedef enum iToastTypePopor {
	iToastTypePoporInfo = -100000,
	iToastTypePoporNotice,
	iToastTypePoporWarning,
	iToastTypePoporError,
	iToastTypePoporNone // For internal use only (to force no image)
}iToastTypePopor;

typedef enum iToastImageLocationPopor {
    iToastImageLocationPoporTop,
    iToastImageLocationPoporLeft
} iToastImageLocationPopor;

@class iToastSettingsPopor;

@interface IToast_Popor : NSObject  {
	NSInteger offsetLeft;
	NSInteger offsetTop;
	NSTimer   * timer;
	NSString  * text;
}

- (void) show;
- (void) show:(iToastTypePopor) type;
- (IToast_Popor *) setDuration:(NSInteger ) duration;
- (IToast_Popor *) setGravity:(iToastGravityPopor) gravity
			 offsetLeft:(NSInteger) left
              offsetTop:(NSInteger) top;
- (IToast_Popor *) setGravity:(iToastGravityPopor) gravity;
- (IToast_Popor *) setPostion:(CGPoint) position;

+ (IToast_Popor *) makeText:(NSString *) text;

- (id) initWithText:(NSString *) tex;


@end


@interface iToastSettingsPopor : NSObject<NSCopying>{
	NSInteger duration;
	iToastGravityPopor gravity;
	CGPoint postition;
	iToastTypePopor toastType;
	
	NSDictionary *images;
	
	BOOL positionIsSet;
}


@property(assign) NSInteger duration;
@property(assign) iToastGravityPopor gravity;
@property(assign) CGPoint postition;
@property(readonly) NSDictionary *images;
@property(assign) iToastImageLocationPopor imageLocation;


- (void) setImage:(UIImage *)img forType:(iToastTypePopor) type;
- (void) setImage:(UIImage *)img withLocation:(iToastImageLocationPopor)location forType:(iToastTypePopor)type;
+ (iToastSettingsPopor *) getSharedSettings;

@end

