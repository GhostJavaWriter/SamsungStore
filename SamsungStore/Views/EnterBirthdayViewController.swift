//
//  EnterBirthdayViewController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 1.01.2023.
//

import UIKit

class EnterBirthdayViewController: UIViewController, FlowController {
    
    var completionHandler: ((String?) -> ())?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Phone:"
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your number"
        textField.borderStyle = .bezel
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Next", for: .normal)
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
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
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            nextButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    // MARK: - Support actions
    private func configureSubviews() {
        
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(nextButton)
        view.backgroundColor = .white
        title = "Enter birthday"
    }
    
    @objc private func nextButtonTapped() {
        completionHandler?(textField.text)
    }
}

