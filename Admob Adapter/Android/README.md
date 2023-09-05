# Kidoz Android Admob Adapter
Kidoz SDK v9.0.0 <BR>
Kidoz Admob mediation adapter v1.8.1.1<BR>
Built and tested with Google Mobile Ads SDK 20.5.0 (play-services-ads:20.5.0)<BR>


## Prerequisites: ##
* Before publishing your first app please finish the onboarding process for [Kidoz's publishers](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).
* Google Mobile Ads SDK 20.0.0 or higher integrated in your project as [explained here](https://developers.google.com/admob/android/quick-start):

</br>

## Integration Steps: ##
Add the following dependencies to your app's build.gradle file:
```
    implementation "org.greenrobot:eventbus:3.2.0"
    implementation "net.kidoz.sdk:kidoz-android-native:8.9.7"
    implementation "net.kidoz.sdk:kidoz-android-admob-adapter:1.8.1.1"
```

<BR>
Define Kidoz Interstitial/Rewarded Video/Banner Custom events as explained [HERE](https://support.google.com/admob/answer/3083407):
 
**Kidoz Interstitial Adapter**
* Set the following full path in the `Class Name` field: </br>
`com.kidoz.mediation.admob.adapters.KidozAdmobMediationInterstitialAdapter`
* Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>

**Kidoz Rewarded Video Adapter**
* Set the following full path in the `Class Name` field: </br>
`com.kidoz.mediation.admob.adapters.KidozAdmobMediationRewardedAdapter`
* Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>

**Kidoz Banner Adapter**
* Set the following full path in the `Class Name` field: </br>
`com.kidoz.mediation.admob.adapters.KidozAdmobMediationBannerAdapter`
* Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>
</br>

<B>*</B> Replace `publisherId` and `publisherToken` with the credentials received during the Kidoz Publisher Account sign up.

 **Note: If you are using the Minify option in the build settings please add this to your proguard rules file:**  
```
-keepclasseswithmembers class com.kidoz.** {*;}  
-keep @interface org.greenrobot.eventbus.Subscribe  
-keepclassmembers class * {  
@org.greenrobot.eventbus.Subscribe <methods>;  
}
```


## Kidoz - Admob Settings Recommendations ##

_Programmatic_ **|** _app-ads.txt_

1. We recommend setting up app-ads.txt for the apps that use Kidoz sdk in your Admob dashboard. This may prevent blocking of programmatic ads.
Once you add an app and generate the relevant entry for it, you can paste it into your app-ads.txt file. Copy the entry while pressing on "HOW TO SET UP APP-ADS.TXT" link (as described in the screenshot below):

<p align="left">
  <img src="https://cdn.kidoz.net/new/sdk/GITHUB_GRAPHICS/Kidoz_SDK_Documentaions/admob_app_ads_txt2.png" />
</p>

2. Additionally, it is highly recommended to add the Kidoz app-ads.txt in order to increase the fill-rate of your application, as described [HERE](https://kidoz.net/introappadstext)

3. Set up $9 CPM for Kidoz, to make sure the requests are being passed to Kidoz.

<p align="left">
  <img src="https://cdn.kidoz.net/new/sdk/GITHUB_GRAPHICS/Kidoz_SDK_Documentaions/admob_adsources_waterfall.png" />
</p>

## Important note: ##
While mapping the Kidoz Ad unit on Admob, it is highly recommended to run some JSON validator on the parameters passed to the Class name (AppID and Token). This method may minimize parsing mistakes that may rise on initial connection.

# Stay in touch 
For any question or assistance, please contact us at SDK@kidoz.net.
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

