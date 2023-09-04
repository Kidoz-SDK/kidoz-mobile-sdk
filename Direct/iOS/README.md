# Kidoz iOS Mobile SDK

**Kidoz SDK and the Sample App are compatible with iOS 10.0 and above.**

**Kidoz SDK is written in Objective-C and Swift.**

***This SDK version was verified not to contain the Advertiser Identifier (IDFA) as required by Apple App Store regulation for apps of Kids category.***

# Prerequisites
Before publishing your first app please finish the onboarding process for Kidoz's publishers [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=).


## Contents
- [Running the SampleApp](#running-the-sampleapp)
- [SKAdNetwork Support](#skadnetwork-support)
- [Kidoz SDK - Getting Started](#kidoz-sdk---getting-started)
    - [Adding Kidoz SDK to your iOS project with CocoaPods](#adding-kidoz-sdk-to-your-ios-project-with-cocoapods)
    - [Setup Kidoz SDK for Swift](#setup-kidoz-sdk-for-swift)
    - [Setup Kidoz SDK for Objective-C](#setup-kidoz-sdk-for-objective-c)
    - [Setup Kidoz credentials](#setup-kidoz-credentials)
- [Kidoz iOS Interstitial Ad](#kidoz-ios-interstitial-ad)
    - [Setup Interstitial Ad for Swift](#setup-interstitial-ad-for-swift)
    - [Setup Interstitial Ad for Objective-C](#setup-interstitial-ad-for-objective-c)
    - [Kidoz iOS Interstitial best practices](#kidoz-ios-interstitial-best-practices)
- [Kidoz iOS Rewarded Ad](#kidoz-ios-rewarded-ad)
    - [Setup Rewarded Ad for Swift](#setup-rewarded-ad-for-swift)
    - [Setup Rewarded Ad for Objective-C](#setup-rewarded-ad-for-objective-c)
    - [Kidoz iOS Rewarded best practices](#kidoz-ios-rewarded-best-practices)
- [Kidoz iOS Banner Ad](#kidoz-ios-banner)
    - [Setup Banner Ad for Swift](#setup-banner-ad-for-swift)
    - [Setup Banner Ad for Objective-C](#setup-banner-ad-for-objective-c)
- [Stay in touch](#stay-in-touch)
- [License](#license)

# Running the SampleApp
SampleApp is an iOS application project that provides an example of the KIDOZ SDK integration and usage.

In order to see Kidoz SDK in action go to the [SampleApp](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/Direct/iOS/SampleApp) folder and open `SampleApp.xcworkspace`. Inside the project you will find examples of how to use the Kidoz SDK in Swift and Objective-C.

# SKAdNetwork Support
In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app). 


# KIDOZ SDK - Getting Started
## Adding Kidoz SDK to your iOS project with CocoaPods
add to your `Podfile`:

```
pod 'KidozSDK', '9.0.0'
```
run in Terminal `pod install` from the root folder of your Podfile.


## Initialize Kidoz SDK
Call the initialize method with the publisher ID and Token which you received during the [Kidoz onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).
```
Kidoz.instance().initialize(withPublisherID: <enter your publisher ID>, securityToken: <enter your security Token>, with: self)
```

You can check Kidoz SDK state using the following method:  
```
var initialized = Kidoz.instance().isSDKInitialized();
```

Report the `KidozInitDelegate` protocol's callbacks:  
```
   func onInitSuccess()
   func onInitError(_ errorMessage: String!)
```



## Setup Kidoz SDK for Objective-C
1. Make sure you add `#import <KidozSDK/KidozSDK.h>` to your ViewController.h file.
3. Conform to the `KidozInitDelegate` protocol and implement SDK delegate methods:  
```
    ViewController.h
    @interface ViewController : UIViewController<KidozInitDelegate>  
```
```
    ViewController.m  
    -(void)onInitSuccess {}  
    -(void)onInitError:(NSString *)error {}
```
4. Init the SDK:
```
[Kidoz.instance initializeWithPublisherID: <enter your publisher ID> securityToken: <enter your security Token> withDelegate: self];
```
5. To check SDK state:  
```
BOOL initislized = [Kidoz.instance isSDKInitialized];
```
</br>

# Kidoz iOS Interstitial Ad 
**Intersitial** is a full screen widget which is designed for showing full screen advertisement.  
## Add support for Interstitial ad unit

Load Interstitial ad: 
```
if Kidoz.instance().isSDKInitialized() {
   KidozInterstitialAd.load(delegate: self)
}
```

Show Interstitial ad:  
```
if interstitialAd != nil && interstitialAd!.isLoaded() {
   interstitialAd!.show(viewController: <YourViewController>)
}
```

Report the `KidozInterstitialDelegate` protocol's callbacks: 
```  
func onInterstitialAdLoaded(ad: KidozSDK.KidozInterstitialAd)
func onInterstitialAdFailedToLoad(error: KidozSDK.KidozError)
func onInterstitialAdShown(ad: KidozSDK.KidozInterstitialAd)
func onInterstitialAdFailedToShow(error: KidozSDK.KidozError)
func onInterstitialImpression()
func onInterstitialAdClosed(ad: KidozSDK.KidozInterstitialAd)
```
**Kidoz iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads : Before the game ends, between game levels, after completing a game level .   
- Some Interstitial Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-onInterstitialAdShown:` and `-onInterstitialAdClosed:` callbacks:
```
onInterstitialAdShown {
// mute|pause background sounds
// pause your game 
}

onInterstitialAdClosed(ad: KidozSDK.KidozInterstitialAd) {
// unmute|resume background sounds
// resume your game 
}
```

## Setup Interstitial Ad for Objective-C

1. In the selected view controller, conform to the  `KidozInterstitialDelegate`  protocol and implement all delegate methods.

2. Load Interstitial: 
```
if ([Kidoz.instance isSDKInitialized]) {
   [KidozInterstitialAd loadWithDelegate: self];
}
```  
3. Catch callback onInterstitialAdLoaded: 
```
- (void)onInterstitialAdLoadedWithAd:(KidozInterstitialAd *)ad {
    self.interstitialAd = ad;
}
```
4. Show Interstitial:  
```
if (interstitialAd != NULL && [interstitialAd isLoaded] ) {
   [interstitialAd showWithViewController: <YourViewController>];
}
```

# Kidoz iOS Rewarded Ad
`Rewarded`  is a full screen widget which is designed for showing full screen advertisement.   
## Add support for Rewarded ad unit

Load Interstitial ad: 
```
if Kidoz.instance().isSDKInitialized() {
   KidozRewardedAd.load(delegate: self)
}
```

Show Interstitial ad:  
```
if rewardedAd != nil && rewardedAd!.isLoaded() {
   rewardedAd!.show(viewController: <YourViewController>)
}
```

Report the `KidozRewardedDelegate` protocol's callbacks: 
```  
func onRewardedAdLoaded(ad: KidozSDK.KidozRewardedAd)
func onRewardedAdFailedToLoad(error: KidozSDK.KidozError)
func onRewardedAdShown(ad: KidozSDK.KidozRewardedAd)
func onRewardedAdFailedToShow(error: KidozSDK.KidozError)
func onRewardReceived(ad: KidozSDK.KidozRewardedAd)
func onRewardedImpression()
func onRewardedAdClosed(ad: KidozSDK.KidozRewardedAd)
```
**Kidoz iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads : Based on the implementation of rewarded logics in your game .   
- Some Rewarded Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-onRewardedAdShownWithAd:` and `-onRewardedAdClosedWithAd:` callbacks:
```
-(void)onRewardedAdShownWithAd {
//mute/pause background sounds
//pause your game 
}

-(void)onRewardedAdClosedWithAd {
//unmute/resume background sounds
//resume your game 
}
```

## Setup Rewarded Ad for Objective-C
1. In the selected view controller , conform to the  `KidozRewardedDelegate`  protocol and implement all delegate methods. 

2. Load Rewarded:  
```
if ([Kidoz.instance isSDKInitialized]) {
   [KidozRewardedAd loadWithDelegate: self];
}
```
3. Catch callback onRewardedAdLoaded:   
```
- (void)onRewardedAdLoadedWithAd:(KidozRewardedAd *)ad {
   rewardedAd = ad;
}
```
4. Show Rewarded:  
```
if (rewardedAd != NULL && [rewardedAd isLoaded] ) {
   [rewardedAd showWithViewController: <YourViewController>];
 }
```


# Kidoz Banner 
## Setup Banner Ad for Swift
1. In the selected view controller , conform to the  `KidozBannerDelegate`  protocol and implement all delegate methods.

2. Init banner (example):  
```
func initBannerWithView() {
        if let view = baseMainViewController.view {
            bannerView = KidozBannerView()
            bannerView.delegate = self
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
                [NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: baseMainViewController.bottomLayoutGuide,
                    attribute: .top,
                    multiplier: 1,
                    constant: 0),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: KidozBannerView.BANNER_HEIGHT),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: KidozBannerView.BANNER_WIDTH)])
            
        }
    }
``` 

3. Load and Show banner :  
```
public func loadBanner() {
   if Kidoz.instance().isSDKInitialized() {
      bannerView.load()
   }
}
``` 

4. Close banner:  
```
public func closeBanner() {
   bannerView.close()
   bannerView.removeFromSuperview()
   bannerView = nil
   initBannerWithView()
}
```  

## Setup Kidoz Banner for Objective-C
1. In the selected view controller , conform to the  `KidozBannerDelegate`  protocol and implement all delegate methods.

2. Init banner (example):  
```
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
```

3. Load and Show banner :  
```
- (void)loadBanner {
    if ([Kidoz.instance isSDKInitialized]) {
        [bannerView load];
    }
}
``` 

4. Close banner:  
```
- (void)closeBanner {
    [bannerView close];
}
```  
</br>
