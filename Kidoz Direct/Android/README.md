# Kidoz Android Mobile SDK

## General Notes and Prerequisites

The Kidoz SDK contains support for the following ad types:

+ Kidoz Interstitial
+ Kidoz Rewarded Video
+ Kidoz Banner

Before publishing your first app please finish the onboarding process for [Kidoz's publishers](http://accounts.kidoz.net/publishers/register?utm_source=kidoz_github).


## Getting Started

#### Include the following dependencies in your application gradle.build file
```groovy
dependencies {
    implementation 'org.greenrobot:eventbus:3.3.1'
    implementation 'net.kidoz.sdk:kidoz-android-native:9.0.0'
}
``` 

#### AndroidMainifest.xml Definitions 

Add the following permissions:

```xml
 <uses-permission android:name="android.permission.INTERNET" />
``` 

## SDK initialization
The SDK should be initialized only once in an Activity lifecycle. 

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

## Kidoz Interstitial
The Kidoz InterstitialAd is a full screen single ad unit.

#### Displaying Interstitial Ads

To use the Interstitial Ad you first need to load an Ad instance with an InterstitialAdCallback listener :

```java
InterstitialAd mInterstitialAd;

InterstitialAd.load(<Activity>, new InterstitialAdCallback() {
    @Override
    public void onAdLoaded(InterstitialAd ad) {
        mInterstitialAd = ad;
        // onInterstitialLoaded();
    }

    @Override
    public void onAdFailedToLoad(KidozError error) {
        // onInterstitialLoadFailed(...);
    }

    @Override
    public void onAdShown(InterstitialAd ad) {
        // onInterstitialShown();
    }

    @Override
    public void onAdFailedToShow(KidozError error) {
       //  onInterstitialShowFailed(...);
    }

    @Override
    public void onAdImpression() {
        // onInterstitialImpression();
    }

    @Override
    public void onAdClosed(InterstitialAd ad) {
        // onInterstitialClosed();
    }
});
```



In order to show the ad once it is loaded call:

```java
mInterstitialAd.show();
```

## Kidoz Rewarded
Kidoz RewardedAd is a full screen single ad unit.

#### Displaying Rewarded Ads

To use the Rewarded Ad you first need to load an Ad instance with an RewardedAdCallback listener :

```java
RewardedAd mRewardedAd;

RewardedAd.load(MainActivity.this, new RewardedAdCallback() {
    @Override
    public void onAdLoaded(RewardedAd ad) {
        mRewardedAd = ad;
        // onRewardedLoaded();
    }

    @Override
    public void onAdFailedToLoad(KidozError error) {
        // onRewardedLoadFailed(...);
    }

    @Override
    public void onAdShown(RewardedAd ad) {
        // onRewardedShown();
    }

    @Override
    public void onAdFailedToShow(KidozError error) {
        // onRewardedShowFailed(...);
    }

    @Override
    public void onAdImpression() {
        // onRewardedImpression();
    }

    @Override
    public void onAdClosed(RewardedAd ad) {
        // onRewardedClosed();
    }

    @Override
    public void onRewardReceived() {
        // onRewardAchieved();
    }

});
```



In order to show the ad once it is loaded call:

```java
mRewardedAd.show();
```

## Kidoz Banner

KidozBannerView is a view that shows banner ads.
 
### Calling KidozBannerView Programmatically

* Create a KidozBannerView instance:
```java
KidozBannerView kidozBannerView = new KidozBannerView(<Activity>); 
```

* Set banner position:
```java
kidozBannerView.setBannerPosition(BANNER_POSITION.TOP_CENTER / BOTTOM_CENTER); 
```

* Set banner listener:
```java 
kidozBannerView.setKidozBannerListener(new BannerAdCallback() {

            @Override
            public void onAdLoaded() {
                // onBannerLoaded();
            }

            @Override
            public void onAdFailedToLoad(KidozError error) {
                // onBannerLoadFailed(...);
            }

            @Override
            public void onAdShown() {
               // onBannerShown();
            }

            @Override
            public void onAdFailedToShow(KidozError error) {
               // onBannerShowFailed(...);
            }

            @Override
            public void onAdImpression() {
                // onBannerImpression();
            }

            @Override
            public void onAdClosed() {
                // onBannerClosed();
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
            <com.kidoz.sdk.api.ads.banner.KidozBannerView
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
