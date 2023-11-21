# ironSource LevelPlay Adapter

Our Adapters offer support for the following ad types:

+ Interstitial Mediation 
+ Rewarded Video Mediation 
+ Banner Mediation 

On the following platforms:

+ [Native Android](/Mediation/IronSource%20LevelPlay%20Adapter/Android)
+ [Native iOS](/Mediation/IronSource%20LevelPlay%20Adapter/iOS)
+ [Unity](/Mediation/IronSource%20LevelPlay%20Adapter/Unity)

## Prerequisites
  
Before publishing your first app please complete the process for [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github)  
and follow the instructions for [ironSource Custom Adapter setup](https://developers.is.com/ironsource-mobile/general/custom-adapter-setup/).<BR><BR>
Kidoz Network ID on ironSource is `2b618dcd` and you will need to setup the network level parameters with the `Publisher Id` and `Token` you got from Kidoz:  
  
  <img width="598" alt="ironSourceNetwork" src="https://user-images.githubusercontent.com/86282008/149078934-107106f0-a526-45bc-9c93-8ca53d5bf3cc.png">

## Ad Network Instance configuration
  On Unity Level Play --> SDK Network --> Kidoz App Settings page set <B>Zone</B> field to 1 for every ad type you use:<BR>

  <img width="598" alt="Kidoz Wideget Type Settings" src="https://github.com/Kidoz-SDK/kidoz-mobile-sdk/assets/86282008/a6d8b409-587e-425c-b45a-37e4446bfa46">

## App-ads.txt
Please set up [app-ads.txt](https://kidoz.net/app-ads.txt) for all the apps that use Kidoz sdk. This will increase your fill rate and earnings and will prevent ad serving being blocked.
Follow these instructions on how to [Set up an app-ads.txt file for your app](https://kidoz.net/introappadstext).


## CPM Setup
You will need to define your Ad Unit CPM as displayed in your Kidoz dashboard. Contact a Kidoz publisher representative for more information at sdk@kidoz.net.

