//
//  FlowController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 1.01.2023.
//

import Foundation

protocol FlowController {
    
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}
