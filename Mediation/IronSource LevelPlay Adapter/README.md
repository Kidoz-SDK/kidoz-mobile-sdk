# ironSource LevelPlay Adapter

Our Adapters offer support for the following ad types:

+ Interstitial Mediation 
+ Rewarded Video Mediation 
+ Banner Mediation 

On the following platforms:

+ [Native Android](/Mediation/IronSource%20LevelPlay%20Adapter/Android)
+ [Native iOS](/Mediation/IronSource%20LevelPlay%20Adapter/iOS)
+ [Unity](/Mediation/IronSource%20LevelPlay%20Adapter/Unity)

Prerequisites
=================================
  
Before publishing your first app please finish the onboarding process for Kidoz's publishers [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=)  
and follow the instructions for ironSource Custom Adapter setup [HERE](https://developers.is.com/ironsource-mobile/general/custom-adapter-setup/).<BR><BR>
Kidoz Network ID on ironSource is `2b618dcd` and you will need to setup the network level parameters with the `Publisher Id` and `Token` you got from Kidoz:  
  
  <img width="598" alt="ironSourceNetwork" src="https://user-images.githubusercontent.com/86282008/149078934-107106f0-a526-45bc-9c93-8ca53d5bf3cc.png">
  
Getting Started
=================================

Include the following files: KidozSDK.h and libKidozSDK_IronSourceAdapter.a taken from [HERE](https://github.com/Kidoz-SDK/ios-ironsource-adapter/tree/main/KidozIronSourceSample/Kidoz).
  
If you are using swift, you need to make sure your application is pointing to KidozSDK.h and IronSource.h files. Include them in your Objective-C Bridging Header.
See an example Bridging Header file [HERE](https://github.com/Kidoz-SDK/ios-ironsource-adapter/blob/main/KidozIronSourceSample/Kidoz-Bridging-Header.h).


IronSource Integration
=================================
  
On a general note you should follow the instructions given on the ironSource Android SDK Integration page [HERE](https://developers.is.com/ironsource-mobile/ios/ios-sdk/) but as far as Kidoz integration goes you only need to do the following on your activity:
  
```java
  // Initialize the below listeners if you want to support manual Rewarded Video loading
  IronSource.setRewardedVideoManualDelegate(mInterstitialDelegate)
  IronSource.setInterstitialDelegate(mRewardedVideoManualDelegate)

  
  // Init ironSource
  IronSource.initWithAppKey(kAPPKEY) 
  
```
See the [sample code](https://github.com/Kidoz-SDK/ios-ironsource-adapter/blob/main/KidozIronSourceSample/ViewController.swift) for example as how to load and show Interstitial and Rewarded videos and receive Ad units lifecycle callbacks.
Be aware that you need to call the `IronSource.setRewardedVideoManualDelegate(...)` method in order to be able to load and show Rewarded Videos programmatically from your code.
  
Kidoz Direct Banners
=================================
  
Until ironSource mediation SDK supports banners custom adapters publishers can load and show Kidoz banners by using Kidoz SDK directly.

```java
// Intializing Kidoz SDK if not already Initialized by ironSource
  
  if(!KidozSDK.instance().isSDKInitialized()){      
      KidozSDK.instance().initialize(withPublisherID: `Publisher ID`, securityToken: `Token`,with :self)
  }
  else{
     initBannerWithView()
  }
```
Make sure the `Publisher ID` and `Token` you send on the `KidozSDK.instance()initialize(...)` method are your own unique parameters and not the Kidoz Test parameters used in this sample. This parameters need to be the same ones you used as network level parameters when adding the Kidoz network on the ironSource dashboard.<BR>
  
See the [sample code](https://github.com/Kidoz-SDK/ios-ironsource-adapter/blob/main/KidozIronSourceSample/ViewController.swift) for example as how to init, load and show Kidoz Banners and receive lifecycle callbacks.
  
# iOS SKAdNetwork Support

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
