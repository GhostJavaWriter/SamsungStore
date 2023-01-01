//
//  Coordinator.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 26.12.2022.
//

import UIKit

typealias CoordinatorHandler = () -> Void

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CoordinatorHandler? { get set }
    
    func start()
}
