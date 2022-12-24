//
//  UserEditViewController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 21.12.2022.
//

import UIKit

final class UserEditViewController: UIViewController, UpdateableWithUser {
    
    // MARK: - Input
    
    var user: User? { didSet { updateView() } }
    
    // MARK: - Output
    
    var onSelectCity: (() -> Void)?
    
    // MARK: - UI
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var selectCityButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Select city", for: .normal)
        btn.addTarget(self, action: #selector(selectCityTap), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateView()
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            selectCityButton.centerXAnchor.constraint(equalTo: userLabel.centerXAnchor),
            selectCityButton.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 20),
            selectCityButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    // MARK: - Support actions
    private func configureSubviews() {
        
        view.addSubview(userLabel)
        view.addSubview(selectCityButton)
        view.backgroundColor = .white
    }
    
    // MARK: - Actions
    
    @objc private func selectCityTap() {
        onSelectCity?()
    }
    
    private func updateView() {
        userLabel.text = "User: \(user?.name ?? "-")\n" + "City: \(user?.city.name ?? "-")"
    }
}
