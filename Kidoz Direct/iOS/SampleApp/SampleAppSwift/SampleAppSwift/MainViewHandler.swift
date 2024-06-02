//
//  MainViewHandler.swift
//  SampleApp
//
//  Created by Maria on 25/07/2023.
//

import Foundation
import KidozSDK
import CommonSampleApp

public class MainViewHandler: NSObject, MainViewControllerHandler, KidozInitDelegate, KidozInterstitialDelegate, KidozRewardedDelegate, KidozBannerDelegate {
    
    var baseMainViewController: BaseMainViewController!
    var bannerView: KidozBannerView!
    var interstitialAd: KidozSDK.KidozInterstitialAd?
    var rewardedAd: KidozSDK.KidozRewardedAd?
    
    public func setViewController(baseMainViewController: BaseMainViewController) {
        self.baseMainViewController = baseMainViewController
    }
    
    public func getAppLabel() -> String {
        return "Kidoz Sample App"
    }
    
    public func getSDKVersion() -> String {
        return Kidoz.instance().getSdkVersion()
    }
    
    public func initSDK() {
        Kidoz.instance().initialize(withPublisherID: "14428", securityToken: "6yAsKUngaG5yC4X5HsRoatKTso40NMoZ", with: self)
    }
    
    public func onInitSuccess() {
        initBannerWithView()
        baseMainViewController.onSDKInitSuccess()
    }
    
    public func onInitError(_ errorMessage: String!) {
        baseMainViewController.onSDKInitFailure(error: errorMessage)
    }
    
    // MARK: - Banner
    public func loadBanner() {
        if Kidoz.instance().isSDKInitialized() {
            bannerView.load()
        } else {
            baseMainViewController.logOut(message: "SDK not initialized")
        }
    }
    
    public func closeBanner() {
        bannerView.close()
        bannerView.removeFromSuperview()
        bannerView = nil
        initBannerWithView()
    }
    
    public func onBannerAdLoaded() {
        baseMainViewController.onBannerLoaded()
    }
    
    public func onBannerAdFailedToLoad(error: KidozSDK.KidozError) {
        baseMainViewController.onBannerLoadFailed(error: error.description)
    }
    
    public func onBannerAdShown() {
        baseMainViewController.onBannerOpened()
    }
    
    public func onBannerAdFailedToShow(error: KidozSDK.KidozError) {
        baseMainViewController.onBannerShowFailed(error: error.description)
    }
    
    public func onBannerAdImpression() {
        baseMainViewController.onBannerImpression()
    }
    
    public func onBannerAdClosed() {
        baseMainViewController.onBannerClosed()
    }
    
    // MARK: - Interstitial ad
    public func loadInterstitial() {
        if Kidoz.instance().isSDKInitialized() {
            KidozInterstitialAd.load(delegate: self)
        } else {
            baseMainViewController.logOut(message: "SDK not initialized")
        }
    }
    
    public func showInterstitial() {
        if interstitialAd != nil && interstitialAd!.isLoaded() {
            interstitialAd!.show(viewController: baseMainViewController)
        } else {
            baseMainViewController.logOut(message: "Interstitial not ready")
        }
    }
    
    public func onInterstitialAdLoaded(ad: KidozSDK.KidozInterstitialAd) {
        self.interstitialAd = ad
        baseMainViewController.onInterstitialLoaded()
    }
    
    public func onInterstitialAdFailedToLoad(error: KidozSDK.KidozError) {
        baseMainViewController.onInterstitialLoadFailed(error: error.description)
    }
    
    public func onInterstitialAdFailedToShow(error: KidozSDK.KidozError) {
        baseMainViewController.onInterstitialShowFailed(error: error.description)
    }
    
    public func onInterstitialAdShown(ad: KidozSDK.KidozInterstitialAd) {
        baseMainViewController.onInterstitialOpened()
    }
    
    public func onInterstitialImpression() {
        baseMainViewController.onInterstitialImpression()
    }
    
    public func onInterstitialAdClosed(ad: KidozSDK.KidozInterstitialAd) {
        baseMainViewController.onInterstitialClosed()
    }
    
    // MARK: - Rewarded ad
    public func loadRewarded() {
        if Kidoz.instance().isSDKInitialized() {
            KidozRewardedAd.load(delegate: self)
        } else {
            baseMainViewController.logOut(message: "SDK not initialized")
        }
    }
    
    public func showRewarded() {
        if rewardedAd != nil && rewardedAd!.isLoaded() {
            rewardedAd!.show(viewController: baseMainViewController)
        } else {
            baseMainViewController.logOut(message: "Rewarded not ready")
        }
    }
    
    public func onRewardedAdLoaded(ad: KidozSDK.KidozRewardedAd) {
        rewardedAd = ad
        baseMainViewController.onRewardedLoaded()
    }
    
    public func onRewardedAdFailedToLoad(error: KidozSDK.KidozError) {
        baseMainViewController.onRewardedLoadFailed(error: error.description)
    }
    
    public func onRewardedAdShown(ad: KidozSDK.KidozRewardedAd) {
        baseMainViewController.onRewardedOpened()
    }
    
    public func onRewardedAdFailedToShow(error: KidozSDK.KidozError) {
        baseMainViewController.onRewardedShowFailed(error: error.description)
    }
    
    public func onRewardedImpression() {
        baseMainViewController.onRewardedImpression()
    }
    
    public func onRewardReceived(ad: KidozSDK.KidozRewardedAd) {
        baseMainViewController.onRewardAchieved()
    }
    
    public func onRewardedAdClosed(ad: KidozSDK.KidozRewardedAd) {
        baseMainViewController.onRewardedClosed()
    }
    
    func initBannerWithView() {
        if let view = baseMainViewController.view {
            bannerView = KidozBannerView()
            bannerView.delegate = self

            // MARK: set autoShow to false if you don't want your banner to show immediately after load
            bannerView.setAutoShow(to: true)

            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
                [NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: baseMainViewController.bottomLayoutGuide,
                    attribute: .top,
                    multiplier: 1,
                    constant: 0),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: KidozBannerView.BANNER_HEIGHT),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: KidozBannerView.BANNER_WIDTH)])
            
        }
    }
}
