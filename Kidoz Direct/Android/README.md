# Kidoz Android Mobile SDK

## Getting Started:

#### Include the following inside your app build.gradle dependencies:
```groovy
dependencies {
    implementation("net.kidoz.sdk:kidoz-android-native:10.0.1")
    implementation("com.kpadplayer.sdk:kpadplayer-android-native:10.0.1")    
}
``` 

## SDK initialization
The SDK should be initialized only once in an Activity lifecycle. 

You may run the Sample App with Kidoz's <B>sample</B> `publisherID` and `securityToken` provided in the sample code but <B>be sure not to publish your app with them</B>. 

</br>
Initialize the SDK inside your MainActivity's onCreate.

> MainActivity.java

```java
@Override 
protected void onCreate(Bundle savedInstanceState)
{
    ....
    Kidoz.initialize(this, PUBLISHER_ID, TOKEN, object : KidozInitializationListener {

        override fun onInitSuccess() {
            //SDK Init | Success().
        }

        override fun onInitError(error: KidozError) {
            //SDK Init | Error
        }

    })
    ...
}
```

## Kidoz Interstitial
The KidozInterstitialAd is a full screen single ad unit.

#### Displaying Interstitial Ads

To use the Interstitial Ad you first need to load an Ad instance with an KidozInterstitialAdCallback listener :

```java
val mInterstitialAd : KidozInterstitialAd? = null

KidozInterstitialAd.load(this, object : KidozInterstitialAdCallback {
    override fun onAdLoaded(ad: KidozInterstitialAd) {
        kidozInterstitialAd = ad
    }

    override fun onAdFailedToLoad(error: KidozError) {

    }

    override fun onAdShown(ad: KidozInterstitialAd) {

    }

    override fun onAdFailedToShow(ad: KidozInterstitialAd, error: KidozError) {
        pradoInterstitialAd = null
    }

    override fun onAdImpression(ad: KidozInterstitialAd) {

    }

    override fun onAdClosed(ad: KidozInterstitialAd) {
        kidozInterstitialAd = null
    }

})  
```



In order to show the ad once it is loaded call:

```java
mInterstitialAd.show();
```

## Kidoz Rewarded
KidozRewardedAd is a full screen single ad unit.

#### Displaying Rewarded Ads

To use the Rewarded Ad you first need to load an Ad instance with a KidozRewardedAdCallback listener :

```java
var kidozRewardedAd: KidozRewardedAd? = null

KidozRewardedAd.load(this, object : KidozRewardedAdCallback {
    override fun onAdLoaded(ad: KidozRewardedAd) {
        kidozRewardedAd = ad
    }

    override fun onAdFailedToLoad(error: KidozError) {

    }

    override fun onAdShown(ad: KidozRewardedAd) {

    }

    override fun onAdFailedToShow(ad: KidozRewardedAd, error: KidozError) {
        kidozRewardedAd = null
    }

    override fun onAdImpression(ad: KidozRewardedAd) {

    }

    override fun onRewardReceived(ad: KidozRewardedAd) {

    }

    override fun onAdClosed(ad: KidozRewardedAd) {
        pradoRewardedAd = null
    }

})
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
val kidozBannerView = KidozBannerView(<Activity>); 
```

* Set banner position:
```java
kidozBannerView.setBannerPosition(KidozBannerView.Position.BOTTOM_CENTER)
```

* Disable banner auto show on load:
```java
kidozBannerView.setAutoShow(false)
```

* Set banner listener:
```java 
kidozBannerView.setBannerCallback(object : KidozBannerAdCallback {
    override fun onAdLoaded() {
       
    }

    override fun onAdFailedToLoad(error: KidozError) {
      
      
    }

    override fun onAdShown() {
        
    }

    override fun onAdFailedToShow(error: KidozError) {
        
    }

    override fun onAdImpression() {
        
    }

    override fun onAdClosed() {
        
    }
})
```

* Call banner load before showing:
```java
kidozBannerView.load(); 
```

* Call banner show if setAutoShow was set to false (banner needs to be loaded before showing):

```java
kidozBannerView.show(); 
```

* To hide banner:
```java
kidozBannerView.close(); 
```

### Showing KidozBannerView in View Hierarchy
* Add KidozBannerView to your layout (in xml):
```xml
            <net.kidoz.ads.banners.KidozBannerView
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
