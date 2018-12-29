//
//  PoporUI.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for UIExtension.
FOUNDATION_EXPORT double UIExtensionVersionNumber;

//! Project version string for UIExtension.
FOUNDATION_EXPORT const unsigned char UIExtensionVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <UIExtension/PublicHeader.h>

// BlockView
#import "BlockActionSheet.h"
#import "BlockAlertView.h"

// IToast
#import "IToastKeyboard.h"

// Responder
#import "UIResponder+Router.h"

// Tool
#import "DeviceDisk.h"
#import "UIDevice+Permission.h"
#import "UIDevice+SaveImage.h"
#import "UIDevice+Tool.h"
#import "UIPasteImageTextView.h"

// UIButton
#import "UIButton+CommonStyle.h"
#import "UIButton+UIEdgeInsets.h"

// UIImage
#import "UIImage+create.h"
#import "UIImage+gradient.h"
#import "UIImage+read.h"
#import "UIImage+save.h"
#import "UIImage+Tool.h"

// UILabel
#import "UILabel+Size.h"
#import "UILabelInsets.h"
#import "UILabelPhone.h"

// UIScrollView
#import "AllowPanGRPassSV.h"
#import "UIScrollView+tool.h"

// UITextField
#import "UIInsetsTextField.h"
#import "UITextField+MaxLength.h"

// UITableView
#import "UITableView+transitionCoordinator.h"
#import "UITableViewCell+SetSeparatorType.h"

// UITextView
#import "UIPlaceHolderTextView.h"
#import "UITextView+MaxLength.h"
#import "UITextView+Size.h"


// UIView
#import "UIView+Extension.h"
#import "UIView+Tool.h"

// UIViewController
//#import "UIViewController+AC.h"
#import "UIViewController+LeeBase.h"
#import "UIViewController+TapEndEdit.h"
