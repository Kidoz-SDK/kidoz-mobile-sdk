# Kidoz Unity SDK

Kidoz Android SDK Version: 9.0.0
Kidoz iOS SDK Version: 9.0.0
	
Built with Unity 2021.3.16f1 Version

**Here you can get the Kidoz Unity plugin and a sample app for Unity. See integration instructions and additional information bellow.**

***This SDK version was verified not to contain the Advertiser Identifier (IDFA) as required by Apple App Store regulation for apps of Kids category.***

## General

This Unity application project provides an example of the [Kidoz](http://www.kidoz.net) SDK integration.

The example application contains the following creative tools:

_Recommended units_:
* Kidoz Interstitial view `Rewarded View`
* Kidoz Interstitial view `Interstitial View`
* Kidoz Banner `Banner` 
	
Before publishing your first app please finish the onboarding process for [Kidoz's publishers](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).
	
## iOS SKAdNetwork Support

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
	
For more information, see [Configuring ad network IDs on Unity](https://docs.unity.com/ads/ConfiguringAdNetworkIDs.html) and  [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).


## Kidoz SDK - Getting Started

1. Import the `KidozSDK` Unity package. `Assets` --> `Import Package` --> `Custom Package` --> select the extracted KidozSDK package.
2. In the import window select all components. A new Prefabs object named `KidozObject` will appear in the Assets folder. 
3. Open your requested Scene. 
4. Drag the `KidozObject` into the selected scene.
5. Select the `KidozObject` and enter your `Publisher ID` and `Security Token`. To receive these credentials please finish the onboarding process for [Kidoz's publishers](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github) if you haven't done so already.

6. If you're having issues with the 'KidozObject' you can open the SampleScene by double clicking it instead.

<a href="url"><img src="http://d28lrrc51wcjkk.cloudfront.net/sdk/Unity_SDK_Publisher_Security_Token.png" align="center" height="250" width="400" ></a>

*Note: When compiling for iOS please add the following frameworks: libsqlite3.tbd, webkit.framework*

## Using the SDK

See full usage example on our [Sample app Main scene script](/Kidoz%20Direct/Unity/SampleApp/Assets/Scenes/MainCode.cs)
1. Select your relevant script file.
2. Add ```using KidozSDK;``` in the using section of your code.

### SDK init Callbacks Events
```java
        Kidoz.initSuccess += < onSDKInit >;
        Kidoz.initError += < onSDKInitFailed >;
```

### Interstitial load/show and Callbacks Events:

Invoke the following method to load an interstitial ad. Set the flag isAutoShow to true if you want to automatically show ad when loaded.
```java
 	Kidoz.loadInterstitialAd(false); // Set the flag isAutoShow to true if you want to automatically show ad when loaded.
  ```
Invoke the Following method to show the ad afteronInterstitialLoaded callback is fired.
```java
	Kidoz.showInterstitial();
```

```java
        Kidoz.onInterstitialLoaded += < onInterstitialLoaded >;
        Kidoz.onInterstitialFailedToLoad += < onInterstitialFailedToLoad >;
        Kidoz.onInterstitialShown += < onInterstitialShown >;
        Kidoz.onInterstitialFailedToShow += < onInterstitialFailedToShow;
        Kidoz.onInterstitialImpression += < onInterstitialImpression;
        Kidoz.onInterstitialClosed += < onInterstitialClosed;
```
### SDK init Callbacks Events
        Kidoz.onRewardedLoaded += < onRewardedLoaded >;
        Kidoz.onRewardedFailedToLoad += < onRewardedFailedToLoad >;
        Kidoz.onRewardedShown += < onRewardedShown >;
        Kidoz.onRewardedFailedToShow += < onRewardedFailedToShow >;
        Kidoz.onRewardedImpression += < onRewardedImpression >;
        Kidoz.onRewardedReceived += < onRewardedReceived >;
        Kidoz.onRewardedClosed += < onRewardedClosed >;

### SDK init Callbacks Events
        Kidoz.onBannerLoaded += < onBannerLoaded >;
        Kidoz.onBannerFailedToLoad += < onBannerFailedToLoad >;
        Kidoz.onBannerShown += < onBannerShown >;
        Kidoz.onBannerFailedToShow += < onBannerFailedToShow >;
        Kidoz.onBannerImpression += < onBannerImpression >;
        Kidoz.onBannerClosed += < onBannerClosed >;

## Kidoz Banner 
To load a banner ad:
```java
Kidoz.loadBanner (<AUTO_SHOW>, <BANNER_POSITION>);
AUTO_SHOW - Should banner be shown as soon as it finishes loading

```
The banner can be placed on one of six sides of the activity screen with BANNER_POSITION - `TOP_CENTER`, `BOTTOM_CENTER` ,`TOP_LEFT` ,`TOP_RIGHT` ,`BOTTOM_LEFT` ,`BOTTOM_RIGHT`.

To show a non-autoShow banner:
```java
Kidoz.showBanner ();
```

To hide a visible banner:
```java
Kidoz.hideBanner ();
```

To change banner position:
```java
Kidoz.setBannerPosition(<BANNER_POSITION>);
```

Delegate callbacks:
```java
Kidoz.bannerReady += <bannerReady Callback>;
Kidoz.bannerClose += <bannerClose Callback>;
Kidoz.bannerLoadError += <bannerLoadError Callback>;
Kidoz.bannerShowError += <bannerShowError Callback>;
Kidoz.bannerNoOffers +=<bannerNoOffers Callback> ;
```
# Kidoz Interstitial / Rewarded View 

KidozInterstitial is a full screen single ad unit which can be used as simple interstitial or rewared mode.

You can activate the interstitial widget by first calling the load function
```Kidoz.loadInterstitialAd(false); ```

To request rewarded ad call this function
```Kidoz.loadRewardedAd(false); ```


The second stage after the ad was loaded (using the Kidoz.interstitialReady/rewardedReady callback you can call
```Kidoz.showInterstitial(); ```
or 
```Kidoz.showRewarded(); ```

 
It is possible to test if the ad was loaded using the following function:
```Kidoz.getIsInterstitialLoaded() ```
or
```Kidoz.getIsRewardedLoaded() ```

all listeners are of type: private void listenerName(string value)
 	Kidoz.bannerReady += bannerReady;
		
	Kidoz.interstitialOpen += listenerName;
		
	Kidoz.interstitialClose += listenerName;
		
	Kidoz.interstitialReady += listenerName;
	
	Kidoz.interstitialOnLoadFail += interstitialOnLoadFail;

	Kidoz.interstitialOnNoOffers += interstitialOnNoOffers;
	
	Kidoz.onRewardedDone += onRewardedDone; 
		
	Kidoz.onRewardedVideoStarted += onRewardedVideoStarted;
		
	Kidoz.rewardedOpen += rewardedOpen;
	
	Kidoz.rewardedClose += rewardedClose;
	
	Kidoz.rewardedReady += rewardedReady;
	
	Kidoz.rewardedOnLoadFail += rewardedOnLoadFail;
	
	Kidoz.rewardedOnNoOffers += rewardedOnNoOffers;
	

**Kidoz iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads : Before the game ends, between game levels, after completing a game level .   
- Some Interstitial Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `interstitialOpen` and `interstitialClose` callbacks:
```
Kidoz.interstitialOpen += interstitialOpen;	
Kidoz.interstitialClose += interstitialClose;
```
```
private void interstitialOpen(string  value)  {
// mute/pause background sounds
// pause your game 
}

private void interstitialClose(string  value)
// unmute/resume background sounds
// resume your game 
}

OR

Setting the Kidoz.SetiOSAppPauseOnBackground(true); 
```

**Kidoz iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads : Based on the implementation of rewarded logics in your game .   
- Some Rewarded Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `rewardedOpen` and `rewardedClose` callbacks:
```
Kidoz.rewardedOpen += rewardedOpen;  
Kidoz.rewardedClose += rewardedClose;
```
```

-(void)rewardedOpen {
//mute/pause background sounds
//pause your game 
}

-(void)rewardedClose {
//unmute/resume background sounds
//resume your game 
}

OR

Setting the Kidoz.SetiOSAppPauseOnBackground(true); 
```

**Note for Android:**
```
If you are using the Minify option in the Player settings please add this to proguard-user.txt file:  
  
-keepclasseswithmembers class com.kidoz.sdk.** {*;}  
-keep @interface org.greenrobot.eventbus.Subscribe  
-keepclassmembers class * {  
@org.greenrobot.eventbus.Subscribe <methods>;  
}
```

Trouble Shooting
================
**Kidoz SDK and this sample app are compatible with Android 4.2 (API level 17) and above, iOS 8.0 and above and Unity versions greater than 5**

**Kidoz plugin does not currently support Unity editor runtime. Please make sure you switch to a relevant platform (iOS/Android) before working or ignore any error in the Editor runtime.

**When comming from a previous version, please manually delete previous okhttp jar file, and use the attached onen**

**When comming from a previous version,  please manually delete previous okio jar file, and use the attached onen**

**When comming from a previous version, please manually delete the Kidoz.cs located in the root assetes folder , since we moved the file postion. also make sure that teh KidozObject points to the new Kidoz script**

**Android Build Tools Version**
This demo application uses `buildToolsVersion "22.0.1"`. if your `Android Studio` is not updated with this version you can follow one of these steps (or both):
1. Inside `Android Studio` click the `SDK Manager` icon
2. In the left side menu, navigate to `Appearance & Behavior` --> `System Settings` --> `Android SDK`
3. Click the `SDK Tools` tab
4. Check the `Android SDK Build Tools` and click `OK` 


# For any question or assistance, please contact us at SDK@kidoz.net.
</br>
License
--------

    Copyright 2022 Kidoz, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
