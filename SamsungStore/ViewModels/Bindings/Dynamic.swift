//
//  Dynamic.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 16.12.2022.
//

import Foundation

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    
    private var listeners: [Listener] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            for listener in listeners { listener(value) }
        }
    }
    
    func bind(_ listener: @escaping Listener) {
        listeners.append(listener)
        listener(value)
    }
    
    func addListener(listener: @escaping Listener) {
        listeners.append(listener)
    }
    
}
