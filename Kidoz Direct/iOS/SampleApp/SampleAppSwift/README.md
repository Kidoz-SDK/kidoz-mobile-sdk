# Kidoz iOS Mobile SDK - Swift

## Initialize Kidoz SDK
Call the initialize method with the Publisher ID and Security Token which you received during [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).

```Swift
Kidoz.instance.initialize(publisherID: <enter your publisher ID>, securityToken: <enter your security Token>, delegate: <KidozInitDelegate>)
````

You can check Kidoz SDK state using the following method:

```Swift
Kidoz.instance.isSDKInitialized()
```

Report the `KidozInitDelegate` protocol's callbacks:

```Swift
func onInitSuccess()
func onInitError(_ error: String)
```

<BR>

## Kidoz iOS Interstitial Ad

**Intersitial** is a full screen widget which is designed for showing a full screen advertisement.

#### Add support for Interstitial ad unit

Load Interstitial ad:

```Swift
if Kidoz.instance.isSDKInitialized() {
   KidozInterstitialAd.load(delegate: <KidozInterstitialDelegate>)
}
```

Show Interstitial ad:

```Swift
if let intestitial = interstitialAd, intestitial.isLoaded() {
   intestitial.show(viewController: <YourViewController>)
}
```

Report the `KidozInterstitialDelegate` protocol's callbacks:

```Swift
func onInterstitialAdLoaded(kidozInterstitialAd: KidozSDK.KidozInterstitialAd)
func onInterstitialAdFailedToLoad(kidozError: KidozSDK.KidozError)
func onInterstitialAdShown(kidozInterstitialAd: KidozSDK.KidozInterstitialAd)   
func onInterstitialAdFailedToShow(kidozInterstitialAd: KidozSDK.KidozInterstitialAd, kidozError: KidozSDK.KidozError)
func onInterstitialImpression(kidozInterstitialAd: KidozSDK.KidozInterstitialAd)
func onInterstitialAdClosed(kidozInterstitialAd: KidozSDK.KidozInterstitialAd)
```

**Kidoz iOS Interstitial best practices**

* The preferred timing to show Interstitial Ads: Before the game ends, between game levels, after completing a game level .
* Some Interstitial Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-onInterstitialAdShown:` and `-onInterstitialAdClosed:` callbacks:

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
if Kidoz.instance.isSDKInitialized() {
   KidozRewardedAd.load(delegate: <KidozRewardedDelegate>)
}
```

Show Rewarded ad:

```Swift
if let rewarded = rewardedAd, rewarded.isLoaded() {
rewarded.show(viewController: baseMainViewController)
}
```

Report the `KidozRewardedDelegate` protocol's callbacks:

```Swift
func onRewardedAdLoaded(kidozRewardedAd: KidozSDK.KidozRewardedAd)
func onRewardedAdFailedToLoad(kidozError: KidozSDK.KidozError)
func onRewardedAdShown(kidozRewardedAd: KidozSDK.KidozRewardedAd)
func onRewardedAdFailedToShow(kidozRewardedAd: KidozSDK.KidozRewardedAd, kidozError: KidozSDK.KidozError)
func onRewardReceived(kidozRewardedAd: KidozSDK.KidozRewardedAd)
func onRewardedImpression(kidozRewardedAd: KidozSDK.KidozRewardedAd)
func onRewardedAdClosed(kidozRewardedAd: KidozSDK.KidozRewardedAd)
```

**Kidoz iOS Rewarded best practices**

* The preferred timing to show Rewarded Ads: Based on the implementation of rewarded logic in your game.
* Some Rewarded Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-onRewardedAdShownWithAd:` and `-onRewardedAdClosedWithAd:` callbacks:

```Swift
onRewardedAdShownWithAd {
// mute|pause background sounds
// pause your game 
}

onRewardedAdClosedWithAd {
// unmute|resume background sounds
// resume your game 
}
```

<BR>

## Kidoz iOS Banner

#### Add support for Banner ad unit

Initialize Banner:

```Swift
let bannerView = KidozBannerView()
bannerView.delegate = <KidozBannerDelegate>
```

Load and show Banner:

```Swift
if Kidoz.instance.isSDKInitialized() {
   bannerView.load()
}
```

Close Banner:

```Swift
bannerView.close()
```

Report the `KidozBannerDelegate` protocol's callbacks:

```Swift
func onBannerAdLoaded(kidozBannerView: KidozSDK.KidozBannerView)
func onBannerAdFailedToLoad(kidozBannerView: KidozSDK.KidozBannerView, error: KidozSDK.KidozError)
func onBannerAdShown(kidozBannerView: KidozSDK.KidozBannerView)
func onBannerAdFailedToShow(kidozBannerView: KidozSDK.KidozBannerView, error: KidozSDK.KidozError)
func onBannerAdImpression(kidozBannerView: KidozSDK.KidozBannerView)
func onBannerAdClosed(kidozBannerView: KidozSDK.KidozBannerView)
```

<BR>

## Kidoz iOS ORTB (Server-to-Server Bidding)

Kidoz SDK supports Server-to-Server (S2S) bidding integrations for Interstitial, Rewarded, and Banner ad types.

The flow inside your app is:

1. **Get a Bid Signal from the SDK**
   Call the SDK’s `getSignal()` method for the desired ad unit. This returns a string that you send to your server or exchange to request bids.

2. **Request Bids From Your Server** *(out of scope for the SDK)*
   Your server communicates with Kidoz or other exchanges to obtain bids.

3. **Load a Winning Bid Into the SDK**
   Once you have a winning bid response string, create a `KidozBid` instance and call the relevant `load(bid:delegate:)` method to load the ad.

### 1. Get Bid Signal

```Swift
// Interstitial
let interstitialSignal = KidozInterstitialAd.getSignal()

// Rewarded
let rewardedSignal = KidozRewardedAd.getSignal()

// Banner
let bannerSignal = KidozBannerView.getSignal()
```

### 2. Create a `KidozBid` From the Winning Bid Response

```Swift
let kidozBid = KidozBid(bidResponse: String)
```

### 3. Load the Ad With the Bid

```Swift
// Interstitial
KidozInterstitialAd.load(bid: kidozBid, delegate: self)

// Rewarded
KidozRewardedAd.load(bid: kidozBid, delegate: self)

// Banner
bannerView.load(bid: kidozBid, delegate: self)
```

You continue to implement the same delegate callbacks (`KidozInterstitialDelegate`, `KidozRewardedDelegate`, `KidozBannerDelegate`) to receive load/show/close events as with the standard loading methods.
