# Kidoz iOS Mobile SDK

## Requirements
- iOS 14.0 or higher
- Xcode 26.2 or higher

Kidoz SDK is written in Objective-C and Swift.

## Getting Started

Add the following line to your Podfile:
```
pod 'KidozSDK', '{{VERSION}}'
```

## API Usage and Sample App

See the following API integration documents:

- [Swift](/Direct/iOS/SampleApp/SampleAppSwift) 
- [Objective-C](/Direct/iOS/SampleApp/SampleAppObjc)

Or look into our [SampleApp Workspace](/Direct/iOS/SampleApp).

## Verbose Logging
Verbose logging is off by default. Turn it on while integrating to see detailed SDK logs in the Xcode console, and turn it off before publishing your app.

```Swift
Kidoz.setVerboseLogging(true)
```
```objc
[Kidoz setVerboseLogging:YES];
```

## SKAdNetwork Support

Please make sure to include the Kidoz ad network ID in your app property list file (Info.plist):

```Swift
v79kvwwj4g.skadnetwork	
```

For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app). 
