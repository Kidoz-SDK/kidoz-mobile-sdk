//
//  OMService.h
//  KidozSDK
//
//  Created by Lev Firer on 01/11/2020.
//  Copyright © 2020 Kidoz. All rights reserved.
//

#ifndef OMService_h
#define OMService_h


#endif /* OMService_h */
#import <Foundation/Foundation.h>

@class WKWebView;
@class OMSessionAdapter;
@class OMIDAdSession;
@class OMIDSDK;
@protocol OMSessionProtocol;

@interface OMService : NSObject
+ (instancetype)instance;
- (BOOL)activateOMID;
- (OMSessionAdapter*)createSession:(WKWebView*)webview;
@end
