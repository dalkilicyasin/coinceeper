//
//  AppDelegate.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var networkManager: NetworkManager = {
            let config = NetworkConfig(baseURL: URL(string: "https://ydkulgwkxfxrkghcsdsk.supabase.co")!)
            return NetworkManager(config: config)
        }()
    
    var splashCoordinator: SplashCoordinator?

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Coordinator init
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.splashCoordinator = SplashCoordinator(navigationController: UINavigationController(), networkManager: networkManager)
        self.window?.rootViewController = SplashViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

