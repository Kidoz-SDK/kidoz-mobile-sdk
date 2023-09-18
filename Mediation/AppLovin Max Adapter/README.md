# AppLovin Max Adapters

The Adapter currently offers support for the following ad types:

+ AppLovin Interstitial Mediation 
+ AppLovin Rewarded Video Mediation 
+ AppLovin Banner Mediation 

on the following platforms:

+ [Unity](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/KidozApplovinAdapter/Unity)
+ [Native Android](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/KidozApplovinAdapter/Android)
+ [Native iOS](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/KidozApplovinAdapter/iOS)

# Prerequisites

Follow the instructions in the [AppLovin Custom SDK Network Integration Guide](https://dash.applovin.com/documentation/mediation/android/mediation-setup/custom-sdk)

In the Manage Network form you should enter the following data:
```
Custom Network Name: Kidoz 
iOS Adapter Class Name: KidozMediationAdapter
Android / Fire OS Adapter Class Name: com.applovin.mediation.adapters.KidozMediationAdapter
```
<img width="800" alt="AppLovinCustomNetwork" src="https://user-images.githubusercontent.com/86282008/197710543-171fe5fc-9c5e-414b-96ab-07f3b28de708.png">
  
  
Once the Kidoz Network is properly configured you will now be able to enable and configure the Kidoz Ad Data in your App's Ad Unit waterfall.<BR>
You will need to define yout Ad Unit CPM as dispayed in your Kidoz dashboard. Contact Kidoz publisher representative for more information. <BR>
Replace KIDOZ_PUBLISHER_ID and KIDOZ_SECURITY_TOKEN with the publisher id and token you recived from Kidoz when you've created your publisher account.
```java
  {"publisher_id":"KIDOZ_PUBLISHER_ID","token":"KIDOZ_SECURITY_TOKEN"}
```
Place the json string in the Custom Parameters field and save.
  
  <img width="800" alt="AppLovin AdUnit Config" src="https://user-images.githubusercontent.com/86282008/197715891-2a6501d4-741e-4322-9343-fcbfe49db1a2.png">
