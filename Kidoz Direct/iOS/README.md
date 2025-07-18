# Kidoz iOS Mobile SDK

Kidoz SDK is compatible with iOS 11.0 and above and is written in Objective-C and Swift.<BR>
Minimum supported Xcode version is 14.1.

## Getting Started

Add the following line to your Podfile:
```
pod 'KidozSDK', '10.0.3'
```

## API Usage and Sample App

See the following API integration documents:

- [Swift](/Kidoz%20Direct/iOS/SampleApp/SampleAppSwift) 
- [Objective-C](/Kidoz%20Direct/iOS/SampleApp/SampleAppObjc)

Or look into our [SampleApp Workspace](/Kidoz%20Direct/iOS/SampleApp).

## SKAdNetwork Support

Please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```Swift
v79kvwwj4g.skadnetwork	
```

For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app). 
