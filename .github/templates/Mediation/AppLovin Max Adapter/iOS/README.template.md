# Kidoz Applovin Adapters

## Requirements
- iOS 14.0 or higher
- Xcode 26.2 or higher
- Kidoz iOS SDK 11.x
- AppLovin MAX SDK 13.6.0 or higher

Check out the [Max Mediation Documentation](https://dash.applovin.com/documentation/mediation/ios/getting-started/integration) for app level integration.

## Integration Steps:

To add the adapter to your project with CocoaPods:
```
pod 'KidozApplovinAdapter', '{{VERSION}}'
```
## iOS SKAdNetwork Support

Please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
