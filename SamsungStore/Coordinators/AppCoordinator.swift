//
//  AppCoordinator.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 1.01.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isUserRegistered = false
        
        if isUserRegistered {
            showMainFlow()
        } else {
            showRegistrationFlow()
        }
    }
    
    private func showRegistrationFlow() {
        let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)
        childCoordinators.append(registrationCoordinator)
        
        registrationCoordinator.flowCompletionHandler = { [weak self] in
            self?.showMainFlow()
        }
        
        registrationCoordinator.start()
    }
    
    private func showMainFlow() {
        
    }
}
