//
//  MainViewHandler.h
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import <Foundation/Foundation.h>
#import <CommonSampleApp/CommonSampleApp.h>
#import <KidozSDK/KidozSDK.h>
#import <KidozSDK/KidozSDK-Swift.h>
@class MainViewControllerHandler;

@interface MainViewHandler : NSObject <KidozInitDelegate, KidozInterstitialDelegate, KidozRewardedDelegate, KidozBannerDelegate>

// MARK: - Kidoz SDK
-(void) setViewController:(BaseMainViewController*) baseMainViewController;
-(NSString*) getAppLabel;
-(NSString*) getSDKVersion;
-(void) initSDK;
-(void) onInitSuccess;
-(void) onInitError:(NSString*) errorMessage;

// MARK: - Banner
-(void) loadBanner;
-(void) hideBanner;
-(void) onBannerAdLoaded;
-(void) onBannerAdFailedToLoad:(KidozError*) error;
-(void) onBannerAdShown;
-(void) onBannerAdFailedToShow:(KidozError*) error;
-(void) onBannerAdImpression;
-(void) onBannerAdClosed;

// MARK: - Interstitial ad
-(void) loadInterstitial;
-(void) showInterstitial;
-(void) onInterstitialAdLoaded:(KidozInterstitialAd*) ad;
-(void) onInterstitialAdFailedToLoad:(KidozError*) error;
-(void) onInterstitialAdFailedToShow:(KidozError*) error;
-(void) onInterstitialAdShown:(KidozInterstitialAd*) ad;
-(void) onInterstitialImpression;
-(void) onInterstitialAdClosed:(KidozInterstitialAd*) ad;

// MARK: - Rewarded ad
-(void) loadRewarded;
-(void) showRewarded;
-(void) onRewardedAdLoaded:(KidozRewardedAd*) ad;
-(void) onRewardedAdFailedToLoad:(KidozError*) error;
-(void) onRewardedAdFailedToShow:(KidozError*) error;
-(void) onRewardedAdShown:(KidozRewardedAd*) ad;
-(void) onRewardedImpression;
-(void) onRewardReceived:(KidozRewardedAd*) ad;
-(void) onRewardedAdClosed:(KidozRewardedAd*) ad;
-(void) onTestCampaignIdsChange;

@end
