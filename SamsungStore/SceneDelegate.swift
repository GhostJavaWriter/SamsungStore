//
//  SceneDelegate.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 10.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController()
        let user = User(name: "Bair", city: City(name: "Novosibirsk"))
        coordinator = Coordinator(user: user, navigationController: navigationController)
        coordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

