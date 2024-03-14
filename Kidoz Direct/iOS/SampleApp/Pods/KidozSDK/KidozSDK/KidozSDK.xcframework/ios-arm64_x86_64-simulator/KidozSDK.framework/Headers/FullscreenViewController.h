//
//  FullscreenViewController.h
//  KidozSDK
//
//  Created by Lev Firer on 17/12/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDZEnums.h"

@protocol KDZApplicationActivityNotificationDelegate <NSObject>
-(void)applicationDidBecomeActiveNotification;
-(void)applicationWillResignActiveNotification;
@end

@interface FullscreenViewController : UIViewController

@property (nonatomic, weak) id <KDZApplicationActivityNotificationDelegate> mDelegate;

-(void)setDelegate:(id<KDZApplicationActivityNotificationDelegate>)delegate;
-(void)setOrientation:(OrientationState)orientationState;
-(BOOL)isVisible;
-(void)resumeInterstitial;
-(void)pauseInterstitial;

@end
