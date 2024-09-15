//
//  SettingsCoordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

enum SettingsRoute {
    case toDetail
}

class SettingsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    typealias T = SettingsRoute
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        let controller = SettingsViewController.instantiate(name: .main)
        controller.coordinator = self
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: SettingsRoute, data: Any?) {
        //
    }
    
    
}
