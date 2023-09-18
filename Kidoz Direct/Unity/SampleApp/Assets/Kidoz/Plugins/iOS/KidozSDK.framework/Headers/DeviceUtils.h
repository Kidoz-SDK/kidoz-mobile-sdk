//
//  DeviceUtils.h
//  KidozSDK
//
//  Created by Lev Firer on 15/11/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceUtils : NSObject

+ (NSString *)getBundleIdentifier;
+ (NSString *)getDeviceLanguage;
+ (NSString *)getUniqeDeviceID;
+ (NSString *)getDeviceType;
+ (NSString *)getOSVersion;
+ (NSString *)getWebViewVersion;
+ (NSString *)getScreenWidth;
+ (NSString *)getScreenHeight;
+ (NSString *)getDeviceScreenSizeInInches;
+ (NSString *)getDeviceModel;
+ (NSString *)getWifiMode;
+ (NSString *)getCarrierName;
+ (NSString *)getNetworkType;
+ (NSString *)getTimestamp;
+ (NSString *)getSDKVersion;
+ (NSString *)getActualSDKVersion;
+ (NSString *)getUTCTimestamp;
+ (BOOL)allowsArbitraryLoads;
+ (NSString *)getWebViewUserAgent;

+ (NSString *)getActualScreenWidth;
+ (NSString *)getActualScreenHeight;
+ (NSString *)getScaleFactor;
+ (NSString *)getDPIFactor;
+ (NSString *)getAppVersion;
+ (NSString *)getOMPartnerName;
+ (BOOL)changeUserAgent;

@end
