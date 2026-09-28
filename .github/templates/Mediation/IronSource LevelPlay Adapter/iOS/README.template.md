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

To add it with Swift Package Manager, open **File > Add Package Dependencies…** in Xcode, enter the package URL below, set the dependency rule to **Exact Version** `{{VERSION}}`, and add the `KidozIronSourceAdapter` product to your app target:
```
https://github.com/Kidoz-SDK/kidoz-levelplay-adapter-swift-package
```

## iOS SKAdNetwork Support

Please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
