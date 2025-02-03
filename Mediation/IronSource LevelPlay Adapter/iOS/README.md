# Kidoz ironSource iOS Adapter

The Kidoz ironSource Adapter SDK was tested with ironSource mediation v8.1.0.0.<BR> 
The minimum supported Xcode version is 14.3.1.<BR><BR>
Check out the [ironSource Integration Documentation](https://developers.is.com/ironsource-mobile/ios/ios-sdk/) for app level integration.

## Integration Steps:

To add Kidoz ironSource Adapter to your project with CocoaPods:
```
pod 'KidozSDK', '9.1.5'
pod 'KidozIronSourceAdapter', '1.3.2'
```

## iOS SKAdNetwork Support

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
