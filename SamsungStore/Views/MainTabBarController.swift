//
//  MainTabBarController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 2.01.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
//    let explorerTabImage = UIImage(named: <#T##String#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setTabBarApperance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            setupViewController(HomeScreenViewController(), title: "Explorer", iconImage: nil)
        ]
    }
    
    private func setupViewController(_ viewController: UIViewController, title: String, iconImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = iconImage
        return viewController
    }
    
    private func setTabBarApperance() {
        
        let roundLayer = CAShapeLayer()
        let x: CGFloat = 10
        let y: CGFloat = 14
        let width = tabBar.frame.width - x * 2
        let height = tabBar.frame.height + y * 2
        let rect = CGRect(x: x, y: tabBar.bounds.minY - y, width: width, height: height)
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: height / 2.4)
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.tabBarBackground.cgColor
        tabBar.tintColor = UIColor.tabBarItem
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemPositioning = .centered
    }
}
