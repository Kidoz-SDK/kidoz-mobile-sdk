package net.kidoz.android.sampleapp;

import android.app.Activity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import net.kidoz.ads.banner.KidozBannerAdCallback;
import net.kidoz.ads.banner.KidozBannerView;
import net.kidoz.ads.fullscreen.interstial.KidozInterstitialAd;
import net.kidoz.ads.fullscreen.interstial.KidozInterstitialAdCallback;
import net.kidoz.ads.fullscreen.rewarded.KidozRewardedAd;
import net.kidoz.ads.fullscreen.rewarded.KidozRewardedAdCallback;
import net.kidoz.sdk.Kidoz;
import net.kidoz.sdk.KidozError;
import net.kidoz.sdk.KidozInitializationListener;

public class MainActivity extends Activity {

    private static final String PUBLISHER_ID = "14428";
    private static final String TOKEN = "6yAsKUngaG5yC4X5HsRoatKTso40NMoZ";

    private KidozInterstitialAd mInterstitialAd;
    private KidozRewardedAd mRewardedAd;
    private KidozBannerView mKidozBannerView;

    protected Button loadBannerButton;
    protected Button closeBannerButton;
    // The load interstitial button.
    protected Button loadInterstitialButton;
    // The show interstitial button.
    protected Button showInterstitialButton;
    // The load rewarded ad button.
    protected Button loadRewardedButton;
    // The load rewarded ad button.
    protected Button showRewardedButton;

    private ScrollView feedbackContainer;
    private TextView feedbackTV;

    protected ViewGroup bannerContainer;


    private static final String LOADED = " Loaded";
    private static final String FAILED_TO_LOAD = " Failed to Load::";
    private static final String SHOWN = " Shown";
    private static final String IMPRESSION = " Impression";
    private static final String FAILED_TO_SHOW = " Failed to Show::";
    private static final String BUTTON_INTERACTION_PATTERN = "----- %s ---";
    private static final String CLOSED = " Closed";

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setTitle(getString(R.string.app_name) + " v" + Kidoz.getSDKVersion());
        setContentView(R.layout.activity_main);

        feedbackContainer = findViewById(R.id.feedbackContainer);
        feedbackTV = findViewById(R.id.feedbackTextView);

        log("App version SDK v" + Kidoz.getSDKVersion());

        bannerContainer = findViewById(R.id.bannerContainer);
        // Banner Ad
        loadBannerButton = findViewById(R.id.banner_load);
        loadBannerButton.setOnClickListener(view -> {
            log(String.format(BUTTON_INTERACTION_PATTERN,"Load Banner"));
            loadBannerButton.setEnabled(false);
            closeBannerButton.setEnabled(true);
            loadBanner();
        });

        closeBannerButton = findViewById(R.id.banner_close);
        closeBannerButton.setOnClickListener(view -> {
            hideBanner();
            loadBannerButton.setEnabled(true);
            closeBannerButton.setEnabled(false);
            log(String.format(BUTTON_INTERACTION_PATTERN,"Close Banner"));
        });

        // Interstitial Ad
        loadInterstitialButton = (Button) findViewById(R.id.interstitial_load);
        loadInterstitialButton.setOnClickListener(view -> {
            log(String.format(BUTTON_INTERACTION_PATTERN,"Load Interstitial"));
            loadInterstitialButton.setEnabled(false);
            loadInterstitial();
        });
        showInterstitialButton = (Button) findViewById(R.id.interstitial_show);
        showInterstitialButton.setOnClickListener(view -> {
            log(String.format(BUTTON_INTERACTION_PATTERN,"Show Interstitial"));
            loadInterstitialButton.setEnabled(true);
            showInterstitialButton.setEnabled(false);
            showInterstitial();
        });

        // Rewarded Ad
        loadRewardedButton = (Button) findViewById(R.id.rewarded_load);
        loadRewardedButton.setOnClickListener(view -> {
            log(String.format(BUTTON_INTERACTION_PATTERN,"Load Rewarded"));
            loadRewardedButton.setEnabled(false);
            loadRewarded();
        });
        showRewardedButton = (Button) findViewById(R.id.rewarded_show);
        showRewardedButton.setOnClickListener(view -> {
            log(String.format(BUTTON_INTERACTION_PATTERN,"Show Rewarded"));
            loadRewardedButton.setEnabled(true);
            showRewardedButton.setEnabled(false);
            showRewarded();
        });

        initSDK();
    }

    // SDK init
    protected void initSDK(){
        Kidoz.initialize(MainActivity.this, PUBLISHER_ID, TOKEN, new KidozInitializationListener() {
            @Override
            public void onInitSuccess() {
                onSDKInitSuccess();
                createBanner();
            }

            @Override
            public void onInitError(KidozError error) {
                onSDKInitFailure(error.getMessage());
            }
        });
    }

    protected void onSDKInitSuccess(){
        runOnUiThread(() ->{
            log("SDK Init Success");
            loadBannerButton.setEnabled(true);
            loadInterstitialButton.setEnabled(true);
            loadRewardedButton.setEnabled(true);
        });

    }

    protected void onSDKInitFailure(String error){
        runOnUiThread(()->{
            log("SDK Init Error: " + error);
        });
    }

    // Kidoz Interstitial

    protected void loadInterstitial(){
        KidozInterstitialAd.load(MainActivity.this, new KidozInterstitialAdCallback() {
            @Override
            public void onAdLoaded(KidozInterstitialAd ad) {
                mInterstitialAd = ad;
                onInterstitialLoaded();
            }

            @Override
            public void onAdFailedToLoad(KidozError error) {
                onInterstitialLoadFailed(error.toString());
            }

            @Override
            public void onAdShown(KidozInterstitialAd ad) {
                onInterstitialShown();
            }

            @Override
            public void onAdFailedToShow(KidozInterstitialAd ad,KidozError error) {
                onInterstitialShowFailed(error.toString());
            }

            @Override
            public void onAdImpression(KidozInterstitialAd ad) {
                onInterstitialImpression();
            }

            @Override
            public void onAdClosed(KidozInterstitialAd ad) {
                onInterstitialClosed();
            }
        });
    }
    protected void showInterstitial(){
        mInterstitialAd.show();
    }
    protected void onInterstitialLoaded(){
        runOnUiThread(() -> {
            log("Interstitial" + LOADED);
            showInterstitialButton.setEnabled(true);
        });
    }

    protected void onInterstitialLoadFailed(String error){
        runOnUiThread(() -> {
            log("Interstitial" + FAILED_TO_LOAD + error);
            loadInterstitialButton.setEnabled(true);
            showInterstitialButton.setEnabled(false);
        });
    }

    protected void onInterstitialShowFailed(String error){
        runOnUiThread(() -> {
            log("Interstitial" + FAILED_TO_SHOW + error);
            loadInterstitialButton.setEnabled(true);
            showInterstitialButton.setEnabled(false);
        });
    }

    protected void onInterstitialShown(){
        runOnUiThread(() -> log("Interstitial" + SHOWN));
    }

    protected void onInterstitialImpression(){
        runOnUiThread(() -> log("Interstitial" + IMPRESSION));
    }

    protected void onInterstitialClosed(){
        runOnUiThread(() -> {
            log("Interstitial" + CLOSED);
            loadInterstitialButton.setEnabled(true);
            showInterstitialButton.setEnabled(false);
        });
    }

    // Kidoz Rewarded

    protected void loadRewarded(){
        KidozRewardedAd.load(MainActivity.this, new KidozRewardedAdCallback() {
            @Override
            public void onAdLoaded(KidozRewardedAd ad) {
                mRewardedAd = ad;
                onRewardedLoaded();
            }

            @Override
            public void onAdFailedToLoad(KidozError error) {
                onRewardedLoadFailed(error.toString());
            }

            @Override
            public void onAdShown(KidozRewardedAd ad) {
                onRewardedShown();
            }

            @Override
            public void onAdFailedToShow(KidozRewardedAd ad,KidozError error) {
                onRewardedShowFailed(error.toString());
            }

            @Override
            public void onAdImpression(KidozRewardedAd ad) {
                onRewardedImpression();
            }

            @Override
            public void onAdClosed(KidozRewardedAd ad) {
                onRewardedClosed();
            }

            @Override
            public void onRewardReceived(KidozRewardedAd ad) {
                onRewardAchieved();
            }

        });
    }
    protected void showRewarded(){
        mRewardedAd.show();
    }

    protected void onRewardedLoaded(){
        runOnUiThread(() -> {
            log("Rewarded" + LOADED);
            showRewardedButton.setEnabled(true);
        });
    }

    protected void onRewardedLoadFailed(String error){
        runOnUiThread(() -> {
            log("Rewarded"  + FAILED_TO_LOAD + error);
            loadRewardedButton.setEnabled(true);
            showRewardedButton.setEnabled(false);
        });
    }

    protected void onRewardedShowFailed(String error){
        runOnUiThread(() -> {
            log("Rewarded"  + FAILED_TO_SHOW + error);
            loadRewardedButton.setEnabled(true);
            showRewardedButton.setEnabled(false);
        });
    }

    protected void onRewardedShown(){
        runOnUiThread(() -> log("Rewarded" + SHOWN));
    }

    protected void onRewardedImpression(){
        runOnUiThread(() -> log("Rewarded" + IMPRESSION));
    }

    protected void onRewardedClosed(){
        runOnUiThread(() -> {
            log("Rewarded" + CLOSED);
            loadRewardedButton.setEnabled(true);
            showRewardedButton.setEnabled(false);
        });
    }

    protected void onRewardAchieved(){
        runOnUiThread(() -> {
            Toast.makeText(MainActivity.this, "Reward Received", Toast.LENGTH_LONG).show();
            log("Reward Received");
        });

    }

    // Kidoz Banner
    protected void loadBanner(){
        mKidozBannerView.load();
    }
    protected void hideBanner(){
        mKidozBannerView.close();
    }

    // Banner SDK callbacks handler
    protected void onBannerLoaded(){
        runOnUiThread(() -> log("Banner" + LOADED));
    }

    protected void onBannerLoadFailed(String error){
        runOnUiThread(() -> {
            log("Banner" + FAILED_TO_LOAD + error);
            loadBannerButton.setEnabled(true);
            closeBannerButton.setEnabled(false);
        });
    }

    protected void onBannerShown(){
        runOnUiThread(() -> log("Banner" + SHOWN));
    }

    protected void onBannerShowFailed(String error){
        runOnUiThread(() -> {
            log("Banner" + FAILED_TO_SHOW + error);
            loadBannerButton.setEnabled(true);
            closeBannerButton.setEnabled(false);
        });
    }

    protected void onBannerImpression(){
        runOnUiThread(() -> log("Banner" + IMPRESSION));
    }

    protected void onBannerClosed(){
        runOnUiThread(() -> {
            log("Banner" + CLOSED);
            loadBannerButton.setEnabled(true);
            closeBannerButton.setEnabled(false);
        });
    }

    private void createBanner() {
        mKidozBannerView = new KidozBannerView(MainActivity.this);
        mKidozBannerView.setBannerPosition(KidozBannerView.Position.BOTTOM_CENTER);

        mKidozBannerView.setBannerCallback(new KidozBannerAdCallback() {

            @Override
            public void onAdLoaded() {
                onBannerLoaded();
                mKidozBannerView.show();
            }

            @Override
            public void onAdFailedToLoad(KidozError error) {
                onBannerLoadFailed(error.toString());
            }

            @Override
            public void onAdShown() {
                onBannerShown();
            }

            @Override
            public void onAdFailedToShow(KidozError error) {
                onBannerShowFailed(error.toString());
            }

            @Override
            public void onAdImpression() {
                onBannerImpression();
            }

            @Override
            public void onAdClosed() {
                onBannerClosed();
            }
        });
    }
    protected void log(String message){
        Log.d(MainActivity.class.getSimpleName(),message);
        String text = feedbackTV.getText().toString() + message + "\n";
        feedbackTV.setText(text);
        feedbackContainer.post(() -> {
            feedbackContainer.fullScroll(View.FOCUS_DOWN);
        });
    }
}

