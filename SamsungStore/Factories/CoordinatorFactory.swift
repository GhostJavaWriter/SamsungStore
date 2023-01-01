//
//  CoordinatorFactory.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 1.01.2023.
//

import UIKit

class CoordinatorFactory {
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        AppCoordinator(navigationController: navigationController)
    }
    
    func createRegistrationCoordinator(navigationController: UINavigationController) -> RegistrationCoordinator {
        RegistrationCoordinator(navigationController: navigationController)
    }
}
