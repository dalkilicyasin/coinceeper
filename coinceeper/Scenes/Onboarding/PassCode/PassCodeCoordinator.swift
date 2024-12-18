//
//  PassCodeCoordinator.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 11.12.2024.
//

import Foundation
import UIKit

enum PassCodeRoute {
    case toOnboarding
    case toConfirmScreen
}


class PassCodeCoordinator: Coordinator {
    typealias T = PassCodeRoute
    
    private lazy var splasyRepository: SplashRepository = {
        return SplashNetworkService(networkManager: self.networkManager)
    }()
    
    lazy var passCodeViewModel: PassCodeViewModel = {
        return PassCodeViewModel()
    }()
    
    var networkManager: NetworkManager
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, networkManager: NetworkManager) {
        self.navigationController = navigationController
        self.networkManager = networkManager
    }
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        DispatchQueue.main.async {
            let controller = PassCodeViewController.instantiate(name: .passCode)
            controller.coordinator = self
            controller.passCodeViewModel = self.passCodeViewModel
           // controller.modalPresentationStyle = .fullScreen
            self.navigationController.present(controller, animated: true)
        }
    }
    
    func navigateTo(to route: T, with data: Any?) {
        switch route {
        case .toOnboarding:
            return
            // TODO: will add pascodePage
        case .toConfirmScreen:
            return
            
            // TODO: will add secondScreen
        }
    }
}
