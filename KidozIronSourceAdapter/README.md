# Kidoz ironSource Adapters

The Kidoz ironSource Adapter SDK is built and tested with ironSource mediation v7.2.3.1.<BR>
You should only use this version or above as it is the first stable custom mediation release. <BR>

The Adapter offers support for the following ad types:

+ ironSource Interstitial Mediation 
+ ironSource Rewarded Video Mediation 
  
Until ironSource mediation SDK supports Banner mediation for custom networks, publishers who choose to do so can use Kidoz banners directly
from Kidoz SDK.<BR>

# Prerequisites

Before publishing your first app please finish the onboarding process for Kidoz's publishers [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=)  
and follow the instructions for ironSource Custom Adapter setup [HERE](https://developers.is.com/ironsource-mobile/general/custom-adapter-setup/).<BR><BR>
Kidoz Network ID on ironSource is `2b618dcd` and you will need to setup the network level parameters with the `Publisher Id` and `Token` you got from Kidoz:  
  
  <img width="598" alt="ironSourceNetwork" src="https://user-images.githubusercontent.com/86282008/149078934-107106f0-a526-45bc-9c93-8ca53d5bf3cc.png">
  
# Getting Started

Include the following files: KidozSDK.h and libKidozSDK_IronSourceAdapter.a taken from [HERE](https://github.com/Kidoz-SDK/ios-ironsource-adapter/tree/main/KidozIronSourceSample/Kidoz).
  
If you are using swift, you need to make sure your application is pointing to KidozSDK.h and IronSource.h files. Include them in your Objective-C Bridging Header.
See an example Bridging Header file [HERE](https://github.com/Kidoz-SDK/ios-ironsource-adapter/blob/main/KidozIronSourceSample/Kidoz-Bridging-Header.h).


# IronSource Integration
  
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

  
Until ironSource mediation SDK supports banners custom adapters publishers can load and show Kidoz banners by using Kidoz SDK directly.

```java
// Intializing Kidoz SDK if not already Initialized by ironSource
  
  if(!Kidoz.instance().isSDKInitialized()){      
      Kidoz.instance().initialize(withPublisherID: `Publisher ID`, securityToken: `Token`,with :self)
  }
  else{
     initBannerWithView()
  }
```
Make sure the `Publisher ID` and `Token` you send on the `KidozSDK.instance()initialize(...)` method are your own unique parameters and not the Kidoz Test parameters used in this sample. This parameters need to be the same ones you used as network level parameters when adding the Kidoz network on the ironSource dashboard.<BR>
  
See the [sample code](https://github.com/Kidoz-SDK/ios-ironsource-adapter/blob/main/KidozIronSourceSample/ViewController.swift) for example as how to init, load and show Kidoz Banners and receive lifecycle callbacks.


# Stay in touch 
For any question or assistance, please contact us at SDK@kidoz.net.
</br>

# License
--------

    Copyright 2015 KIDOZ, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
