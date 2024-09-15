//
//  AppDelegate.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Coordinator init
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = TabbarViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

