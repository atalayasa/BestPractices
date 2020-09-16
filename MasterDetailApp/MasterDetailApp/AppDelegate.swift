//
//  AppDelegate.swift
//  MasterDetailApp
//
//  Created by Atalay Aşa on 10.09.2020.
//  Copyright © 2020 Atalay Aşa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: MasterVC())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

