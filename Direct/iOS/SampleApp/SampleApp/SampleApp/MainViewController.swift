//
//  MainViewController.swift
//  SampleApp
//
//  Created by Maria on 25/07/2023.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.openMain()
        }
    }
    
    func openMain() {
        BaseMainViewController.launchScreen(viewController: self, mainViewHandler: MainViewHandler())
    }
}
