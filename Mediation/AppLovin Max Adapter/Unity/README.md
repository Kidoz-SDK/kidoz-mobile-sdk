# Kidoz Applovin Unity Adapter

The Kidoz Applovin Max Adapter was built and tested with AppLovin Max unity plugin v5.10.1 <Br>

Check out the [Max Mediation Documentation](https://dash.applovin.com/documentation/mediation/unity/getting-started/integration) for app level integration.

## Integration Steps:

Download and import [KidozApplovinAdapter.unitypackage](/Mediation/AppLovin%20Max%20Adapter/Unity/KidozApplovinAdapter.unitypackage) into your project's Asset Folder.

## iOS integration

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
