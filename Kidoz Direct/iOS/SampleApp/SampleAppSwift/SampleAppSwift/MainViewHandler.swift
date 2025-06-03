//
//  MainViewHandler.swift
//  KidozIronSourceTestApp
//
//  Created by Yarden Rosenberg on 19/12/2022.
//

import CommonSampleApp
import IronSource

public class MainViewHandler : NSObject, MainViewControllerHandler,ISInitializationDelegate{

    
    
    let kAPPKEY = "1103e2a55"
    var baseMainViewController: BaseMainViewController!
    var bannerView: ISBannerView?

    public func setViewController(baseMainViewController: CommonSampleApp.BaseMainViewController) {
        self.baseMainViewController = baseMainViewController
    }
    
    public func getAppLabel() -> String {
        return "LevelPlay Test App"
    }
    
    public func getSDKVersion() -> String {
        return "9.2.0"
    }
    
    public func initSDK() {
        baseMainViewController.logOut(message: "Initilalizing LevelPlay v" + IronSource.sdkVersion())
        
        IronSource.setLevelPlayRewardedVideoManualDelegate(ISRewardedDelegate(baseMainViewController))
        IronSource.setLevelPlayInterstitialDelegate(ISInterstitialDelegate(baseMainViewController))
        IronSource.setLevelPlayBannerDelegate(ISBannerDelegate(baseMainViewController, mainViewHandler_: self))
        
//        let requestBuilder = LPMInitRequestBuilder(appKey: kAPPKEY)
//                    .withLegacyAdFormats([IS_REWARDED_VIDEO])
////                    .withUserId("UserId")
//        let initRequest = requestBuilder.build()
//        LevelPlay.initWith(initRequest)
//        { [self] config, error in
//            if let error = error {
//                self.baseMainViewController.onSDKInitFailure(error: error.localizedDescription)
//            } else {
//                initializationDidComplete()
//            }
//        }
//        initializationDidComplete()
        IronSource.initWithAppKey(kAPPKEY,delegate: self)
    }
    
    public func initializationDidComplete() {
        DispatchQueue.main.async {
            self.baseMainViewController.onSDKInitSuccess()
        }
    }
    
    public func loadBanner() {
        print("Load Banner pressed")
        let BNSize: ISBannerSize = ISBannerSize(description: "BANNER",width:320 ,height:50)
        IronSource.loadBanner(with: self.baseMainViewController, size: BNSize)
    }
    
    public func closeBanner() {
        if bannerView != nil {
            IronSource.destroyBanner(bannerView!)
        }
    }
    
    public func loadInterstitial() {
        IronSource.loadInterstitial()
    }
    
    public func showInterstitial() {
        IronSource.showInterstitial(with: baseMainViewController)
    }

    // ********************
    
    public func loadRewarded() {
        IronSource.loadRewardedVideo()
    }
    
    public func showRewarded() {
        IronSource.showRewardedVideo(with:baseMainViewController)
    }
    
    
    
    public func onTestCampaignIdsChange() {
        
    }
    
    class ISInterstitialDelegate: NSObject, LevelPlayInterstitialDelegate {
    
        var mainViewController: BaseMainViewController!
        
        init(_ mainViewController_: BaseMainViewController!){
            mainViewController = mainViewController_
        }
        
        func didLoad(with adInfo: ISAdInfo!) {
            mainViewController.onInterstitialLoaded()
        }
        
        func didFailToLoadWithError(_ error: Error!) {
            mainViewController.onInterstitialLoadFailed(error: error.debugDescription)
        }
        
        func didOpen(with adInfo: ISAdInfo!) {
            mainViewController.onInterstitialOpened()
        }
        
        func didShow(with adInfo: ISAdInfo!) {
            mainViewController.onInterstitialOpened()
        }
        
        func didFailToShowWithError(_ error: Error!, andAdInfo adInfo: ISAdInfo!) {
            mainViewController.onInterstitialShowFailed(error: error.debugDescription)
        }
        
        func didClick(with adInfo: ISAdInfo!) {
            
        }
        
        func didClose(with adInfo: ISAdInfo!) {
            mainViewController.onInterstitialClosed()
        }
    }
    
    class ISRewardedDelegate: NSObject, LevelPlayRewardedVideoManualDelegate {
        
        var mainViewController: BaseMainViewController!
        
        init(_ mainViewController_: BaseMainViewController!){
            mainViewController = mainViewController_
        }
        
        func didLoad(with adInfo: ISAdInfo!) {
            mainViewController.onRewardedLoaded()
        }
        
        func didFailToLoadWithError(_ error: Error!) {
            mainViewController.onRewardedLoadFailed(error: error.debugDescription)
        }
        
        func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
            mainViewController.onRewardAchieved()
        }
        
        func didFailToShowWithError(_ error: Error!, andAdInfo adInfo: ISAdInfo!) {
            mainViewController.onRewardedShowFailed(error: error.debugDescription)
        }
        
        func didOpen(with adInfo: ISAdInfo!) {
            mainViewController.onRewardedOpened()
        }
        
        func didClick(_ placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
            
        }
        
        func didClose(with adInfo: ISAdInfo!) {
            mainViewController.onRewardedClosed()
        }
    }
    
    class ISBannerDelegate: NSObject, LevelPlayBannerDelegate {
        var mainViewHandler: MainViewHandler
        var mainViewController: BaseMainViewController!
        
        init(_ mainViewController_: BaseMainViewController!, mainViewHandler_: MainViewHandler){
            mainViewController = mainViewController_
            mainViewHandler = mainViewHandler_
        }
        
        func didLoad(_ bannerView: ISBannerView!, with adInfo: ISAdInfo!) {
            mainViewHandler.bannerView = bannerView
            
            if let view = mainViewController.view {
                if #available(iOS 11.0, *) {
                    bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.size.width/2, y: view.frame.size.height - bannerView.frame.size.height, width: bannerView.frame.size.width, height: bannerView.frame.size.height - view.safeAreaInsets.bottom * 2.5)
                } else {
                    bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.size.width/2, y: view.frame.size.height - bannerView.frame.size.height, width: bannerView.frame.size.width, height: bannerView.frame.size.height  * 2.5)
                }
                view.addSubview(mainViewHandler.bannerView!)
            }

            mainViewController.onBannerLoaded()
        }
        
        func didFailToLoadWithError(_ error: Error!) {
            mainViewController.onBannerLoadFailed(error: error.debugDescription)
        }
        
        func didClick(with adInfo: ISAdInfo!) {
            mainViewController.onBannerOpened()
        }
        
        func didLeaveApplication(with adInfo: ISAdInfo!) {
            mainViewController.onBannerClosed()
        }
        
        func didPresentScreen(with adInfo: ISAdInfo!) {
            
        }
        
        func didDismissScreen(with adInfo: ISAdInfo!) {
            mainViewController.onBannerClosed()
        }

    }
    
}
