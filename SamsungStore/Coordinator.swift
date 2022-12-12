//
//  Coordinator.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 12.12.2022.
//

import UIKit

protocol UpdateableWithUser: AnyObject {
    var user: User? { get set }
}

final class Coordinator {
    
    // MARK: - Properties
    
    private var user: User { didSet { updateInterfaces() } }
    private weak var navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(user: User, navigationController: UINavigationController) {
        self.user = user
        self.navigationController = navigationController
    }
    
    func start() {
        showUserEditScreen()
    }
    
    // MARK: - Private implementation
    
    private func showUserEditScreen() {
        
        let controller = UserEditViewController()
        controller.user = user
        controller.onSelectCity = { [weak self] in
            self?.showCitiesScreen()
        }
        navigationController?.pushViewController(controller, animated: false)
    }
    
    private func showCitiesScreen() {
        
        let controller = CitiesViewController()
        controller.onCitySelected = { [weak self] city in
            self?.user.city = city
            self?.navigationController?.popViewController(animated: true)
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func updateInterfaces() {
        
        navigationController?.viewControllers.forEach {
            ($0 as? UpdateableWithUser)?.user = user
        }
    }
}
