//
//  MainViewController.swift
//  SampleApp
//
//  Created by Maria on 25/07/2023.
//

import Foundation
import UIKit
import CommonSampleApp

class MainViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.openMain()
    }
    
    func openMain() {
        BaseMainViewController.launchScreen(viewController: self, mainViewHandler: MainViewHandler())
    }
}
