//
//  MainViewControllerHandler.swift
//  SampleApp
//
//  Created by Maria on 26/07/2023.
//

import Foundation

@objc public protocol MainViewControllerHandler {
    func setViewController(baseMainViewController: BaseMainViewController)
    func getAppLabel() -> String
    func getSDKVersion() -> String
    func initSDK()
    func loadBanner()
    func closeBanner()
    func loadInterstitial()
    func showInterstitial()
    func loadRewarded()
    func showRewarded()
}
