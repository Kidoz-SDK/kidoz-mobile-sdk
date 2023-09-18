//
//  UIUtils.h
//  KidozSDK
//
//  Created by Lev Firer on 17/12/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIUtils : NSObject

+(UIViewController*)rootViewController;

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)viewController;

+ (UIViewController*)topViewController;

+ (UIViewController*)visibleController;

+ (UIViewController*) topMostController;

+ (UIWindow *)getUIWindow;

+(float) screenHeightFactor;

@end
