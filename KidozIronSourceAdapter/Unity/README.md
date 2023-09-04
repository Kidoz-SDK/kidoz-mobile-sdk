# Unity ironSource Adapter

The Kidoz Unity ironSource Adapter SDK is built and tested with ironSource mediation v7.2.3.1.<BR>
You should only use version 7.2.0.0 or above as it is the first stable custom mediation release with both Interstital and Rewarded support.<BR>

This adapter offers support for the following ad types:

+ ironSource Interstitial Mediation 
+ ironSource Rewarded Video Mediation 

  
Before publishing your first app please finish the onboarding process for Kidoz's publishers [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=)  
and follow the instructions for ironSource Custom Adapter setup [HERE](https://developers.is.com/ironsource-mobile/general/custom-adapter-setup/).<BR><BR>
Kidoz Network ID on ironSource is `2b618dcd` and you will need to setup the network level parameters with the `Publisher Id` and `Token` you got from Kidoz:  
  
  <img width="598" alt="ironSourceNetwork" src="https://user-images.githubusercontent.com/86282008/149078934-107106f0-a526-45bc-9c93-8ca53d5bf3cc.png">

Getting Started
=================================

- Download and import [KidozISAdapter.unitypackage](https://github.com/Kidoz-SDK/unity-ironsource-adapter/blob/main/KidozISAdapter.unitypackage) into your Unity project
- Follow ironSource instructions for Unity plugin integration [HERE](https://developers.is.com/ironsource-mobile/unity/unity-plugin).
  
IronSource Integration
=================================
  
For built in Mediation Network Integration you should follow the instructions given on the ironSource Android SDK Integration page [HERE](https://developers.is.com/ironsource-mobile/unity/mediation-networks-unity) but as far as Kidoz integration goes you only need to do the following on your Scene:
  
For supporting manual Rewarded Videos loading invoke:
```c#
IronSource.Agent.setManualLoadRewardedVideo(true);
```
and invoke the init method with your app's ironSource key:
```c#  
IronSource.Agent.init(appKey);
```
For further demonstration on how to load,show and handle lifecycle events for Interstitials and Rewarded Videos Ads check out our Main Scene sample code [HERE](https://github.com/Kidoz-SDK/unity-ironsource-adapter/blob/main/Assets/DemoScene/MainSceneScript.cs).  

  
# iOS SKAdNetwork Support

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
	
For more information, see [Configuring ad network IDs on Unity](https://docs.unity.com/ads/ConfiguringAdNetworkIDs.html) and  [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).


# Stay in touch 
For any question or assistance, please contact us at SDK@kidoz.net.
</br>

# License
--------

    Copyright 2015 Kidoz, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
