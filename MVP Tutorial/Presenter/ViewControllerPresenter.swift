//
//  ViewControllerPresenter.swift
//  MVP Tutorial
//
//  Created by Lucas Daniel on 01/12/18.
//  Copyright © 2018 Smn. All rights reserved.
//

import Foundation

protocol ViewControllerDelegate {
    func showMessage(message: String)
    func userSuccessFullyLoggedIn()
}

class ViewControllerPresenter: NSObject {    
    var user: User!
    var delegate: ViewControllerDelegate!
    var name: String { return user.name }
    var email: String { return user.email }
    var gender: String { return user.gender }
    
    func validateData(userName: String, password: String) {
        if userName.count != 0 {
            if password.count != 0 {
                verify(userName: userName, password: password)
                //self.delegate.showMessage(message: "logged")
            } else {
                self.delegate.showMessage(message: "Password should not be empty")
            }
        } else {
            print(self.delegate)
            self.delegate.showMessage(message: "Username should not be empty")
        }
    }
    
    fileprivate func verify(userName: String, password: String) {
        if userName == "test" && password == "123456" {
            user = User(name: "test", email: "test@gmail.com", gender: "Male")
            self.delegate.userSuccessFullyLoggedIn()
        } else {
            self.delegate.showMessage(message: "Invalid Data")
        }
    }
}
