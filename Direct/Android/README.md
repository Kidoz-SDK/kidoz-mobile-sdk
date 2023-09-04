# Kidoz Android Mobile SDK

## General Notes and Prerequisites

The Kidoz SDK contains support for the following ad types:

+ Kidoz Interstitial
+ Kidoz Rewarded Video
+ Kidoz Banner

Before publishing your first app please finish the onboarding process for Kidoz's publishers [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=).



## Getting Started

#### Include the following dependencies in your application gradle.build file
```groovy
dependencies {
    implementation 'org.greenrobot:eventbus:3.3.1'
    implementation 'net.kidoz.sdk:kidoz-android-native:8.9.9'
}
``` 

#### AndroidMainifest.xml Definitions 

Add the following permissions:

```xml
 <uses-permission android:name="android.permission.INTERNET" />
``` 

### Initialize the SDK
The SDK should be initialized only once in an Activity lifecycle. 
When initializing the SDK, please make sure to use your `publisherID` and `securityToken`. To receive these credentials please sign up [HERE](http://accounts.kidoz.net/publishers/register?utm_source=&utm_content=&utm_campaign=&utm_medium=) if you haven't done so already.

You may run the Sample App with Kidoz's <B>sample</B> `publisherID` and `securityToken` provided in the sample code but <B>be sure not to publish your app with them</B> . 

</br>
Initialize the SDK inside your Main Activity's onCreate.

> MainActivity.java

```java
@Override 
protected void onCreate(Bundle savedInstanceState)
{
    super.onCreate(savedInstanceState);
    KidozSDK.setSDKListener(new SDKEventListener()
        {
            @Override
            public void onInitSuccess()
            {
            //SDK Init | Success().
            }

            @Override
            public void onInitError(String error)
            {
            //SDK Init | Error
            }
        });
        
    KidozSDK.initialize(this, <publisherID>, <securityToken>);
    //the rest of your main activity onCreate
    ...
}
```
# Kidoz Banner

'KidozBannerView` is a view that shows banner ads.
 
### Calling KidozBannerView Programmatically

* Get a KidozBannerView instance from KidozSDK access point:
```java
KidozBannerView kidozBannerView = KidozSDK.getKidozBanner(<Activity>); 
```

* Set banner position:
```java
kidozBannerView.setBannerPosition(BANNER_POSITION.TOP / BOTTOM); 
```

* Set banner listener:
```java 
kidozBannerView.setKidozBannerListener(new KidozBannerListener()
        {
            @Override
            public void onBannerViewAdded()
            {
                //onBannerViewAdded
            }

            @Override
            public void onBannerReady()
            {
                //onBannerReady
            }

            @Override
            public void onBannerError(String errorMsg)
            {
                //onBannerError
            }

            @Override
            public void onBannerClose()
            {
                //onBannerClose
            }
            
            @Override  
            public void onBannerNoOffers()  
            {  
            //onBannerNoOffers
            }
        }); 
```

* Call banner load before showing:
```java
kidozBannerView.load(); 
```

* Call banner show (banner needs to be ready before showing):

```java
kidozBannerView.show(); 
```

* To hide banner:
```java
kidozBannerView.hide(); 
```

### Showing KidozBannerView in View Hierarchy
* Add KidozBannerView to your layout (in xml):
```xml
            <com.kidoz.sdk.api.ui_views.new_kidoz_banner.KidozBannerView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:id="@+id/<YOUR_ID_NAME>"/>
``` 

* Find KidozBannerView instance in your layout by id:
```java
final KidozBannerView kidozBannerView = (KidozBannerView) findViewById(<your banner id>); 
```



* Required (atm) - Set banner to not show on layout():
```java
kidozBannerView.setLayoutWithoutShowing(); 
```

* Call banner load before showing:
```java
kidozBannerView.load(); 
```

* Call banner show (banner needs to be ready before showing):

```java
kidozBannerView.show(); 
```

* To hide banner:
```java
kidozBannerView.hide(); 
```

# Kidoz Interstitial And Rewarded Video Views
`KidozInterstitial` is a full screen single ad unit.

#### Using Interstitial And Rewarded Video Ads
To show interstitial\rewarded video ads inside your `Activity` or `Fragment` create an instance of `KidozInterstitial` by adding the following lines:

```java
KidozInterstitial mInterstitial = new KidozInterstitial(this, <AD_TYPE>);
AD_TYPE = {KidozInterstitial.AD_TYPE.INTERSTITIAL, KidozInterstitial.AD_TYPE.REWARDED_VIDEO}
```



You can implement `KidozInterstitial.IOnInterstitialEventListener` interface if you want to be informed about `KidozInterstitial` events by adding the following lines:

```java
 mInterstitial.setOnInterstitialEventListener(new BaseInterstitial.IOnInterstitialEventListener()
    {
        @Override
        public void onClosed()
        {
       //Informs when interstitial ad view has been close   
        }

        @Override
        public void onOpened()
        {
            //Informs when interstitial ad view has been opened 
        }
        
        @Override
        public void onReady()
        {
            //Lounch Interstitial when ready if needed
            //mKidozInterstitial.show();
        }
        
        @Override
        public void onLoadFailed()
        {
            //Informs when interstitial ad view has failed to load  
        }
    });
```

Additional events that get invoked for the Rewarded Video Interstitial
```java
mKidozInterstitial.setOnInterstitialRewardedEventListener(new BaseInterstitial.IOnInterstitialRewardedEventListener()
{
    @Override
    public void onRewardReceived()
    {
        //Informs when interstitial rewarded event is invoked (Rewarded video is completed) 
    }

    @Override
    public void onRewardedStarted()
    {
        //Informs when interstitial rewarded video started event
    }
});
```

Call `loadAd()` to load Interstitial/Rewarded Ad instance  

Call `show()` as soon as it's ready.


#### Launching the Interstitial View
```java
 if (!mKidozInterstitial.isLoaded())
 {
    mKidozInterstitial.loadAd();
 } else
 {
    mKidozInterstitial.show();
 }
```

#### Launching the Rewarded Video View
```java
 if (!mKidozInterstitial.isLoaded())
 {
    mKidozInterstitial.loadAd();
 } else
 {
    mKidozInterstitial.show();
 }
```

 **Note: If you are using the Minify option in the build settings please add this to your proguard rules file:**  
```
-keepclasseswithmembers class com.kidoz.** {*;}  
-keep @interface org.greenrobot.eventbus.Subscribe  
-keepclassmembers class * {  
@org.greenrobot.eventbus.Subscribe <methods>;  
}
```

# Stay in touch 
For any question or assistance, please contact us at SDK@kidoz.net.
</br>

# License
--------

    Copyright 2015 Kidoz, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
