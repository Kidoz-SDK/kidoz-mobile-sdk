# Kidoz iOS Mobile SDK - Swift

## Initialize Kidoz SDK
Call the initialize method with the Publisher ID and Security Token which you received during [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).
```Swift
Kidoz.instance().initialize(withPublisherID: <enter your publisher ID>, securityToken: <enter your security Token>, with: self)
```

You can check Kidoz SDK state using the following method:  
```Swift
var initialized = Kidoz.instance().isSDKInitialized();
```

Report the `KidozInitDelegate` protocol's callbacks:  
```Swift
func onInitSuccess()
func onInitError(_ errorMessage: String!)
```
<BR>

## Kidoz iOS Interstitial Ad 
**Intersitial** is a full screen widget which is designed for showing a full screen advertisement.  
#### Add support for Interstitial ad unit

Load Interstitial ad: 
```Swift
if Kidoz.instance().isSDKInitialized() {
   KidozInterstitialAd.load(delegate: self)
}
```

Show Interstitial ad:  
```Swift
if interstitialAd != nil && interstitialAd!.isLoaded() {
   interstitialAd!.show(viewController: <YourViewController>)
}
```

Report the `KidozInterstitialDelegate` protocol's callbacks: 
```Swift  
func onInterstitialAdLoaded(ad: KidozSDK.KidozInterstitialAd)
func onInterstitialAdFailedToLoad(error: KidozSDK.KidozError)
func onInterstitialAdShown(ad: KidozSDK.KidozInterstitialAd)
func onInterstitialAdFailedToShow(error: KidozSDK.KidozError)
func onInterstitialImpression()
func onInterstitialAdClosed(ad: KidozSDK.KidozInterstitialAd)
```
**Kidoz iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads: Before the game ends, between game levels, after completing a game level .   
- Some Interstitial Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-onInterstitialAdShown:` and `-onInterstitialAdClosed:` callbacks:
```Swift
onInterstitialAdShown {
// mute|pause background sounds
// pause your game 
}

onInterstitialAdClosed {
// unmute|resume background sounds
// resume your game 
}
```
<BR>

## Kidoz iOS Rewarded Ad
**Rewarded**  is a full screen widget which is designed for showing a full screen advertisement.   
#### Add support for Rewarded ad unit

Load Rewarded ad: 
```Swift
if Kidoz.instance().isSDKInitialized() {
   KidozRewardedAd.load(delegate: self)
}
```

Show Rewarded ad:  
```Swift
if rewardedAd != nil && rewardedAd!.isLoaded() {
   rewardedAd!.show(viewController: <YourViewController>)
}
```

Report the `KidozRewardedDelegate` protocol's callbacks: 
```Swift  
func onRewardedAdLoaded(ad: KidozSDK.KidozRewardedAd)
func onRewardedAdFailedToLoad(error: KidozSDK.KidozError)
func onRewardedAdShown(ad: KidozSDK.KidozRewardedAd)
func onRewardedAdFailedToShow(error: KidozSDK.KidozError)
func onRewardReceived(ad: KidozSDK.KidozRewardedAd)
func onRewardedImpression()
func onRewardedAdClosed(ad: KidozSDK.KidozRewardedAd)
```
**Kidoz iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads: Based on the implementation of rewarded logic in your game.   
- Some Rewarded Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-onRewardedAdShownWithAd:` and `-onRewardedAdClosedWithAd:` callbacks:
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
```Swift 
let bannerView = KidozBannerView()
```

Load and show Banner:  
```Swift
if Kidoz.instance().isSDKInitialized() {
   bannerView.load()
}
``` 

Close Banner:  
```Swift
bannerView.close()
```  

Report the `KidozBannerDelegate` protocol's callbacks: 
```Swift
func onBannerAdLoaded()
func onBannerAdFailedToLoad(error: KidozSDK.KidozError)
func onBannerAdShown()
func onBannerAdFailedToShow(error: KidozSDK.KidozError)
func onBannerAdImpression()
func onBannerAdClosed()
```
