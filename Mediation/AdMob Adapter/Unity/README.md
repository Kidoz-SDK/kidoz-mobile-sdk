# Kidoz AdMob Adapter Unity Package

The Kidoz Admob Adapter was built and tested with Google Mobile Ads Unity Plugin v9.5.0<BR>
Check out the [AdMob Unity Plugin Documentation](https://developers.google.com/admob/unity/start) for app level integration.

## Integration Steps:

Download and import [KidozAdmobAdapter.unitypackage](/Mediation/AdMob%20Adapter/Unity/KidozAdmobAdapter.unitypackage) into your project's Asset Folder.

## iOS integration

#### Setting up custom events
Follow instructions on how to [Set Up Custom Events](https://developers.google.com/admob/ios/custom-events/setup#create) on the AdMob dashboard and set up Kidoz's adapter class:
* Set the following full path in the `Class Name` field: </br>
`KidozAdmobAdapter`
* Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>

<B>*</B> Replace `publisherId` and `publisherToken` with the credentials received during [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github) process.

#### Setting up the SKAdNetwork ID

Please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).

## Android integration

#### Setting up custom events
Follow instructions on how to [Set Up Custom Events](https://developers.google.com/admob/android/custom-events/setup#create) on the AdMob dashboard and set up Kidoz's adapter class:
- Set the following full path in the `Class Name` field: </br>
`com.kidoz.mediation.admob.adapters.KidozAdMobAdapter`

- Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}`

- Replace `publisherId` and `publisherToken` with the credentials received during [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github) process.

