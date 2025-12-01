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
    return [Kidoz getSdkVersion];
}

- (void)initSDK {
    [Kidoz.instance initializeWithPublisherID: @"14428" securityToken: @"6yAsKUngaG5yC4X5HsRoatKTso40NMoZ" delegate: self];
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

- (void)closeBanner {
    [bannerView close];
    [bannerView removeFromSuperview];
    bannerView = NULL;
    [self initBannerWithView];
}

- (void)onBannerAdLoadedWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView {
    [baseMainViewController onBannerLoaded];
}

- (void)onBannerAdFailedToLoadWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView error:(KidozError * _Nonnull)error {
    [baseMainViewController onBannerLoadFailedWithError: error.description];
}

- (void)onBannerAdShownWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView {
    [baseMainViewController onBannerOpened];
}

- (void)onBannerAdFailedToShowWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView error:(KidozError * _Nonnull)error {
    [baseMainViewController onBannerShowFailedWithError: error.description];
}

- (void)onBannerAdImpressionWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView {
    [baseMainViewController onBannerImpression];
}

- (void)onBannerAdClosedWithKidozBannerView:(KidozBannerView * _Nonnull)kidozBannerView {
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

- (void)onInterstitialAdLoadedWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd {
    self.interstitialAd = kidozInterstitialAd;
    [baseMainViewController onInterstitialLoaded];
}

- (void)onInterstitialAdFailedToLoadWithError:(KidozError *)error {
    [baseMainViewController onInterstitialLoadFailedWithError: error.description];
}

- (void)onInterstitialAdFailedToShowWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd kidozError:(KidozError * _Nonnull)kidozError {
    [baseMainViewController onInterstitialShowFailedWithError: kidozError.description];
}

- (void)onInterstitialAdShownWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd {
    [baseMainViewController onInterstitialOpened];
}

- (void)onInterstitialImpressionWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd {
    [baseMainViewController onInterstitialImpression];
}

- (void)onInterstitialAdClosedWithKidozInterstitialAd:(KidozInterstitialAd * _Nonnull)kidozInterstitialAd {
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

- (void)onRewardedAdLoadedWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd {
    rewardedAd = kidozRewardedAd;
    [baseMainViewController onRewardedLoaded];
}

- (void)onRewardedAdFailedToLoadWithKidozError:(KidozError * _Nonnull)kidozError {
    [baseMainViewController onRewardedLoadFailedWithError: kidozError.description];
}

- (void)onRewardedAdShownWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd {
    [baseMainViewController onRewardedOpened];
}

- (void)onRewardedAdFailedToShowWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd kidozError:(KidozError * _Nonnull)kidozError {
    [baseMainViewController onRewardedShowFailedWithError: kidozError.description];
}

- (void)onRewardedImpressionWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd {
    [baseMainViewController onRewardedImpression];
}

- (void)onRewardReceivedWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd {
    [baseMainViewController onRewardAchieved];
}

- (void)onRewardedAdClosedWithKidozRewardedAd:(KidozRewardedAd * _Nonnull)kidozRewardedAd {
    [baseMainViewController onRewardedClosed];
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
            constant: 50
        ];

        NSLayoutConstraint *width = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeWidth
            relatedBy:NSLayoutRelationEqual
            toItem:NULL
            attribute:NSLayoutAttributeNotAnAttribute
            multiplier:0
            constant: 320
        ];

        [[baseMainViewController view] addConstraints:@[bottom, centerX, height, width]];
    }
}

@end

