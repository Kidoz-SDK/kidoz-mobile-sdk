# Kidoz ironSource iOS Adapter

The Kidoz ironSource Adapter SDK is built and tested with ironSource mediation v7.5.0.0<BR> 
Check out the [ironSource Integration Documentation](https://developers.is.com/ironsource-mobile/ios/ios-sdk/) for app level integration.

### Integration Steps:

To add Kidoz ironSource Adapter to your project with CocoaPods:
```
pod 'IronSourceSDK','7.3.1.0'
pod 'KidozSDK', '9.0.0'
pod 'KidozIronSourceAdapter', '1.1.2'
```

### iOS SKAdNetwork Support

In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).

# Stay in touch 
For any question or assistance, please contact us at SDK@kidoz.net.
</br>

# License
--------

    Copyright 2015 KIDOZ, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
