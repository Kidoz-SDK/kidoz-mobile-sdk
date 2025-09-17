# Kidoz Android Mobile SDK

## Getting Started

#### Include the following inside your app build.gradle dependencies:
```groovy
dependencies {
    implementation("net.kidoz.sdk:kidoz-android-native:10.1.1")
}
```

## SDK Initialization

The SDK should be initialized only once in an Activity lifecycle.

You may run the Sample App with Kidoz's **sample** `publisherID` and `securityToken` provided in the sample code but **be sure not to publish your app with them**.

Initialize the SDK inside your MainActivity's `onCreate`:

> MainActivity.kt

```kotlin
override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    ...
    Kidoz.initialize(this, PUBLISHER_ID, TOKEN, object : KidozInitializationListener {

        override fun onInitSuccess() {
            // SDK Init Success
        }

        override fun onInitError(error: KidozError) {
            // SDK Init Error
        }
    })
    ...
}
```

---

## Kidoz Interstitial

The `KidozInterstitialAd` is a full screen single ad unit.

#### Displaying Interstitial Ads

To use the Interstitial Ad you first need to load an Ad instance with a `KidozInterstitialAdCallback` listener:

```kotlin
var interstitialAd: KidozInterstitialAd? = null

KidozInterstitialAd.load(this, object : KidozInterstitialAdCallback {
    override fun onAdLoaded(ad: KidozInterstitialAd) {
        interstitialAd = ad
    }

    override fun onAdFailedToLoad(error: KidozError) { }

    override fun onAdShown(ad: KidozInterstitialAd) { }

    override fun onAdFailedToShow(ad: KidozInterstitialAd, error: KidozError) {
        interstitialAd = null
    }

    override fun onAdImpression(ad: KidozInterstitialAd) { }

    override fun onAdClosed(ad: KidozInterstitialAd) {
        interstitialAd = null
    }
})  
```

Show the ad once it is loaded:

```kotlin
interstitialAd?.show()
```

---

## Kidoz Rewarded

`KidozRewardedAd` is a full screen single ad unit.

#### Displaying Rewarded Ads

```kotlin
var rewardedAd: KidozRewardedAd? = null

KidozRewardedAd.load(this, object : KidozRewardedAdCallback {
    override fun onAdLoaded(ad: KidozRewardedAd) {
        rewardedAd = ad
    }

    override fun onAdFailedToLoad(error: KidozError) { }

    override fun onAdShown(ad: KidozRewardedAd) { }

    override fun onAdFailedToShow(ad: KidozRewardedAd, error: KidozError) {
        rewardedAd = null
    }

    override fun onAdImpression(ad: KidozRewardedAd) { }

    override fun onRewardReceived(ad: KidozRewardedAd) { }

    override fun onAdClosed(ad: KidozRewardedAd) {
        rewardedAd = null
    }
})
```

Show the ad once it is loaded:

```kotlin
rewardedAd?.show()
```

---

## Kidoz Banner

`KidozBannerView` is a view that shows banner ads.

### Calling KidozBannerView Programmatically

Create a `KidozBannerView` instance:

```kotlin
val kidozBannerView = KidozBannerView(this) 
```

Set banner position:

```kotlin
kidozBannerView.setBannerPosition(KidozBannerView.Position.BOTTOM_CENTER)
```

Disable banner auto show on load:

```kotlin
kidozBannerView.setAutoShow(false)
```

Set banner listener:

```kotlin
kidozBannerView.setBannerCallback(object : KidozBannerAdCallback {
    override fun onAdLoaded() { }

    override fun onAdFailedToLoad(error: KidozError) { }

    override fun onAdShown() { }

    override fun onAdFailedToShow(error: KidozError) { }

    override fun onAdImpression() { }

    override fun onAdClosed() { }
})
```

Load before showing:

```kotlin
kidozBannerView.load() 
```

Show if `setAutoShow(false)` was set:

```kotlin
kidozBannerView.show() 
```

Hide banner:

```kotlin
kidozBannerView.close() 
```

### Showing KidozBannerView in View Hierarchy

Add `KidozBannerView` to your layout (in xml):

```xml
<net.kidoz.ads.banner.KidozBannerView
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:id="@+id/<YOUR_ID_NAME>"/>
```

Find `KidozBannerView` instance in your layout by id:

```kotlin
val kidozBannerView = findViewById<KidozBannerView>(R.id.<YOUR_ID_NAME>) 
```

Required — Set banner to not show on layout:

```kotlin
kidozBannerView.setLayoutWithoutShowing() 
```

Load before showing:

```kotlin
kidozBannerView.load() 
```

Show banner (needs to be ready):

```kotlin
kidozBannerView.show() 
```

Hide banner:

```kotlin
kidozBannerView.close() 
```

---

## Kidoz Android ORTB (Server-to-Server Bidding)

Kidoz Android SDK supports Server-to-Server (S2S) bidding integrations for Interstitial, Rewarded, and Banner ad types.

The flow inside your app is:

1. **Initialize the SDK** (as above).

2. **Get a Bid Signal from the SDK**

```kotlin
// Interstitial
val interstitialSignal: String? = KidozInterstitialAd.getSignal()

// Rewarded
val rewardedSignal: String? = KidozRewardedAd.getSignal()

// Banner
val bannerSignal: String? = KidozBannerView.getSignal()
```

3. **Request Bids From Your Server** *(out of scope for the SDK)*.

4. **Load a Winning Bid Into the SDK**

```kotlin
// Create bid from winning response
val kidozBid = KidozBid("winningBidResponseString")

// Interstitial
KidozInterstitialAd.load(this, kidozBid, object : KidozInterstitialAdCallback {
    override fun onAdLoaded(ad: KidozInterstitialAd) {
        interstitialAd = ad
    }
    override fun onAdFailedToLoad(error: KidozError) { interstitialAd = null }
    override fun onAdShown(ad: KidozInterstitialAd) {}
    override fun onAdFailedToShow(ad: KidozInterstitialAd, error: KidozError) {}
    override fun onAdImpression(ad: KidozInterstitialAd) {}
    override fun onAdClosed(ad: KidozInterstitialAd) { interstitialAd = null }
})

// Rewarded (replace Interstitial with Rewarded)
KidozRewardedAd.load(this, kidozBid, object : KidozRewardedAdCallback {
    override fun onAdLoaded(ad: KidozRewardedAd) {
        rewardedAd = ad
    }
    /* …other callbacks… */
})

// Banner (replace Interstitial with Banner)
kidozBannerView.load(this, kidozBid, object : KidozBannerAdCallback {
    override fun onAdLoaded() { /* … */ }
    /* …other callbacks… */
})
```

You continue to implement the same callback interfaces (`KidozInterstitialAdCallback`, `KidozRewardedAdCallback`, `KidozBannerAdCallback`) to receive load/show/close events as with the standard loading methods.
