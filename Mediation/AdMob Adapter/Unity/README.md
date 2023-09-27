# Kidoz AdMob Unity Adapter

The kidoz Admob Adapter was built and tested with Google Mobile Ads Unity Plugin v8.5.1<BR>
Check out the [AdMob Unity Plugin Documentation](https://developers.google.com/admob/unity/start) for app level integration.

### Integration Steps:

Download and import [KidozAdmobAdapter.unitypackage](/Mediation/AdMob%20Adapter/Unity/KidozAdmobAdapter.unitypackage) into your Project's Asset Folder.

### iOS integration

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
```


## Integration Steps:

* Download and import the KidozAdMobUnity.unitypackage  Assets --> Import Package --> Custom Package --> select  the KidozAdMobUnity.unitypackage package.
* Define Kidoz Banner , Interstitial and/or Rewarded Video Custom events as [explained here](https://support.google.com/admob/answer/3083407).</br>

**Please make sure to set your AdMob app ID and not use Kidoz Sample AdMob app ID before you publish your apps like described in the [Admob Guide](https://developers.google.com/admob/unity/quick-start#set_your_admob_app_id).**

## Setup for Android 
 
### Kidoz Interstitial Adapter:
Set the following full path in the `Class Name` field:
```
com.kidoz.mediation.admob.adapters.KidozAdMobMediationInterstitialAdapter
```

Set your publisherId and  publisherToken as the following in the `Parameter` field:
```
{"AppID":"your_publisher_Id", "Token":"your_publisher_Token"}
```

### Kidoz Rewarded Video Adapter:
Set the following full path in the `Class Name` field:
```
com.kidoz.mediation.admob.adapters.KidozAdMobMediationRewardedAdapter
```
Set your publisherId and  publisherToken as the following in the `Parameter` field:
```
{"AppID":"your_publisher_Id", "Token":"your_publisher_Token"
```

 **Note: For Unity plugin lower than 3.16.0 Set the full path in the Class Name field:**
```
com.kidoz.mediation.admob.adapters.KidozAdMobMediationLegacyRewardedAdapter
``` 
  
### Kidoz Banner Adapter:
Set the following full path in the `Class Name` field:
```
com.kidoz.mediation.admob.adapters.KidozAdMobMediationBannerAdapter
```

Set your publisherId and  publisherToken as the following in the `Parameter` field :
```
{"AppID":"your_publisher_Id", "Token":"your_publisher_Token"} 
```

 **Note: If you are using the Minify option in the Player settings please add this to proguard-user.txt file:**  
```
-keepclasseswithmembers class com.kidoz.** {*;}  
-keep @interface org.greenrobot.eventbus.Subscribe  
-keepclassmembers class * {  
@org.greenrobot.eventbus.Subscribe <methods>;  
}
```

## Setup for iOS

This SDK version was verified not to contain the Advertiser Identifier (IDFA) as required by Apple App Store regulation for apps of Kids category.

### SKAdNetwork Support:

**Important: In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):**

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring ad network IDs on Unity](https://docs.unity.com/ads/ConfiguringAdNetworkIDs.html) and  [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).

### Kidoz Interstitial Adapter:
Set the following full path in the `Class Name` field:
```
KidozAdMobMediationInterstitialAdapter
```
Set your publisherId and  publisherToken as the following in the `Parameter` field:
```
{"AppID":"your_publisher_Id", "Token":"your_publisher_Token"}
```

### Kidoz Rewarded Video Adapter:
Set the following full path in the `Class Name` field:
```
KidozAdMobMediationRewardedAdapter
```

Set your publisherId and  publisherToken as the following in the `Parameter` field:
```
{"AppID":"your_publisher_Id", "Token":"your_publisher_Token"
```

 **Note: For Unity plugin lower than 3.16.0 Set the full path in the Class Name field:**
```
KidozAdMobMediationRewardedLegacyAdapter
``` 

### Kidoz Banner Adapter:
Set the following full path in the `Class Name` field:
```
KidozAdMobMediationBannerAdapter
```

Set your publisherId and  publisherToken as the following in the `Parameter` field:
```
{"AppID":"your_publisher_Id", "Token":"your_publisher_Token"
```

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
