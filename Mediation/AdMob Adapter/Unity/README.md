# Kidoz AdMob Unity Adapter

The kidoz Admob Adapter was built and tested with Google Mobile Ads Unity Plugin v8.5.1<BR>
Check out the [AdMob Unity Plugin Documentation](https://developers.google.com/admob/unity/start) for app level integration.

## Integration Steps:

Download and import [KidozAdmobAdapter.unitypackage](/Mediation/AdMob%20Adapter/Unity/KidozAdmobAdapter.unitypackage) into your Project's Asset Folder.

## iOS integration

### Setting up custom events
Follow instructins on how to [Set Up Custom Events](https://developers.google.com/admob/ios/custom-events/setup#create) on the AdMob dashboard and set up the Kidoz' adapter class:
* Set the following full path in the `Class Name` field: </br>
`KidozAdmobAdapter`
* Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>

<B>*</B> Replace `publisherId` and `publisherToken` with the credentials received during the Kidoz Publisher Account sign up.

### Setting up the SKAdNetwork ID

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).

## Android integration

### Setting up custom events
Follow instructins on how to [Set Up Custom Events](https://developers.google.com/admob/android/custom-events/setup#create) on the AdMob dashboard and set up the Kidoz' adapter class:
* Set the following full path in the `Class Name` field: </br>
`com.kidoz.mediation.admob.adapters.KidozAdMobAdapter`
* Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>

<B>*</B> Replace `publisherId` and `publisherToken` with the credentials received during the Kidoz Publisher Account sign up.
* 
### Proguard rules
If you are using the Minify option in the Player settings please add this to your proguard-rules file:**  
```
-keep @interface org.greenrobot.eventbus.Subscribe  
-keepclassmembers class * {  
  @org.greenrobot.eventbus.Subscribe <methods>;  
}
```
