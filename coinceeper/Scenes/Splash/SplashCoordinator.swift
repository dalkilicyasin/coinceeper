//
//  SettingsCoordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

enum SplashRoute {
    case toTabView
}

class SplashCoordinator: Coordinator {
    
    typealias T = SplashRoute
    
    var window: UIWindow
    
    private lazy var splasyRepository: SplashRepository = {
        return SplashNetworkService(networkManager: self.networkManager)
    }()
    
    lazy var splashViewModel: SplashViewModel = {
        return SplashViewModel(splashRepository: self.splasyRepository)
    }()
    
    var networkManager: NetworkManager
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, networkManager: NetworkManager, window: UIWindow) {
        self.navigationController = navigationController
        self.networkManager = networkManager
        self.window = window
    }
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        let controller = SplashViewController.instantiate(name: .splash)
        controller.coordinator = self
        controller.splashViewModel = self.splashViewModel
        self.window.rootViewController = controller
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: SplashRoute, with data: Any?) {
        
        switch route {
        case .toTabView:
            let controller = TabbarViewController(networkManager: self.networkManager)
            self.window.rootViewController = controller
            self.window.makeKeyAndVisible()
        }
    }
}
