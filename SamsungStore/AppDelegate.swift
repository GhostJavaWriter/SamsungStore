//
//  AppDelegate.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 10.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: UserEditCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController = UINavigationController()
        let user = User(name: "Baaa", city: City(name: "dasdad"))
        
        coordinator = UserEditCoordinator(user: user, navigationController: navController)
        coordinator.start()
        
        return true
    }
}

