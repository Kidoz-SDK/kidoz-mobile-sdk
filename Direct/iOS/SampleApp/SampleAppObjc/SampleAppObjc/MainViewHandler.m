//
//  MainViewHandler.m
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import "MainViewHandler.h"

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

- (void)setViewControllerWithBaseMainViewController:(BaseMainViewController *)baseMainViewController {
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

- (void)onBannerAdFailedToLoadWithError:(KidozError *)error {
    [baseMainViewController onBannerLoadFailedWithError: error.description];
}

- (void)onBannerAdShown {
    [baseMainViewController onBannerOpened];
}

- (void)onBannerAdFailedToShowWithError:(KidozError *)error {
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

- (void)onInterstitialAdLoadedWithAd:(KidozInterstitialAd *)ad {
    self.interstitialAd = ad;
    [baseMainViewController onInterstitialLoaded];
}

- (void)onInterstitialAdFailedToLoadWithError:(KidozError *)error {
    [baseMainViewController onInterstitialLoadFailedWithError: error.description];
}

- (void)onInterstitialAdFailedToShowWithError:(KidozError *)error {
    [baseMainViewController onInterstitialShowFailedWithError: error.description];
}

- (void)onInterstitialAdShownWithAd:(KidozInterstitialAd *)ad {
    [baseMainViewController onInterstitialOpened];
}

- (void)onInterstitialImpression {
    [baseMainViewController onInterstitialImpression];
}

- (void)onInterstitialAdClosedWithAd:(KidozInterstitialAd *)ad {
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

- (void)onRewardedAdLoadedWithAd:(KidozRewardedAd *)ad {
    rewardedAd = ad;
    [baseMainViewController onRewardedLoaded];
}

- (void)onRewardedAdFailedToLoadWithError:(KidozError *)error {
    [baseMainViewController onRewardedLoadFailedWithError: error.description];
}

- (void)onRewardedAdShownWithAd:(KidozRewardedAd *)ad {
    [baseMainViewController onRewardedOpened];
}

- (void)onRewardedAdFailedToShowWithError:(KidozError *)error {
    [baseMainViewController onRewardedShowFailedWithError: error.description];
}

- (void)onRewardedImpression {
    [baseMainViewController onRewardedImpression];
}

- (void)onRewardReceivedWithAd:(KidozRewardedAd *)ad {
    [baseMainViewController onRewardAchieved];
}

- (void)onRewardedAdClosedWithAd:(KidozRewardedAd *)ad {
    [baseMainViewController onRewardedClosed];
}

- (void)onTestCampaignIdsChange {
    [bannerView removeFromSuperview];
    [self initBannerWithView];
}

-(void) initBannerWithView {
    if ([baseMainViewController view] != NULL) {
        bannerView = [[KidozBannerView alloc] init];
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
            constant:0
        ];
        
        NSLayoutConstraint *height = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeHeight
            relatedBy:NSLayoutRelationEqual
            toItem:NULL
            attribute:NSLayoutAttributeNotAnAttribute
            multiplier:0
            constant: KidozBannerView.BANNER_HEIGHT
        ];
        
        NSLayoutConstraint *width = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeWidth
            relatedBy:NSLayoutRelationEqual
            toItem:NULL
            attribute:NSLayoutAttributeNotAnAttribute
            multiplier:0
            constant: KidozBannerView.BANNER_WIDTH
        ];
        
        [[baseMainViewController view] addConstraints:@[bottom, centerX, height, width]];
    }
}

@end
