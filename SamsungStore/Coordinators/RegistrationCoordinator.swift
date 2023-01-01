//
//  RegistrationCoordinator.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 21.12.2022.
//

import UIKit

final class RegistrationCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private let moduleFactory = ModuleFactory()
    private var userData = UserData(phoneNumber: nil, password: nil, name: nil, birthday: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showEnterPhoneModule()
    }
    
    private func showEnterPhoneModule() {
        let controller = moduleFactory.createEnterPhoneModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.phoneNumber = value
            self?.showConformPhoneModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showConformPhoneModule() {
        let controller = moduleFactory.createConformPhoneModule()
        controller.completionHandler = { [weak self] value in
            if value {
                self?.showEnterPasswordModule()
            } else {
                // show an error alert
                fatalError("password is wrong")
            }
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterPasswordModule() {
        let controller = moduleFactory.createEnterPasswordModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.password = value
            self?.showEnterNameModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterNameModule() {
        let controller = moduleFactory.createEnterNameModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.name = value
            self?.showEnterBirthdayModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterBirthdayModule() {
        let controller = moduleFactory.createEnterBirthdayModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.birthday = value
            self?.flowCompletionHandler?()
        }
        navigationController.pushViewController(controller, animated: true)
    }
}
