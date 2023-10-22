# Kidoz Unity Plugin

## Getting Started:

If you don't have the [External Dependency Manager](https://github.com/googlesamples/unity-jar-resolver) already integrated in your app, please download and import [external-dependency-manager-1.2.177.unitypackage](/Kidoz%20Direct/Unity/external-dependency-manager-1.2.177.unitypackage) into your project. 

1. Download and import [KidozUnityPlugin.unitypackage](/Kidoz%20Direct/Unity/KidozUnityPlugin.unitypackage) into your project's Asset Folder.
2. In the import window select all components. A new Prefabs object named `KidozObject` will appear in the Assets folder. 
3. Open your requested Scene. 
4. Drag the `KidozObject` into the selected scene.
5. Select the `KidozObject` and enter your `Publisher ID` and `Security Token`. To receive these credentials please complete the process for [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github) if you haven't done so already.

6. If you're having issues with the 'KidozObject' you can open the SampleScene by double clicking it instead.

<a href="url"><img src="http://d28lrrc51wcjkk.cloudfront.net/sdk/Unity_SDK_Publisher_Security_Token.png" align="center" height="250" width="400" ></a>


## Using the SDK

See full usage example on our [Sample app Main scene script](/Kidoz%20Direct/Unity/SampleApp/Assets/Scenes/MainCode.cs)
1. Select your relevant script file.
2. Add ```using KidozSDK;``` in the using section of your code.

#### SDK init callbacks events
```java
Kidoz.initSuccess += < onSDKInit >;
Kidoz.initError += < onSDKInitFailed >;
```

#### Interstitial lifecycle methods callbacks:

Invoke the following method to load an interstitial ad.
```java
 Kidoz.loadInterstitialAd(false); // Set the flag isAutoShow to true if you want to automatically show ad when loaded.
  ```
Invoke the Following method to show the ad after onInterstitialLoaded callback is triggered.
```java
Kidoz.showInterstitial();
```
Before loading the first interstitial ad set following callback event handlers:
```java
Kidoz.onInterstitialLoaded += < onInterstitialLoaded >;
Kidoz.onInterstitialFailedToLoad += < onInterstitialFailedToLoad >;
Kidoz.onInterstitialShown += < onInterstitialShown >;
Kidoz.onInterstitialFailedToShow += < onInterstitialFailedToShow;
Kidoz.onInterstitialImpression += < onInterstitialImpression;
Kidoz.onInterstitialClosed += < onInterstitialClosed;
```
#### Rewarded lifecycle methods callbacks:

Invoke the following method to load a rewarded ad. Set the flag isAutoShow to true if you want to automatically show ad when loaded.
```java
 Kidoz.loadRewardedAd(false); // Set the flag isAutoShow to true if you want to automatically show ad when loaded.
  ```
Invoke the Following method to show the ad after onRewardedLoaded callback is triggered.
```java
Kidoz.showRewarded();
```
Before loading the first rewarded ad set following callback event handlers:
```java
Kidoz.onRewardedLoaded += < onRewardedLoaded >;
Kidoz.onRewardedFailedToLoad += < onRewardedFailedToLoad >;
Kidoz.onRewardedShown += < onRewardedShown >;
Kidoz.onRewardedFailedToShow += < onRewardedFailedToShow >;
Kidoz.onRewardedImpression += < onRewardedImpression >;
Kidoz.onRewardedReceived += < onRewardedReceived >;
Kidoz.onRewardedClosed += < onRewardedClosed >;
```

### Banner lifecycle methods callbacks:

Invoke the following method to load and show a banner ad. 
```java
// Set the flag isAutoShow to false if you <u>don't</u> want to automatically show the banner once loaded.
// Set the requested banner position: BOTTOM_CENTER,TOP_CENTER,TOP_LEFT,TOP_RIGHT,BOTTOM_LEFT,BOTTOM_RIGHT. 
 Kidoz.loadBanner(true, Kidoz.BANNER_POSITION.BOTTOM_CENTER); 
  ```
In case you choose to set the isAutoShow to false, invoke the Following method to show the banner after onBannerLoaded callback is triggered.
```java
Kidoz.showBanner();
```
Before loading the first rewarded ad set following callback event handlers:
```java
Kidoz.onBannerLoaded += onBannerLoaded;
Kidoz.onBannerFailedToLoad += onBannerFailedToLoad;
Kidoz.onBannerShown += onBannerShown;
Kidoz.onBannerFailedToShow += onBannerFailedToShow;
Kidoz.onBannerImpression += onBannerImpression;
Kidoz.onBannerClosed += onBannerClosed;
```

## iOS integration

**iOS SKAdNetwork Support**

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
	
For more information, see [Configuring ad network IDs on Unity](https://docs.unity.com/ads/ConfiguringAdNetworkIDs.html) and  [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).

**Build tips**

If you encounter issues while building your iOS application you may try the following:

On <b>project level</b> build settings and not on target add:

1. Library Search Path:
```java   
$(SDKROOT)/usr/lib/swift $(TOOLCHAIN_DIR)/usr/lib/swift-5.5/$(PLATFORM_NAME) $(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)
```
See https://stackoverflow.com/a/65602500/5572423


2. Runpath Search Path:
```java
/usr/lib/swift $(inherited) @executable_path/Frameworks
```
See https://stackoverflow.com/a/57669947/5572423

**Kidoz iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads: Before the game ends, between game levels, after completing a game level.   
- Some Interstitial Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `onInterstitialShown` and `onInterstitialClosed` callbacks:
```
Kidoz.onInterstitialShown += < onInterstitialShown >;	
Kidoz.onInterstitialClosed += < onInterstitialClosed >;
```
```
private void onInterstitialShown(string  value)  {
// mute/pause background sounds
// pause your game 
}

private void onInterstitialClosed(string  value)
// unmute/resume background sounds
// resume your game 
}

OR

Setting the Kidoz.SetiOSAppPauseOnBackground(true); 
```

**Kidoz iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads: Based on the implementation of rewarded logic in your game .   
- Some Rewarded Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `onRewardedShown` and `onRewardedClosed` callbacks:
```
Kidoz.onRewardedShown += onRewardedShown;  
Kidoz.rewardedClose += onRewardedClosed;
```
```

-(void)onRewardedShown {
//mute/pause background sounds
//pause your game 
}

-(void)onRewardedClosed {
//unmute/resume background sounds
//resume your game 
}

OR

Setting the Kidoz.SetiOSAppPauseOnBackground(true); 
```
