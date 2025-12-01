//
//  MainViewHandler.h
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import <Foundation/Foundation.h>
#import <CommonSampleApp/CommonSampleApp.h>
#import <KidozSDK/KidozSDK.h>
@class MainViewControllerHandler;

@interface MainViewHandler : NSObject <KidozInitDelegate, KidozInterstitialDelegate, KidozRewardedDelegate, KidozBannerDelegate>

- (void)setViewController:(BaseMainViewController*) baseMainViewController;
- (NSString*)getAppLabel;
- (NSString*)getSDKVersion;

// MARK: - Kidoz SDK
- (void)initSDK;
- (void)onInitSuccess;
- (void)onInitError:(NSString * _Nonnull)error;

// MARK: - Banner
- (void)loadBanner;
- (void)closeBanner;
- (void)onBannerAdLoadedWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView;
- (void)onBannerAdFailedToLoadWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView error:(KidozError * _Nonnull)error;
- (void)onBannerAdShownWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView;
- (void)onBannerAdFailedToShowWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView error:(KidozError * _Nonnull)error;
- (void)onBannerAdImpressionWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView;
- (void)onBannerAdClosedWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView;

// MARK: - Interstitial ad
- (void)loadInterstitial;
- (void)showInterstitial;
- (void)onInterstitialAdLoadedWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd;
- (void)onInterstitialAdFailedToLoadWithKidozError:(KidozError * _Nonnull)kidozError;
- (void)onInterstitialAdShownWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd;
- (void)onInterstitialAdFailedToShowWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd kidozError:(KidozError * _Nonnull)kidozError;
- (void)onInterstitialImpressionWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd;
- (void)onInterstitialAdClosedWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd;

// MARK: - Rewarded ad
- (void)loadRewarded;
- (void)showRewarded;
- (void)onRewardedAdLoadedWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd;
- (void)onRewardedAdFailedToLoadWithKidozError:(KidozError * _Nonnull)kidozError;
- (void)onRewardedAdShownWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd;
- (void)onRewardedAdFailedToShowWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd kidozError:(KidozError * _Nonnull)kidozError;
- (void)onRewardReceivedWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd;
- (void)onRewardedImpressionWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd;
- (void)onRewardedAdClosedWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd;

@end
