//
//  PropertiesObj.h
//  KidozSDK
//
//  Created by Lev Firer on 20/11/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertiesObj : NSObject


@property (nonatomic,strong) NSDictionary *mProperties;


+ (id)sharedInstance;
- (id)init;
- (id)initWithProperties:(NSDictionary*)properties;
- (void)setProperties:(NSDictionary*)properties;
- (NSDictionary*)getData;
- (NSInteger)getSdkStyleVersion;
- (Boolean)getShouldEnableChromeDebug;
- (NSDictionary*)getProperties;
- (NSString*)getHtmlLoaderDefaultLink;
- (NSString*)getInterstitialHtmlLink;
- (NSString*)parseVideoUnitURL;
- (NSString*)getVideoUnitURL;
- (NSString*)getPanelViewStyle;
- (NSString*)getGlobalPropertiesStyle;
- (NSString*)getInterstitialViewStyle;
- (NSString*)getBannerViewStyle;
- (NSString*)getInterstitialDefaultLinkForType;
- (NSString*)getGPSFeedApiDomain;
- (NSString*)getWaterfallDomain;
- (Boolean)getParentalLockEnabled;
- (NSInteger)getInterstitialStyle;
- (NSString*)getBannerHtmlLink;
@end
