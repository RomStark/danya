//
//  AppDelegate.swift
//  danya
//
//  Created by Al Stark on 16.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController()
        let navcontroller = UINavigationController(rootViewController: vc)
        window?.rootViewController = navcontroller
        window?.makeKeyAndVisible()
        return true
    }
}

