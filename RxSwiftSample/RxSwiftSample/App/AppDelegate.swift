//
//  AppDelegate.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupSVProgressHUD()
        return true
    }
    
    // TODO: Setup SVProgressHUD
    private func setupSVProgressHUD() {
        SVProgressHUD.setDefaultStyle(.dark)
    }
}
