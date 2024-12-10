//
//  SettingsCoordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

enum SplashRoute {
    case importWallet
    case createWallet
    case toTabController
    
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
        self.navigationController.viewControllers = [controller]
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
    }
    
    func navigateTo(to route: SplashRoute, with data: Any?) {
        
        switch route {
        case .importWallet:
            return
          // TODO: will direction to do importScreen
        case .createWallet:
            let coordinator = CreateWalletCoordinator(navigationController: self.navigationController, networkManager: self.networkManager)
            self.childCoordinators.append(coordinator)
            coordinator.start()
    
            // TODO: will direction to do createScreen
        case .toTabController:
            let controller = TabbarViewController(networkManager: self.networkManager)
            self.window.rootViewController = controller
            self.window.makeKeyAndVisible()
        }
    }
}
