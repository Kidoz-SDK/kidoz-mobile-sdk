# Kidoz ironSource iOS Adapter

## Requirements
- iOS 14.0 or higher
- Xcode 26.2 or higher
- Kidoz iOS SDK 11.x
- ironSource LevelPlay SDK 9.4.1 or higher

Check out the [ironSource Integration Documentation](https://developers.is.com/ironsource-mobile/ios/ios-sdk/) for app level integration.

## Integration Steps:

To add Kidoz ironSource Adapter to your project with CocoaPods:
```
pod 'KidozIronSourceAdapter', '{{VERSION}}'
```

## iOS SKAdNetwork Support

Please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
