//
//  AppDelegate.swift
//  UUDeviceCheckModule
//
//  Created by xiaoan.wu on 10/29/2020.
//  Copyright (c) 2020 xiaoan.wu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      window = UIWindow.init(frame: UIScreen.main.bounds)
      window?.backgroundColor = .white
      window?.rootViewController = UINavigationController.init(rootViewController: ViewController())
      window?.makeKeyAndVisible()
      return true
    }
}

