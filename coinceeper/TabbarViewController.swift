//
//  TabbarViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    let walletCoordinator = WalletCoordinator(navigationController: UINavigationController())
    let swapCoordinator = SwapCoordinator(navigationController: UINavigationController())
    let scanCoordinator = ScanCoordinator(navigationController: UINavigationController())
    let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.isTranslucent = true
        
        tabBar.tintColor = UIColor(hexString: "#F38337")
        tabBar.unselectedItemTintColor = .black
        
        walletCoordinator.start()
        swapCoordinator.start()
        scanCoordinator.start()
        settingsCoordinator.start()
        
        viewControllers = [walletCoordinator.navigationController, swapCoordinator.navigationController, scanCoordinator.navigationController, settingsCoordinator.navigationController]
    }

}
