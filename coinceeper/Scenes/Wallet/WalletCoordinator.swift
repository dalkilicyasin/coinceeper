//
//  WalletCoordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

enum WalletRoute {
    case toRoute
}

class WalletCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    typealias T = WalletRoute
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        let controller = WalletViewController.instantiate(name: .main)
        controller.coordinator = self
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: WalletRoute, data: Any?) {
        // TODO: will add navigate
    }
    
}
