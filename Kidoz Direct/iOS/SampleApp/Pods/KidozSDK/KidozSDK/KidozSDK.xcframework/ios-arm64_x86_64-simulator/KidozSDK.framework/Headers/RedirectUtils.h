//
//  RedirectUtils.h
//  KidozSDK
//
//  Created by Lev Firer on 18/12/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RedirectUtils : NSObject


+ (void)openUrlInBrowser:(NSURL*)url;
+ (void)openUrlInAppStore:(NSURL*)url;
+ (BOOL)isAppStoreLink:(NSURL*)url;


enum RedirectType{
    BROWSER,APPSTORE,WEBVIEW
};

@end
