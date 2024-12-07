//
//  SettingsCoordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

enum SplashRoute {
    case toDetail
}

class SplashCoordinator: Coordinator {
    typealias T = SplashRoute
    var networkManager: NetworkManager
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, networkManager: NetworkManager) {
        self.navigationController = navigationController
        self.networkManager = networkManager
    }
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        let controller = SplashViewController.instantiate(name: .splash)
        controller.coordinator = self
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: SplashRoute, data: Any?) {
        //
    }
    
    
}
