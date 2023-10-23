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

## App-ads.txt
Please set up [app-ads.txt](https://kidoz.net/app-ads.txt) for all the apps that use Kidoz sdk. This will increase your fill rate and earnings and will prevent ad serving being blocked.
Follow these instructions on how to [Set up an app-ads.txt file for your app](https://kidoz.net/introappadstext).


## Admob CPM Setup
You will need to define your Ad Unit CPM as displayed in your Kidoz dashboard. Contact a Kidoz publisher representative for more information at sdk@kidoz.net.

## Important note:
While mapping the Kidoz Ad unit on Admob, it is highly recommended to run some JSON validator on the parameters passed to the Class name (AppID and Token). This method may minimize parsing mistakes that may arise on initial connection.
