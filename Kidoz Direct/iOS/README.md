# Kidoz iOS Mobile SDK

**Kidoz SDK and the Sample App are compatible with iOS 10.0 and above.**

**Kidoz SDK is written in Objective-C and Swift.**

***This SDK version was verified not to contain the Advertiser Identifier (IDFA) as required by Apple App Store regulation for apps of Kids category.***

## Prerequisites
Before publishing your first app please finish the onboarding process for [Kidoz's publishers](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).

#### SKAdNetwork Support
In order to support CPI attribution on iOS, please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```Swift
v79kvwwj4g.skadnetwork	
```

For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app). 

## Running the SampleApp
SampleApp is an iOS application project that provides an example of the KIDOZ SDK integration and usage.

In order to see Kidoz SDK in action go to the [SampleApp](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/Direct/iOS/SampleApp) folder and open `SampleApp.xcworkspace`. Inside the project you will find examples of how to use the Kidoz SDK in [Swift](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/Direct/iOS/SampleApp/SampleAppSwift) and [Objective-C](https://github.com/Kidoz-SDK/kidoz-mobile-sdk/tree/main/Direct/iOS/SampleApp/SampleAppObjc).
