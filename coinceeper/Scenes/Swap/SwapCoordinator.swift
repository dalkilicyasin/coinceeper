//
//  SwapCoordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

enum SwapRoute {
    case toDetail
}

class SwapCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    typealias T = SwapRoute
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        let controller = SwapViewController.instantiate(name: .main)
        controller.coordinator = self
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: SwapRoute, with data: Any?) {
        // TODO: will add navigate
    }
    
}
