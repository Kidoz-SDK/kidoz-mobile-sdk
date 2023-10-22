# Kidoz Admob Adapters

Our Adapters offer support for the following ad types:

+ Interstitial Mediation 
+ Rewarded Video Mediation 
+ Banner Mediation 

On the following platforms:

+ [Native Android](/Mediation/AdMob%20Adapter/Android)
+ [Native iOS](/Mediation/AdMob%20Adapter/iOS)
+ [Unity](/Mediation/AdMob%20Adapter/Unity)

## Prerequisites
Before publishing your first app please complete the process for [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github) to create your account and receive your Publisher ID and Security Token credentials.

## Kidoz - Admob Settings Recommendations

_Programmatic_ **|** _app-ads.txt_

1. We recommend setting up app-ads.txt for the apps that use Kidoz sdk in your Admob dashboard. This may prevent blocking of programmatic ads.
Follow these instructions on how to [Set up an app-ads.txt file for your app](https://support.google.com/admob/answer/9363762?hl=en).

2. Additionally, it is highly recommended to add the Kidoz app-ads.txt in order to increase the fill-rate of your application, as [described here](https://kidoz.net/introappadstext).


## Important note:
While mapping the Kidoz Ad unit on Admob, it is highly recommended to run some JSON validator on the parameters passed to the Class name (AppID and Token). This method may minimize parsing mistakes that may arise on initial connection.
