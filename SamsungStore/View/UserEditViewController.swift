//
//  UserEditViewController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 10.12.2022.
//

import UIKit

final class UserEditViewController: UIViewController, UpdateableWithUser {

    // MARK: - Input - to listen
    var user: User? { didSet { updateView() } }
    
    // MARK: - Output - to say to world
    var onSelectCity: (() -> Void)?
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var selectCityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select city", for: .normal)
        button.addTarget(self, action: #selector(selectCityTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    private func selectCityTap() {
        onSelectCity?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateView()
    }
    
    private func updateView() {
        userLabel.text = "User: \(user?.name ?? "")\nCity: \(user?.city?.name ?? "")"
    }
    
    private func setupSubviews() {
        
        view.addSubview(userLabel)
        view.addSubview(selectCityButton)
        
        NSLayoutConstraint.activate([
            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            selectCityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectCityButton.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 15),
        ])
        
    }
}

