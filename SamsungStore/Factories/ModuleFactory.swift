//
//  ModuleFactory.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 1.01.2023.
//

import Foundation

class ModuleFactory {
    
    func createEnterPhoneModule() -> EnterPhoneViewController {
        EnterPhoneViewController()
    }
    
    func createConformPhoneModule() -> ConformPhoneViewController {
        ConformPhoneViewController()
    }
    
    func createEnterPasswordModule() -> EnterPasswordViewController {
        EnterPasswordViewController()
    }
    
    func createEnterNameModule() -> EnterNameViewController {
        EnterNameViewController()
    }
    
    func createEnterBirthdayModule() -> EnterBirthdayViewController {
        EnterBirthdayViewController()
    }
    
}
