# Kidoz Admob Adapters

The Admob currently offers support for the following platforms:

+ [Unity](/Admob%20Adapter/Unity)
+ [Native Android](/Admob%20Adapter/Android)
+ [Native iOS](/Admob%20Adapter/iOS)

# Prerequisites
To use the Kidoz SDK adapter for AdMob you should make sure you have:
1. Google Mobile Ads SDK 10.8.0 or higher integrated in your project as [explained here](https://developers.google.com/admob/ios/quick-start).
2. A fully functional AdMob ad placement.
3. A Kidoz Publisher account. See the onboarding process for [Kidoz's publishers](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).

***This SDK version was verified not to contain the Advertiser Identifier (IDFA) as required by Apple App Store regulation for apps of Kids category.***

# SKAdNetwork Support
In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```
v79kvwwj4g.skadnetwork	
```

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
