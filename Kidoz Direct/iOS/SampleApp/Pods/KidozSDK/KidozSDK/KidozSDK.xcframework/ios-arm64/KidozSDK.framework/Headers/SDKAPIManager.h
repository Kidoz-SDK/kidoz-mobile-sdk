//
//  RESTAPIManager.h
//  KidozSDK
//
//  Created by Lev Firer on 15/11/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseConnectionRequest.h"
#import "DeviceUtils.h"
#import "PropertiesObj.h"
#import "KidozLog.h"

@class ResultData;
@class ResponseStatus;

@interface SDKAPIManager : BaseConnectionRequest{
    
}


typedef enum {
    
    SESSION_START
    
}EventType;

typedef enum WidgetType{
    WIDGET_TYPE_NONE,
    WIDGET_TYPE_FEED,
    WIDGET_TYPE_PANEL,
    WIDGET_TYPE_BANNER,
    WIDGET_TYPE_FLEXI_VIEW,
    WIDGET_TYPE_INTERSTITIAL,
    WIDGET_TYPE_VIDEO_UNIT,
    WIDGET_TYPE_INTERSTITIAL_REWARDED,
    WIDGET_TYPE_TOONS_TV
}WidgetType;




+ (id)sharedInstance;

- (void)initSDKRequestWithPublisherID:(NSString *)publisherID securityToken:(NSString *)securityToken;
- (void)sendInitSDKRequestWithHandler:(void(^)(ResultData*,NSError*))handler;
- (void)downLoadFileWithURL:(NSString*)url withFilePath:(NSString*)filePath withHandler:(void(^)(BOOL))handler;
- (void)sendEvent:(NSString*)url eventType:(NSInteger)event widgetType:(NSInteger)widgetType withHandler:(void(^)(BOOL))handler;
- (void)sendEventWithParams:(NSMutableDictionary*)params eventType:(NSInteger)event withHandler:(void(^)(BOOL))handler;
- (NSMutableDictionary*)getBasicParams;
- (NSMutableDictionary*)getParams;
//- (id)init;


@end
