//
//  MainViewHandler.swift
//  KidozIronSourceTestApp
//
//  Created by Yarden Rosenberg on 19/12/2022.
//

import CommonSampleApp
import IronSource

public class MainViewHandler : NSObject, MainViewControllerHandler{

    
    
    var kAPPKEY = "1103e2a55"
    
    var INT_AD_UNIT_ID: String = "yt2844lu9ja9j4m6"
    
    var REW_AD_UNIT_ID: String = "mnrlvjyt9wae2md8"
    
    var BANNER_AD_UNIT_ID: String = "tbwxrv188d3no9z1"

    
    var baseMainViewController: BaseMainViewController!
    var bannerView: LPMBannerAdView?
    var bannerDelegate: ISBannerDelegate!
    var interstitialAd: LPMInterstitialAd?
    var rewardedAd: LPMRewardedAd?

    public func setViewController(baseMainViewController: CommonSampleApp.BaseMainViewController) {
        self.baseMainViewController = baseMainViewController
    }
    
    public func getAppLabel() -> String {
        return "LevelPlay Test App"
    }
    
    public func getSDKVersion() -> String {
        return "10.0.2"
    }
    
    public func initSDK() {
        baseMainViewController.logOut(message: "Initilalizing LevelPlay SDK::" + LevelPlay.sdkVersion())
        let requestBuilder = LPMInitRequestBuilder(appKey: kAPPKEY)
        let initRequest = requestBuilder.build()
        LevelPlay.initWith(initRequest)
        { [self] config, error in
            if let error = error {
                self.baseMainViewController.onSDKInitFailure(error: error.localizedDescription)
            } else {
                initializationDidComplete()
            }
        }

    }
    
    public func initializationDidComplete() {
        DispatchQueue.main.async { [self] in
            baseMainViewController.onSDKInitSuccess()
            interstitialAd = LPMInterstitialAd(adUnitId: INT_AD_UNIT_ID)
            interstitialAd?.setDelegate(ISInterstitialDelegate(self.baseMainViewController))
            rewardedAd = LPMRewardedAd(adUnitId: REW_AD_UNIT_ID)
            rewardedAd?.setDelegate(ISRewardedDelegate(self.baseMainViewController))
            createBanner()

        }
    }
    
    func createBanner(){
        // Create ad configuration - optional
        let adConfig = LPMBannerAdViewConfigBuilder()
            .set(adSize: LPMAdSize.banner())
            .build()
        // Create the banner view and set the ad unit id
        self.bannerView = LPMBannerAdView(adUnitId: BANNER_AD_UNIT_ID , config: adConfig)
        bannerDelegate = ISBannerDelegate(baseMainViewController, mainViewHandler_: self)
        bannerView?.setDelegate(bannerDelegate)
    }
    
    public func loadBanner() {
        if bannerView != nil {
            bannerView?.loadAd(with: baseMainViewController)
        }
    }
    
    public func closeBanner() {
        if bannerView != nil {
            bannerView?.destroy()
            baseMainViewController.onBannerClosed()
        }
        createBanner()
    }
    
    public func loadInterstitial() {
        interstitialAd?.loadAd()
    }
    
    public func showInterstitial() {
        if ((self.interstitialAd?.isAdReady()) != nil) {
            printInfo(on: baseMainViewController)
            self.interstitialAd?.showAd(viewController: baseMainViewController, placementName: nil as String?)
        }
    }

    // ********************
    
    public func loadRewarded() {
        rewardedAd?.loadAd()
    }
    
    public func showRewarded() {
        if(rewardedAd?.isAdReady() != nil){
            rewardedAd?.showAd(viewController: baseMainViewController, placementName: nil as String?)
        }
    }
    
    func printInfo(on viewController: UIViewController) {
        print("*********************************** MainViewHandler ***********************************")
        print("*********************************** MainViewHandler ***********************************")
        print("*********************************** MainViewHandler ***********************************")
        print("Class: \(type(of: viewController))")
        print("Instance identity: \(ObjectIdentifier(viewController))")
        print("Memory address: \(Unmanaged.passUnretained(viewController).toOpaque())")
        print("View frame: \(viewController.view.frame)")
        print("View bounds: \(viewController.view.bounds)")
        print("View tag: \(viewController.view.tag)")
        print("Accessibility identifier: \(viewController.view.accessibilityIdentifier ?? "nil")")
        print("Child VCs: \(viewController.children.map { type(of: $0) })")

        if let nav = viewController.navigationController {
            print("In Navigation Stack: Yes")
            print("Is root VC: \(nav.viewControllers.first === viewController)")
            print("Total VCs in stack: \(nav.viewControllers.count)")
        } else {
            print("In Navigation Stack: No")
        }
    }
    
    public func onTestCampaignIdsChange() {
        
    }
    
    class ISInterstitialDelegate: NSObject, LPMInterstitialAdDelegate {
    
        var mainViewController: BaseMainViewController!
        
        init(_ mainViewController_: BaseMainViewController!){
            mainViewController = mainViewController_
        }
        
        func didLoadAd(with adInfo: LPMAdInfo) {
            mainViewController.onInterstitialLoaded()
        }
        
        func didFailToLoadAd(withAdUnitId adUnitId: String, error: any Error) {
            mainViewController.onInterstitialLoadFailed(error: error.localizedDescription)
        }
        
        func didDisplayAd(with adInfo: LPMAdInfo) {
            mainViewController.onInterstitialOpened()
        }
        
        func didFailToDisplayAd(with adInfo: LPMAdInfo, error: Error) {
            mainViewController.onInterstitialShowFailed(error: error.localizedDescription)
        }
        
        func didClickAd(with adInfo: LPMAdInfo) {
            
        }
        
        func didChangeAdInfo(_ adInfo: LPMAdInfo) {}

        func didCloseAd(with adInfo: LPMAdInfo) {
            mainViewController.onInterstitialClosed()
        }
    }
    
    class ISRewardedDelegate: NSObject, LPMRewardedAdDelegate {
        
        
        var mainViewController: BaseMainViewController!
        
        init(_ mainViewController_: BaseMainViewController!){
            mainViewController = mainViewController_
        }
        
        func didLoadAd(with adInfo: LPMAdInfo) {
            mainViewController.onRewardedLoaded()
        }
        
        func didFailToLoadAd(withAdUnitId adUnitId: String, error: any Error) {
            mainViewController.onRewardedLoadFailed(error: error.localizedDescription)
        }
        
        func didDisplayAd(with adInfo: LPMAdInfo) {
            mainViewController.onRewardedOpened()
        }
        
        func didFailToDisplayAd(with adInfo: LPMAdInfo, error: Error) {
            mainViewController.onInterstitialShowFailed(error: error.localizedDescription)
        }
        
        func didRewardAd(with adInfo: LPMAdInfo, reward: LPMReward) {
            mainViewController.onRewardAchieved()
        }
        
        func didCloseAd(with adInfo: LPMAdInfo) {
            mainViewController.onRewardedClosed()
        }
    }
    
    class ISBannerDelegate: NSObject, LPMBannerAdViewDelegate {

        
        var mainViewHandler: MainViewHandler
        var mainViewController: BaseMainViewController!
        
        init(_ mainViewController_: BaseMainViewController!, mainViewHandler_: MainViewHandler){
            mainViewController = mainViewController_
            mainViewHandler = mainViewHandler_
        }
        
        func didLoadAd(with adInfo: LPMAdInfo) {

            if let view = mainViewController.view,let bannerView = mainViewHandler.bannerView {
                bannerView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(bannerView)
                NSLayoutConstraint.activate([
                    bannerView.heightAnchor.constraint(equalToConstant: 50),
                    bannerView.widthAnchor.constraint(equalToConstant: 320),
                    bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])
            }

            mainViewController.onBannerLoaded()
        }
        
        func didFailToLoadAd(withAdUnitId adUnitId: String, error: any Error) {
            mainViewController.onBannerLoadFailed(error: error.localizedDescription)
        }
        
        func didDisplayAd(with adInfo: LPMAdInfo) {
            print("Banner didDisplayAd")
            mainViewController.onBannerOpened()
        }
        
        func didFailToDisplayAd(with adInfo: LPMAdInfo, error: Error) {
            mainViewController.onBannerShowFailed(error: error.localizedDescription)
        }
        
    }
    
    private static func topViewController(with rootViewController: UIViewController) -> UIViewController {

        if let tabBarController = rootViewController as? UITabBarController {
            return topViewController(with: tabBarController.selectedViewController!)
        } else if let navContObj = rootViewController as? UINavigationController {
            return topViewController(with: navContObj.visibleViewController!)
        } else if let presentedViewController = rootViewController.presentedViewController, !presentedViewController.isBeingDismissed {
            return topViewController(with: presentedViewController)
        } else {
            for view in rootViewController.view.subviews {
                if let subViewController = view.next as? UIViewController,
                   let presentedViewController = subViewController.presentedViewController,
                   !presentedViewController.isBeingDismissed {
                    return topViewController(with: presentedViewController)
                }
            }
            return rootViewController
        }
    }
    
}
