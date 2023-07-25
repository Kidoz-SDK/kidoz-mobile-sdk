//
//  MainViewControllerHandler.swift
//  CommonTestApp
//
//  Created by Yarden Rosenberg on 17/08/2022.
//

public protocol MainViewControllerHandler{
    func setViewController(baseMainViewController: BaseMainViewController)
    func getAppLabel() -> String
    func getSDKVersion() -> String
    func initSDK()
    func loadBanner()
    func hideBanner()
    func loadInterstitial()
    func showInterstitial()
    func loadRewarded()
    func showRewarded()
    func onTestCampaignIdsChange()
}
