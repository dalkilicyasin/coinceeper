//
//  CreateWalletCoordinator.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 10.12.2024.
//

import Foundation
import UIKit

enum CreateWalletRoute {
    case toPassCodePage
}

class CreateWalletCoordinator: Coordinator {
    
    typealias T = CreateWalletRoute
    
    private lazy var splasyRepository: SplashRepository = {
        return SplashNetworkService(networkManager: self.networkManager)
    }()
    
    lazy var createWalletViewModel: CreateWalletViewModel = {
        return CreateWalletViewModel(splashRepository: self.splasyRepository)
    }()
    
    var networkManager: NetworkManager
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, networkManager: NetworkManager) {
        self.navigationController = navigationController
        self.networkManager = networkManager
    }
    
    var childCoordinators: [any Coordinator] = []
    
    func start() {
        let controller = CreateWalletViewController.instantiate(name: .createWallet)
        controller.coordinator = self
        controller.createWalletViewModel = self.createWalletViewModel
        self.navigationController.pushViewController(controller, animated: true)
        
    }
    
    func navigateTo(to route: T, with data: Any?) {
        switch route {
        case .toPassCodePage:
            return
            // TODO: will add pascodePage
        }
    }
}
