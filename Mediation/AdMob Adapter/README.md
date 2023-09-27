# Kidoz Admob Adapters

Our Adapters offer support for the following ad types:

+ Interstitial Mediation 
+ Rewarded Video Mediation 
+ Banner Mediation 

On the following platforms:

+ [Native Android](/Mediation/AdMob%20Adapter/Android)
+ [Native iOS](/Mediation/AdMob%20Adapter/iOS)
+ [Unity](/Mediation/AdMob%20Adapter/Unity)

# Prerequisites
Before publishing your first app please finish the onboarding process for Kidoz's publishers [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=)  
and follow the instructions for Custom Events setup [HERE](https://developers.google.com/admob/android/custom-events/setup).

# Kidoz - Admob Settings Recommendations ##

_Programmatic_ **|** _app-ads.txt_

1. We recommend setting up app-ads.txt for the apps that use Kidoz sdk in your Admob dashboard. This may prevent blocking of programmatic ads.
Once you add an app and generate the relevant entry for it, you can paste it into your app-ads.txt file. Copy the entry while pressing on "HOW TO SET UP APP-ADS.TXT" link (as described in the screenshot below):

<p align="left">
  <img src="https://cdn.kidoz.net/new/sdk/GITHUB_GRAPHICS/Kidoz_SDK_Documentaions/admob_app_ads_txt2.png" />
</p>

2. Additionally, it is highly recommended to add the Kidoz app-ads.txt in order to increase the fill-rate of your application, as [described here](https://kidoz.net/introappadstext)

3. Set up $9 CPM for Kidoz, to make sure the requests are being passed to Kidoz.

<p align="left">
  <img src="https://cdn.kidoz.net/new/sdk/GITHUB_GRAPHICS/Kidoz_SDK_Documentaions/admob_adsources_waterfall.png" />
</p>

## Important note: ##
While mapping the Kidoz Ad unit on Admob, it is highly recommended to run some JSON validator on the parameters passed to the Class name (AppID and Token). This method may minimize parsing mistakes that may rise on initial connection.
