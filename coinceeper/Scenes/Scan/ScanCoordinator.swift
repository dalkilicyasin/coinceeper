//
//  ScanCoordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

enum ScanRoute {
    case toDetail
}

class ScanCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    typealias T = ScanRoute
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        let controller = ScanViewController.instantiate(name: .main)
        controller.coordinator = self
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: ScanRoute, with data: Any?) {
        //TODO: willl add child coordinator
    }
}
