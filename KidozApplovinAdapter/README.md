# Kidoz AppLovin Adapters

The Adapter currently offers support for the following ad types:

+ AppLovin Interstitial Mediation 
+ AppLovin Rewarded Video Mediation 

on the following platforms:

+ [Unity](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/KidozApplovinAdapter/Unity)
+ [Native Android](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/KidozApplovinAdapter/Android)
+ [Native iOS](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/KidozApplovinAdapter/iOS)

# Prerequisites

Before integrating your first app please finish the onboarding process for Kidoz's publishers [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=)  
and follow the instructions in the AppLovin Custom SDK Network Integration Guide [HERE](https://dash.applovin.com/documentation/mediation/android/mediation-setup/custom-sdk)

In the Manage Network form you should enter the following data:

Custom Network Name: Kidoz <BR>
iOS Adapter Class Name: KidozMediationAdapter<BR>
Android / Fire OS Adapter Class Name: com.applovin.mediation.adapters.KidozMediationAdapter<BR>
<BR>
<img width="800" alt="AppLovinCustomNetwork" src="https://user-images.githubusercontent.com/86282008/197710543-171fe5fc-9c5e-414b-96ab-07f3b28de708.png">
  
  
Once the Kidoz Network is properly configured you will now be able to enable and configure the Kidoz Ad Data in your App's Ad Unit waterfall.<BR>
Replace KIDOZ_PUBLISHER_ID and KIDOZ_SECURITY_TOKEN with the publisher id and token you recived from Kidoz when you've created your publisher account.
```java
  {"publisher_id":"KIDOZ_PUBLISHER_ID","token":"KIDOZ_SECURITY_TOKEN"}
```
Place the json string in the Custom Parameters field and save.
  
  
  <img width="800" alt="AppLovin AdUnit Config" src="https://user-images.githubusercontent.com/86282008/197715891-2a6501d4-741e-4322-9343-fcbfe49db1a2.png">


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
