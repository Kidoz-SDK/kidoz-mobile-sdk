# Unity ironSource Adapter

The Kidoz Unity ironSource Adapter SDK is built and tested with ironSource unity plugin v7.5.0<BR>

Check out the [ironSource Integration Documentation](https://developers.is.com/ironsource-mobile/unity/unity-plugin/) for app level integration.

## Integration Steps:

Download and import [KidozIronsourceAdapter.unitypackage](Mediation/IronSource%20LevelPlay%20Adapter/Unity/KidozIronsourceAdapter.unitypackage) into your Project's Asset Folder.
	
## iOS integration

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).

## Android integration
If you are using the Minify option in the Player settings please add this to your proguard-rules file:
```
-keep @interface org.greenrobot.eventbus.Subscribe  
-keepclassmembers class * {  
  @org.greenrobot.eventbus.Subscribe <methods>;  
}
```
