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
            let config = NetworkConfig(baseURL: URL(string: "http://165.232.149.249:5000")!)
            return NetworkManager(config: config)
        }()
    
    var splashCoordinator: SplashCoordinator?

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Coordinator init
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.splashCoordinator = SplashCoordinator(navigationController: UINavigationController(), networkManager: networkManager, window: self.window ?? UIWindow())
        self.splashCoordinator?.start()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

