## Kidoz iOS Mobile SDK Sample App - Objective-C

#### Add Kidoz SDK to your iOS project with CocoaPods
add to your `Podfile`:

```yaml
pod 'KidozSDK', '9.0.0'
```
run in Terminal `pod install` from the root folder of your Podfile.

#### Initialize Kidoz SDK
Call the initialize method with the publisher ID and Token which you received during the [Kidoz onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).
```Objective-C 
[Kidoz.instance initializeWithPublisherID: <enter your publisher ID> securityToken: <enter your security Token> withDelegate: self];
```

You can check Kidoz SDK state using the following method:  
```Objective-C 
BOOL initialized = [Kidoz.instance isSDKInitialized];
```

Report the `KidozInitDelegate` protocol's callbacks:  
```Objective-C 
-(void) onInitSuccess;
-(void) onInitError:(NSString*) errorMessage;
```
<BR>

## Kidoz iOS Interstitial Ad 
**Intersitial** is a full screen widget which is designed for showing full screen advertisement.  
#### Add support for Interstitial ad unit

Load Interstitial ad: 
```Objective-C 
if ([Kidoz.instance isSDKInitialized]) {
   [KidozInterstitialAd loadWithDelegate: self];
}
```

Show Interstitial ad:  
```Objective-C 
if (interstitialAd != NULL && [interstitialAd isLoaded] ) {
   [interstitialAd showWithViewController: <YourViewController>];
}
```

Report the `KidozInterstitialDelegate` protocol's callbacks: 
```Objective-C  
-(void) onInterstitialAdLoaded:(KidozInterstitialAd*) ad;
-(void) onInterstitialAdFailedToLoad:(KidozError*) error;
-(void) onInterstitialAdFailedToShow:(KidozError*) error;
-(void) onInterstitialAdShown:(KidozInterstitialAd*) ad;
-(void) onInterstitialImpression;
-(void) onInterstitialAdClosed:(KidozInterstitialAd*) ad;
```
**Kidoz iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads : Before the game ends, between game levels, after completing a game level .   
- Some Interstitial Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-onInterstitialAdShown:` and `-onInterstitialAdClosed:` callbacks:
```Swift 
onInterstitialAdShown {
// mute|pause background sounds
// pause your game 
}

onInterstitialAdClosed(ad: KidozSDK.KidozInterstitialAd) {
// unmute|resume background sounds
// resume your game 
}
```
<BR>

## Kidoz iOS Rewarded Ad
`Rewarded`  is a full screen widget which is designed for showing full screen advertisement.   
#### Add support for Rewarded ad unit

Load Rewarded ad: 
```Objective-C 
if ([Kidoz.instance isSDKInitialized]) {
   [KidozRewardedAd loadWithDelegate: self];
}
```

Show Rewarded ad:  
```Objective-C 
if (rewardedAd != NULL && [rewardedAd isLoaded] ) {
   [rewardedAd showWithViewController: <YourViewController>];
}
```

Report the `KidozRewardedDelegate` protocol's callbacks: 
```Objective-C   
-(void) onRewardedAdLoaded:(KidozRewardedAd*) ad;
-(void) onRewardedAdFailedToLoad:(KidozError*) error;
-(void) onRewardedAdFailedToShow:(KidozError*) error;
-(void) onRewardedAdShown:(KidozRewardedAd*) ad;
-(void) onRewardedImpression;
-(void) onRewardReceived:(KidozRewardedAd*) ad;
-(void) onRewardedAdClosed:(KidozRewardedAd*) ad;
```
**Kidoz iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads : Based on the implementation of rewarded logics in your game .   
- Some Rewarded Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-onRewardedAdShownWithAd:` and `-onRewardedAdClosedWithAd:` callbacks:
```Swift 
onRewardedAdShownWithAd {
//mute/pause background sounds
//pause your game 
}

onRewardedAdClosedWithAd {
//unmute/resume background sounds
//resume your game 
}
```
<BR>

## Kidoz iOS Banner 
#### Add support for Banner ad unit

Initialize Banner:
```Objective-C 
KidozBannerView* bannerView = [[KidozBannerView alloc] init];
```

Load and show Banner:  
```Objective-C 
if ([Kidoz.instance isSDKInitialized]) {
   [bannerView load];
}
``` 

Close Banner:  
```Objective-C 
[bannerView close];
```  

Report the `KidozBannerDelegate` protocol's callbacks: 
```Objective-C 
-(void) onBannerAdLoaded;
-(void) onBannerAdFailedToLoad:(KidozError*) error;
-(void) onBannerAdShown;
-(void) onBannerAdFailedToShow:(KidozError*) error;
-(void) onBannerAdImpression;
-(void) onBannerAdClosed;
```
