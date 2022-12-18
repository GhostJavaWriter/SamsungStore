//
//  ViewModel.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 16.12.2022.
//

import UIKit

class ViewModel {
    
    var statusLabelText = Dynamic("")
    var statusLabelColor = Dynamic(UIColor.white)
    
    func loginButtonTapped(login: String, password: String) {
        let user = User.users[0]
        if login.lowercased() != user.login || password != user.password {
            statusLabelText.value = "There is no such user or password is incorrect"
            statusLabelColor.value = .red
        } else {
            statusLabelText.value = "You are successfully logged in"
            statusLabelColor.value = .green
        }
    }
    
}
