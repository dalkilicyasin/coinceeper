//
//  Coordinator.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    associatedtype T
    var childCoordinators: [any Coordinator] {get set}
    func start()
    var navigationController: UINavigationController { get }
    func navigateTo(to route: T, with data: Any?)
}

public extension Coordinator {
    func finish(){}
    
    func addChildCoordinator(_ coordinator: any Coordinator){
        self.childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: any Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator}) else {
            print("Child Coordinator not found")
            return
        }
        
        childCoordinators.remove(at: index)
    }
    
    func removeAllChildCoordinators(){
        self.childCoordinators.removeAll()
    }
    
    func popUpToMainPage() {
           // Tüm child coordinators'ı kaldır
        self.removeAllChildCoordinators()
           
           // Ana sayfayı set et ve diğer sayfaları kaldır
        self.navigationController.popToRootViewController(animated: true)
        self.navigationController.tabBarController?.selectedIndex = 0
       }
    
    func dismiss(popUpAllPages: Bool?) {
        if popUpAllPages ?? false {
            DispatchQueue.main.async {
                self.navigationController.popToRootViewController(animated: true)
                self.navigationController.dismiss(animated: true, completion: nil)
            }
        }
    }
}
