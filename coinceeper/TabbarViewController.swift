//
//  TabbarViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. This view controller is intended to be used programmatically.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tabBar.isTranslucent = true
        
        tabBar.tintColor = UIColor(hexString: "#F38337")
        tabBar.unselectedItemTintColor = .black
        
        let walletCoordinator = WalletCoordinator(navigationController: UINavigationController(), networkManager: self.networkManager)
        let swapCoordinator = SwapCoordinator(navigationController: UINavigationController())
        let scanCoordinator = ScanCoordinator(navigationController: UINavigationController())
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        
        walletCoordinator.start()
        swapCoordinator.start()
        scanCoordinator.start()
        settingsCoordinator.start()
        
        viewControllers = [walletCoordinator.navigationController, swapCoordinator.navigationController, scanCoordinator.navigationController, settingsCoordinator.navigationController]
    }
    
}
