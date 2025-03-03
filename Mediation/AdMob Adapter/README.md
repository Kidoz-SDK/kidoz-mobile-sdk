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


## Custom Event and CPM Setup

In order to setup custom events for all relevant ad units go to the ad unit's<BR>
Mediation Group -> Waterfall -> Add Custom Event<BR>
Set the Label and eCPM fields and continue

<img width="800" src="https://raw.githubusercontent.com/Kidoz-SDK/kidoz-mobile-sdk/refs/heads/docs/Mediation/AdMob%20Adapter/CustomEvent1.png"> 

Click the Select a mapping drop down

<img width="800" src="https://raw.githubusercontent.com/Kidoz-SDK/kidoz-mobile-sdk/refs/heads/docs/Mediation/AdMob%20Adapter/CustomEvent2.png"> 

On the Add mapping step set the Class Name and Parameter fields:<BR>

- For iOS set the following full path in the `Class Name` field: </br>
`KidozAdMobAdapter`

- For Android set the following full path in the `Class Name` field: </br>
`com.kidoz.mediation.admob.adapters.KidozAdMobAdapter`

- Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}`

- Replace `publisherId` and `publisherToken` with the credentials received during [Kidoz's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=prado_github).

<img width="800" src="https://raw.githubusercontent.com/Kidoz-SDK/kidoz-mobile-sdk/refs/heads/docs/Mediation/AdMob%20Adapter/CustomEvent3.png"> 

You will need to define your Admob Ad Units CPM and align them with Kidoz eCPM displayed in your Kidoz dashboard. Contact a Prado publisher representative for more information at sdk@kidoz.net

## Important note:
While mapping the Kidoz Ad unit on Admob, it is highly recommended to run some JSON validator on the parameters passed to the Class name (AppID and Token). This method may minimize parsing mistakes that may arise on initial connection.
