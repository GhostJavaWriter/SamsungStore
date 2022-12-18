//
//  UserEditViewController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 10.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.placeholder = "type your login..."
        label.borderStyle = .bezel
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.placeholder = "type your password ..."
        label.borderStyle = .bezel
        return label
    }()
    
    private lazy var logingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "-"
        label.textColor = .systemGray
        return label
    }()
    
    var viewModel = ViewModel()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureSubviews()
        bindViewModel()
        initialViewState()
    }
    
    // MARK: - Actions
    
    @objc func loginButtonTapped() {
        
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        viewModel.loginButtonTapped(login: login, password: password)
    }
    
    // MARK: - Support functions
    
    func bindViewModel() {
        viewModel.statusLabelText.bind { currentStatus in
            DispatchQueue.main.async {
                self.statusLabel.text = currentStatus
            }
        }
        viewModel.statusLabelColor.bind { currentColor in
            DispatchQueue.main.async {
                self.statusLabel.textColor = currentColor
            }
        }
    }
    
    func initialViewState() {
        statusLabel.textColor = .white
    }
    
    private func configureSubviews() {
        
        view.addSubview(titleLabel)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(logingButton)
        view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logingButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            logingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logingButton.widthAnchor.constraint(equalToConstant: 150),
            statusLabel.topAnchor.constraint(equalTo: logingButton.bottomAnchor, constant: 20),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

