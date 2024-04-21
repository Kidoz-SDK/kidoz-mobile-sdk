# Kidoz Applovin Adapters

The Kidoz Applovin Max Adapter was built and tested with AppLovinSDK v11.4.4.<BR>
The minimum supported Xcode version is 14.1.<BR><BR>
Check out the [Max Mediation Documentation](https://dash.applovin.com/documentation/mediation/ios/getting-started/integration) for app level integration.

## Integration Steps:

To add the adapter to your project with CocoaPods:
```
pod 'KidozSDK', '9.1.1'
pod 'KidozApplovinAdapter', '1.1.0'
```
## iOS SKAdNetwork Support

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
