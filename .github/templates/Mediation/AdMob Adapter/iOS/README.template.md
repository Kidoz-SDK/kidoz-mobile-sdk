# Kidoz Admob iOS Adapter

## Requirements
- iOS 14.0 or higher
- Xcode 26.2 or higher
- Kidoz iOS SDK 11.x
- Google Mobile Ads SDK 13.7.0 or higher

Check out the [Admob Mediation Documentation](https://developers.google.com/admob/ios/quick-start) for app level integration.

## Integration Steps:
To add Kidoz Admob Adapter to your project with CocoaPods:
```
pod 'KidozAdmobAdapter', '{{VERSION}}'
```

To add it with Swift Package Manager, open **File > Add Package Dependencies…** in Xcode, enter the package URL below, set the dependency rule to **Exact Version** `{{VERSION}}`, and add the `KidozAdmobAdapter` product to your app target:
```
https://github.com/Kidoz-SDK/kidoz-admob-adapter-swift-package
```

Follow instructions on how to [Set Up Custom Events](https://developers.google.com/admob/ios/custom-events/setup#create) on the AdMob dashboard and set up Kidoz's adapter class:

- Set the following full path in the `Class Name` field: </br>
`KidozAdmobAdapter`

- Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}`

- Replace `publisherId` and `publisherToken` with the credentials received during [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).

## iOS SKAdNetwork Support

Please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
