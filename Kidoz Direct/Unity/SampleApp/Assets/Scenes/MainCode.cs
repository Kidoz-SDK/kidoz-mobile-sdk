using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UIElements;

using KidozSDK;

public class MainCode : MonoBehaviour, IScreenLogger
{


    private Text logScreen;
    public GameObject LogScreenContainer;
    private ScrollRect scrollRect;

    private List<string> Eventlog = new List<string>();

    // Start is called before the first frame update
    void Start()
    {

        GameObject.FindGameObjectWithTag("appLabel").GetComponent<Text>().text = "Kidoz Unity Plugin";

        logScreen = LogScreenContainer.GetComponent<Text>();
        scrollRect = GetComponentInChildren<ScrollRect>();
        AddEvent("SDK init..");
        initSDK();
    }

    protected void initSDK()
    {
        Kidoz.SetiOSAppPauseOnBackground(true);

        //Delegates
        Kidoz.initSuccess += onSDKInit;
        Kidoz.initError += onSDKInitFailed;

        Kidoz.onInterstitialLoaded += onInterstitialLoaded;
        Kidoz.onInterstitialFailedToLoad += onInterstitialFailedToLoad;
        Kidoz.onInterstitialShown += onInterstitialShown;
        Kidoz.onInterstitialFailedToShow += onInterstitialFailedToShow;
        Kidoz.onInterstitialImpression += onInterstitialImpression;
        Kidoz.onInterstitialClosed += onInterstitialClosed;


        Kidoz.onRewardedLoaded += onRewardedLoaded;
        Kidoz.onRewardedFailedToLoad += onRewardedFailedToLoad;
        Kidoz.onRewardedShown += onRewardedShown;
        Kidoz.onRewardedFailedToShow += onRewardedFailedToShow;
        Kidoz.onRewardedImpression += onRewardedImpression;
        Kidoz.onRewardedReceived += onRewardedReceived;
        Kidoz.onRewardedClosed += onRewardedClosed;

        Kidoz.onBannerLoaded += onBannerLoaded;
        Kidoz.onBannerFailedToLoad += onBannerFailedToLoad;
        Kidoz.onBannerShown += onBannerShown;
        Kidoz.onBannerFailedToShow += onBannerFailedToShow;
        Kidoz.onBannerImpression += onBannerImpression;
        Kidoz.onBannerClosed += onBannerClosed;

    }

    protected void onSDKInit(string value)
    {
        AddEvent("SDK initialized");
    }

    protected void onSDKInitFailed(string error)
    {
        AddEvent("SDK failed to init: " + error);
    }

    // Banners

    public void loadBanner()
    {
        AddEvent("----- Load Banner --");
        Kidoz.loadBanner(true, Kidoz.BANNER_POSITION.BOTTOM_CENTER);
    }

    public void closeBanner()
    {
        AddEvent("----- Close Banner --");
        Kidoz.hideBanner();
    }

    protected void onBannerLoaded(string value)
    {
        AddEvent("Banner Loaded");
    }

    protected void onBannerFailedToLoad(string value)
    {
        AddEvent("Banner Failed to Load:: " + value);
    }

    protected void onBannerShown(string value)
    {
        AddEvent("Banner Shown");
    }

    protected void onBannerFailedToShow(string value)
    {
        AddEvent("Banner Failed to Show:: " + value);
    }

    protected void onBannerImpression(string value)
    {
        AddEvent("Banner Impression " + value);
    }

    protected void onBannerClosed(string value)
    {
        AddEvent("Banner Closed");
    }

    // Interstitial

    public void loadInterstitial()
    {
        AddEvent("----- Load Interstitial --");
        Kidoz.loadInterstitialAd();
    }

    public void showInterstitial()
    {
        AddEvent("----- Show Interstitial --");
        Kidoz.showInterstitial();
    }

    protected void onInterstitialLoaded(string value)
    {
        AddEvent("Interstitial Loaded");
    }

    protected void onInterstitialFailedToLoad(string value)
    {
        AddEvent("Interstitial Failed to Load:: " + value);
    }

    protected void onInterstitialShown(string value)
    {
        AddEvent("Interstitial Shown");
    }

    protected void onInterstitialFailedToShow(string value)
    {
        AddEvent("Interstitial Failed to Show:: " + value);
    }

    protected void onInterstitialImpression(string value)
    {
        AddEvent("Interstitial Impression");
    }

    protected void onInterstitialClosed(string value)
    {
        AddEvent("Interstitial Closed");
    }

    // Rewarded

    public void loadRewarded()
    {
        AddEvent("----- Load Rewarded --");
        Kidoz.loadRewardedAd();
    }

    public void showRewarded()
    {
        AddEvent("----- Show Rewarded --");
        Kidoz.showRewarded();
    }

    protected void onRewardedLoaded(string value)
    {
        AddEvent("Rewarded Loaded");
    }

    protected void onRewardedFailedToLoad(string value)
    {
        AddEvent("Rewarded Failed to Load:: " + value);
    }

    protected void onRewardedShown(string value)
    {
        AddEvent("Rewarded Shown");
    }

    protected void onRewardedFailedToShow(string value)
    {
        AddEvent("Rewarded Failed to Show:: " + value);
    }

    protected void onRewardedImpression(string value)
    {
        AddEvent("Rewarded Impression " + value);
    }

    protected void onRewardedReceived(string value)
    {
        AddEvent("Reward Received");
    }

    protected void onRewardedClosed(string value)
    {
        AddEvent("Rewarded Closed");
    }

    // Logs

    public void AddEvent(string eventString)
    {
        Eventlog.Add(eventString);

        string text = "";

        foreach (string logEvent in Eventlog)
        {
            text += logEvent;
            text += "\n";
        }
        logScreen.text = text;

        StartCoroutine(AutoScroll());

    }

    IEnumerator AutoScroll()
    {
        // Wait for end of frame AND force update all canvases before setting to bottom.
        yield return new WaitForEndOfFrame();
        Canvas.ForceUpdateCanvases();
        scrollRect.verticalNormalizedPosition = 0f;
        Canvas.ForceUpdateCanvases();
    }

    // Update is called once per frame
    void Update()
    {
        // Make sure user is on Android platform
        if (Application.platform == RuntimePlatform.Android)
        {

            // Check if Back was pressed this frame
            if (Input.GetKeyDown(KeyCode.Escape))
            {

                // Quit the application
                Application.Quit();
            }
        }
    }

}
