//
//  MainViewHandler.m
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import "MainViewHandler.h"
//#import <KidozSDK/KidozSDK-Swift.h>

@interface MainViewHandler()
    @property (nonatomic, retain) BaseMainViewController* baseMainViewController;
    @property (nonatomic, retain) KidozBannerView* bannerView;
    @property (nonatomic, retain) KidozInterstitialAd* interstitialAd;
    @property (nonatomic, retain) KidozRewardedAd* rewardedAd;
@end

@implementation MainViewHandler

@synthesize baseMainViewController;
@synthesize bannerView;
@synthesize interstitialAd;
@synthesize rewardedAd;

- (void)setViewControllerWithBaseMainViewController:(BaseMainViewController * _Nonnull)baseMainViewController {
    self.baseMainViewController = baseMainViewController;
}

- (NSString * _Nonnull)getAppLabel {
    return @"Kidoz Sample App";
}

- (NSString * _Nonnull)getSDKVersion {
    return [Kidoz.instance getSdkVersion];
}

- (void)initSDK {
    [Kidoz.instance initializeWithPublisherID: @"8" securityToken: @"QVBIh5K3tr1AxO4A1d4ZWx1YAe5567os" withDelegate: self];
}

-(void) onInitSuccess {
    [self initBannerWithView];
    [baseMainViewController onSDKInitSuccess];
}

-(void) onInitError:(NSString*) errorMessage {
    [baseMainViewController onSDKInitFailureWithError: errorMessage];
}

// MARK: - Banner
- (void)loadBanner {
    if ([Kidoz.instance isSDKInitialized]) {
        [bannerView load];
    } else {
        [baseMainViewController logOutWithMessage:@"SDK not initialized"];
    }
}

- (void)hideBanner {
    [bannerView close];
    [bannerView removeFromSuperview];
    bannerView = NULL;
    [self initBannerWithView];
}

- (void)onBannerAdLoaded {
    [baseMainViewController onBannerLoaded];
}

- (void)onBannerAdFailedToLoadWithError:(KidozError * _Nonnull)error {
    [baseMainViewController onBannerLoadFailedWithError: error.description];
}

- (void)onBannerAdShown {
    [baseMainViewController onBannerOpened];
}

- (void)onBannerAdFailedToShowWithError:(KidozError * _Nonnull)error {
    [baseMainViewController onBannerShowFailedWithError: error.description];
}

- (void)onBannerAdImpression {
    [baseMainViewController onBannerImpression];
}

- (void)onBannerAdClosed {
    [baseMainViewController onBannerClosed];
}

// MARK: - Interstitial ad
- (void)loadInterstitial {
    if ([Kidoz.instance isSDKInitialized]) {
        [KidozInterstitialAd loadWithDelegate: self];
    } else {
        [baseMainViewController logOutWithMessage: @"SDK not initialized"];
    }
}

- (void)showInterstitial {
    if (interstitialAd != NULL && [interstitialAd isLoaded] ) {
        [interstitialAd showWithViewController: baseMainViewController];
    } else {
        [baseMainViewController logOutWithMessage: @"Interstitial not ready"];
    }
}

- (void)onInterstitialAdLoadedWithAd:(KidozInterstitialAd * _Nonnull)ad {
    self.interstitialAd = ad;
    [baseMainViewController onInterstitialLoaded];
}

- (void)onInterstitialAdFailedToLoadWithError:(KidozError * _Nonnull)error {
    [baseMainViewController onInterstitialLoadFailedWithError: error.description];
}

- (void)onInterstitialAdFailedToShowWithError:(KidozError * _Nonnull)error {
    [baseMainViewController onInterstitialShowFailedWithError: error.description];
}

- (void)onInterstitialAdShownWithAd:(KidozInterstitialAd * _Nonnull)ad {
    [baseMainViewController onInterstitialOpened];
}

- (void)onInterstitialImpression {
    [baseMainViewController onInterstitialImpression];
}

- (void)onInterstitialAdClosedWithAd:(KidozInterstitialAd * _Nonnull)ad {
    [baseMainViewController onInterstitialClosed];
}

// MARK: - Rewarded ad
- (void)loadRewarded {
    if ([Kidoz.instance isSDKInitialized]) {
        [KidozRewardedAd loadWithDelegate: self];
    } else {
        [baseMainViewController logOutWithMessage: @"SDK not initialized"];
    }
}

- (void)showRewarded {
    if (rewardedAd != NULL && [rewardedAd isLoaded] ) {
        [rewardedAd showWithViewController: baseMainViewController];
    } else {
        [baseMainViewController logOutWithMessage: @"Rewarded not ready"];
    }
}

- (void)onRewardedAdLoadedWithAd:(KidozRewardedAd * _Nonnull)ad {
    rewardedAd = ad;
    [baseMainViewController onRewardedLoaded];
}

- (void)onRewardedAdFailedToLoadWithError:(KidozError * _Nonnull)error {
    [baseMainViewController onRewardedLoadFailedWithError: error.description];
}

- (void)onRewardedAdShownWithAd:(KidozRewardedAd * _Nonnull)ad {
    [baseMainViewController onRewardedOpened];
}

- (void)onRewardedAdFailedToShowWithError:(KidozError * _Nonnull)error {
    [baseMainViewController onRewardedShowFailedWithError: error.description];
}

- (void)onRewardedImpression {
    [baseMainViewController onRewardedImpression];
}

- (void)onRewardReceivedWithAd:(KidozRewardedAd * _Nonnull)ad {
    [baseMainViewController onRewardAchieved];
}

- (void)onRewardedAdClosedWithAd:(KidozRewardedAd * _Nonnull)ad {
    [baseMainViewController onRewardedClosed];
}

- (void)onTestCampaignIdsChange {
    [bannerView removeFromSuperview];
    [self initBannerWithView];
}

-(void) initBannerWithView {
    if ([baseMainViewController view] != NULL) {
        bannerView = [KidozBannerView init];
        bannerView.delegate = self;
        [bannerView setTranslatesAutoresizingMaskIntoConstraints: NO];
        [[baseMainViewController view]addSubview: bannerView];
        
        NSLayoutConstraint *bottom = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeBottom
            relatedBy:NSLayoutRelationEqual
            toItem:baseMainViewController.bottomLayoutGuide
            attribute:NSLayoutAttributeTop
            multiplier:1
            constant:0
        ];
        
        NSLayoutConstraint *centerX = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeCenterX
            relatedBy:NSLayoutRelationEqual
            toItem:baseMainViewController.view
            attribute:NSLayoutAttributeCenterX
            multiplier:1
            constant:100
        ];
        
        NSLayoutConstraint *height = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeHeight
            relatedBy:NSLayoutRelationEqual
            toItem:NULL
            attribute:NSLayoutAttributeNotAnAttribute
            multiplier:0
            constant: 3//[KidozBannerView BANNER_HEIGHT]
        ];
        
        NSLayoutConstraint *width = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeWidth
            relatedBy:NSLayoutRelationEqual
            toItem:NULL
            attribute:NSLayoutAttributeNotAnAttribute
            multiplier:0
            constant: 3//[KidozBannerView BANNER_WIDTH]
        ];
        
        [bannerView addConstraints:@[bottom, centerX, height, width]];
    }
}

@end
