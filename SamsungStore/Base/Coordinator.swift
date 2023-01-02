//
//  Coordinator.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 26.12.2022.
//

import UIKit

typealias CompletionHandler = () -> Void

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CompletionHandler? { get set }
    
    func start()
}
